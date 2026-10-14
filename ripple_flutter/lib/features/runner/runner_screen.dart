import 'package:flutter/material.dart';

import '../../services/app_services.dart';
import '../../services/gallery_service.dart';
import '../../ui_engine/ui_engine.dart';

/// Opens a saved app: renders its declarative UI with Serverpod-backed
/// values (loaded on open, persisted on every change).
class RunnerScreen extends StatefulWidget {
  const RunnerScreen({super.key, required this.appId, required this.title});

  final int appId;
  final String title;

  @override
  State<RunnerScreen> createState() => _RunnerScreenState();
}

class _RunnerScreenState extends State<RunnerScreen> {
  final _data = AppDataService();

  Object? _decode(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    if (raw == 'true') return true;
    if (raw == 'false') return false;
    return num.tryParse(raw) ?? raw;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: GalleryService().getApp(widget.appId),
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
            child: UiRenderer(
              definitionJson: app.uiDefinition,
              loadValues: () async {
                final rows = await _data.getAll(widget.appId);
                return {
                  for (final row in rows) row.dataKey: _decode(row.dataValue),
                };
              },
              saveValue: (key, value) async {
                await _data.setValue(
                  widget.appId,
                  key,
                  value?.toString(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
