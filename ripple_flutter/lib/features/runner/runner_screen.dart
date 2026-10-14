import 'package:flutter/material.dart';

import '../../services/gallery_service.dart';
import '../../ui_engine/ui_engine.dart';

/// Opens a saved app: renders its declarative UI.
/// Server-backed values land with the data-storage step.
class RunnerScreen extends StatelessWidget {
  const RunnerScreen({super.key, required this.appId, required this.title});

  final int appId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder(
        future: GalleryService().getApp(appId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final app = snapshot.data;
          if (snapshot.hasError || app == null) {
            return const Center(child: Text('Could not open this app.'));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: UiRenderer(definitionJson: app.uiDefinition),
          );
        },
      ),
    );
  }
}
