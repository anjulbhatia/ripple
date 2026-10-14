import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';

/// Simple per-app key-value storage scoped to app + user.
class AppDataEndpoint extends Endpoint {
  UuidValue? _ownerId(Session session) => session.authenticated?.authUserId;

  Future<AppData> putData(
    Session session, {
    required int appId,
    required String dataKey,
    String? dataValue,
  }) async {
    final ownerId = _ownerId(session);
    final existing = await AppData.db.findFirstRow(
      session,
      where: (t) =>
          t.appId.equals(appId) &
          t.dataKey.equals(dataKey) &
          (ownerId == null
              ? t.ownerUserId.equals(null)
              : t.ownerUserId.equals(ownerId)),
    );
    if (existing != null) {
      return AppData.db.updateRow(
        session,
        existing.copyWith(
          dataValue: dataValue,
          updatedAt: DateTime.now().toUtc(),
        ),
      );
    }
    return AppData.db.insertRow(
      session,
      AppData(
        ownerUserId: ownerId,
        appId: appId,
        dataKey: dataKey,
        dataValue: dataValue,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<AppData?> getData(
    Session session, {
    required int appId,
    required String dataKey,
  }) async {
    final ownerId = _ownerId(session);
    return AppData.db.findFirstRow(
      session,
      where: (t) =>
          t.appId.equals(appId) &
          t.dataKey.equals(dataKey) &
          (ownerId == null
              ? t.ownerUserId.equals(null)
              : t.ownerUserId.equals(ownerId)),
    );
  }

  Future<List<AppData>> getAllData(Session session, int appId) async {
    final ownerId = _ownerId(session);
    return AppData.db.find(
      session,
      where: (t) =>
          t.appId.equals(appId) &
          (ownerId == null
              ? t.ownerUserId.equals(null)
              : t.ownerUserId.equals(ownerId)),
      limit: 500,
    );
  }

  Future<void> deleteData(
    Session session, {
    required int appId,
    required String dataKey,
  }) async {
    final ownerId = _ownerId(session);
    await AppData.db.deleteWhere(
      session,
      where: (t) =>
          t.appId.equals(appId) &
          t.dataKey.equals(dataKey) &
          (ownerId == null
              ? t.ownerUserId.equals(null)
              : t.ownerUserId.equals(ownerId)),
    );
  }
}
