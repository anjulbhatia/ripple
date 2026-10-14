import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';

/// Private sharing via magic-link tokens.
/// Token is an opaque random string; validation loads the linked app.
class ShareEndpoint extends Endpoint {
  UuidValue? _ownerId(Session session) => session.authenticated?.authUserId;

  Future<MagicLink> createMagicLink(
    Session session, {
    required int appId,
    int validDays = 30,
  }) async {
    final app = await AppDefinition.db.findById(session, appId);
    if (app == null) {
      throw StateError('App $appId not found');
    }
    // Only the owner may share their app.
    final caller = _ownerId(session);
    if (app.ownerUserId != null && app.ownerUserId != caller) {
      throw StateError('Only the app owner can share it');
    }
    final days = validDays.clamp(1, 365);
    final token = const Uuid().v4().replaceAll('-', '');
    final now = DateTime.now().toUtc();
    return MagicLink.db.insertRow(
      session,
      MagicLink(
        token: token,
        appId: appId,
        createdByUserId: caller,
        expiresAt: now.add(Duration(days: days)),
        createdAt: now,
      ),
    );
  }

  /// Returns the shared app if token valid, else null.
  Future<AppDefinition?> openWithMagicLink(
    Session session,
    String token,
  ) async {
    final link = await MagicLink.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token),
    );
    if (link == null || link.revoked) return null;
    if (link.expiresAt != null &&
        link.expiresAt!.isBefore(DateTime.now().toUtc())) {
      return null;
    }
    return AppDefinition.db.findById(session, link.appId);
  }

  Future<void> revokeMagicLink(Session session, String token) async {
    final link = await MagicLink.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token),
    );
    if (link == null) return;
    await MagicLink.db.updateRow(session, link.copyWith(revoked: true));
  }
}
