import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';

/// Gallery + CRUD for personal apps.
///
/// Auth: open for MVP (anonymous allowed, ownerUserId nullable).
/// When signed in, creates are stamped with the auth user and
/// [listMyApps] returns only that user's apps.
class AppEndpoint extends Endpoint {
  UuidValue? _ownerId(Session session) => session.authenticated?.authUserId;

  Future<AppDefinition> createApp(
    Session session, {
    required String name,
    String? description,
    required String uiDefinition,
  }) async {
    final now = DateTime.now().toUtc();
    final app = AppDefinition(
      ownerUserId: _ownerId(session),
      name: name,
      description: description,
      uiDefinition: uiDefinition,
      createdAt: now,
      updatedAt: now,
    );
    return AppDefinition.db.insertRow(session, app);
  }

  Future<List<AppDefinition>> listMyApps(Session session) async {
    // Gallery is personal: anonymous callers see nothing.
    final ownerId = _ownerId(session);
    if (ownerId == null) return [];
    return AppDefinition.db.find(
      session,
      where: (t) => t.ownerUserId.equals(ownerId),
      orderByList: (t) => [t.updatedAt.desc()],
      limit: 100,
    );
  }

  Future<AppDefinition?> getApp(Session session, int appId) async {
    return AppDefinition.db.findById(session, appId);
  }

  Future<AppDefinition> updateApp(
    Session session, {
    required int appId,
    String? name,
    String? description,
    String? uiDefinition,
    bool? isPublished,
  }) async {
    final existing = await AppDefinition.db.findById(session, appId);
    if (existing == null) {
      throw StateError('App $appId not found');
    }
    final updated = existing.copyWith(
      name: name ?? existing.name,
      description: description ?? existing.description,
      uiDefinition: uiDefinition ?? existing.uiDefinition,
      isPublished: isPublished ?? existing.isPublished,
      updatedAt: DateTime.now().toUtc(),
    );
    return AppDefinition.db.updateRow(session, updated);
  }

  Future<void> deleteApp(Session session, int appId) async {
    // Cascade manually (no FK relations by design): data + links first.
    await AppData.db.deleteWhere(
      session,
      where: (t) => t.appId.equals(appId),
    );
    await MagicLink.db.deleteWhere(
      session,
      where: (t) => t.appId.equals(appId),
    );
    await AppDefinition.db.deleteWhere(
      session,
      where: (t) => t.id.equals(appId),
    );
  }

  Future<List<AppDefinition>> listPublished(Session session) async {
    return AppDefinition.db.find(
      session,
      where: (t) => t.isPublished.equals(true),
      orderByList: (t) => [t.updatedAt.desc()],
      limit: 100,
    );
  }
}
