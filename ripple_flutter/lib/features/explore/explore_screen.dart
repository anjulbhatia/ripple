import 'package:flutter/material.dart';
import 'package:ripple_client/ripple_client.dart';

import '../../services/gallery_service.dart';
import '../../widgets/app_tile.dart';

/// Published apps browser.
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key, required this.onOpenApp});

  final ValueChanged<AppDefinition> onOpenApp;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppDefinition>>(
      future: GalleryService().listPublished(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Could not load Explore.'));
        }
        final apps = snapshot.data ?? const [];
        if (apps.isEmpty) {
          return const Center(
            child: Text(
              'Nothing published yet. Publish an app to see it here.',
            ),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.72,
          ),
          itemCount: apps.length,
          itemBuilder: (context, i) => AppTile(
            app: apps[i],
            onOpen: () => onOpenApp(apps[i]),
          ),
        );
      },
    );
  }
}
