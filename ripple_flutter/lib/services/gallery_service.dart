import 'package:ripple_client/ripple_client.dart';

import '../client.dart';

/// Thin wrapper over generated Serverpod client for gallery feature.
class GalleryService {
  Future<List<AppDefinition>> listApps() => client.app.listMyApps();

  Future<List<AppDefinition>> listPublished() => client.app.listPublished();

  Future<AppDefinition?> getApp(int appId) => client.app.getApp(appId);

  Future<AppDefinition> createApp({
    required String name,
    String? description,
    required String uiDefinition,
  }) => client.app.createApp(
    name: name,
    description: description,
    uiDefinition: uiDefinition,
  );

  Future<AppDefinition> updateApp({
    required int appId,
    String? name,
    String? description,
    String? uiDefinition,
    bool? isPublished,
  }) => client.app.updateApp(
    appId: appId,
    name: name,
    description: description,
    uiDefinition: uiDefinition,
    isPublished: isPublished,
  );

  Future<void> deleteApp(int appId) => client.app.deleteApp(appId);
}
