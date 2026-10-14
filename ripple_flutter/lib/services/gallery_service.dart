import 'package:ripple_client/ripple_client.dart';

import '../client.dart';

/// Thin wrapper over generated Serverpod client for gallery feature.
class GalleryService {
  Future<List<AppDefinition>> listApps() => client.app.listMyApps();

  Future<AppDefinition> createApp({
    required String name,
    String? description,
    required String uiDefinition,
  }) => client.app.createApp(
    name: name,
    description: description,
    uiDefinition: uiDefinition,
  );

  Future<void> deleteApp(int appId) => client.app.deleteApp(appId);
}
