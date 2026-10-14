import 'package:flutter/material.dart';
import 'package:ripple_client/ripple_client.dart';

import '../../services/gallery_service.dart';

/// Full Your Apps list with open + delete.
class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key, required this.onOpenApp});

  final ValueChanged<AppDefinition> onOpenApp;

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final _gallery = GalleryService();
  Future<List<AppDefinition>>? _future;

  @override
  void initState() {
    super.initState();
    _future = _gallery.listApps();
  }

  void _refresh() => setState(() => _future = _gallery.listApps());

  Future<void> _delete(AppDefinition app) async {
    final id = app.id;
    if (id == null) return;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete "${app.name}"?'),
        content: const Text('This removes the app and its data.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await _gallery.deleteApp(id);
      _refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppDefinition>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Could not load apps.'),
                TextButton(
                  onPressed: _refresh,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        final apps = snapshot.data ?? const [];
        if (apps.isEmpty) {
          return const Center(
            child: Text('No apps yet. Create one to get started.'),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => _refresh(),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: apps.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final app = apps[i];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: Text(
                    app.name.trim().isEmpty
                        ? '?'
                        : app.name.trim().characters.first.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                title: Text(app.name),
                subtitle: app.description != null && app.description!.isNotEmpty
                    ? Text(
                        app.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : null,
                onTap: () => widget.onOpenApp(app),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _delete(app),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
