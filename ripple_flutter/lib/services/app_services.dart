import 'package:ripple_client/ripple_client.dart';

import '../client.dart';

/// Per-app key-value storage via Serverpod.
class AppDataService {
  Future<AppData?> getValue(int appId, String key) =>
      client.appData.getData(appId: appId, dataKey: key);

  Future<AppData> setValue(int appId, String key, String? value) =>
      client.appData.putData(appId: appId, dataKey: key, dataValue: value);

  Future<List<AppData>> getAll(int appId) => client.appData.getAllData(appId);
}

/// Magic-link sharing via Serverpod.
class SharingService {
  Future<MagicLink> createLink(int appId) =>
      client.share.createMagicLink(appId: appId, validDays: 30);

  Future<AppDefinition?> openLink(String token) =>
      client.share.openWithMagicLink(token);

  Future<void> revokeLink(String token) => client.share.revokeMagicLink(token);
}
