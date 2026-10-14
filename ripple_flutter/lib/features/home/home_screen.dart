import 'package:flutter/material.dart';
import 'package:ripple_client/ripple_client.dart';

import '../../services/gallery_service.dart';
import '../../widgets/app_tile.dart';
import '../../widgets/section_header.dart';

/// Home: greeting, Your Apps 2x5 grid, Explore 2x5 grid, create prompt.
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.displayName,
    required this.onOpenApp,
    required this.onViewAllApps,
    required this.onViewAllExplore,
    required this.onCreate,
  });

  final String displayName;
  final ValueChanged<AppDefinition> onOpenApp;
  final VoidCallback onViewAllApps;
  final VoidCallback onViewAllExplore;
  final ValueChanged<String> onCreate;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _gallery = GalleryService();
  final _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.displayName.isEmpty ? 'there' : widget.displayName;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      children: [
        Text(
          'Hi $name,',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        SectionHeader(title: 'Your Apps', onViewAll: widget.onViewAllApps),
        const SizedBox(height: 8),
        FutureBuilder<List<AppDefinition>>(
          future: _gallery.listApps(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Could not load apps. Start the server?'),
              );
            }
            final apps = snapshot.data ?? const [];
            if (apps.isEmpty) {
              return _emptyState(
                context,
                'No apps yet. Describe one below to create it.',
              );
            }
            return _grid(apps.take(10).toList());
          },
        ),
        const SizedBox(height: 20),
        SectionHeader(
          title: 'Explore Apps',
          onViewAll: widget.onViewAllExplore,
        ),
        const SizedBox(height: 8),
        FutureBuilder<List<AppDefinition>>(
          future: _gallery.listPublished(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError || (snapshot.data ?? []).isEmpty) {
              return _emptyState(context, 'Nothing published yet.');
            }
            return _grid(snapshot.data!.take(10).toList());
          },
        ),
        const SizedBox(height: 24),
        _promptBar(context),
      ],
    );
  }

  Widget _grid(List<AppDefinition> apps) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount: apps.length,
      itemBuilder: (context, i) => AppTile(
        app: apps[i],
        onOpen: () => widget.onOpenApp(apps[i]),
      ),
    );
  }

  Widget _emptyState(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  Widget _promptBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _promptController,
              decoration: const InputDecoration(
                hintText: 'Describe an app to create…',
                border: InputBorder.none,
                filled: false,
              ),
              onSubmitted: _submitPrompt,
            ),
          ),
          IconButton.filled(
            onPressed: () => _submitPrompt(_promptController.text),
            icon: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }

  void _submitPrompt(String value) {
    if (value.trim().isEmpty) return;
    widget.onCreate(value.trim());
  }
}
