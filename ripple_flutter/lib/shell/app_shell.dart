import 'package:flutter/material.dart';
import 'package:ripple_client/ripple_client.dart';

import '../features/builder/create_screen.dart';
import '../features/explore/explore_screen.dart';
import '../features/gallery/gallery_screen.dart';
import '../features/home/home_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/runner/runner_screen.dart';
import '../services/auth_service.dart';
import '../widgets/app_drawer.dart';

enum ShellTab { home, explore, create, gallery, profile }

/// Main interface shell: top bar (drawer left, avatar right),
/// left drawer, and tab body. No bottom navigation.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  ShellTab _tab = ShellTab.home;
  String _pendingPrompt = '';
  final _auth = AuthService();
  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _loadIdentity();
  }

  Future<void> _loadIdentity() async {
    final name = await _auth.fetchDisplayName();
    final email = await _auth.fetchEmail();
    if (mounted) {
      setState(() {
        _name = name == 'there' ? '' : name;
        _email = email;
      });
    }
  }

  void _go(ShellTab tab) {
    Navigator.of(context).pop(); // Close the drawer.
    setState(() => _tab = tab);
  }

  void _openApp(AppDefinition app) {
    final id = app.id;
    if (id == null) return;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => RunnerScreen(appId: id, title: app.name),
      ),
    );
  }

  String get _title {
    switch (_tab) {
      case ShellTab.home:
        return 'Ripple';
      case ShellTab.explore:
        return 'Explore';
      case ShellTab.create:
        return 'Create';
      case ShellTab.gallery:
        return 'Your Apps';
      case ShellTab.profile:
        return 'Profile';
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () => setState(() => _tab = ShellTab.profile),
              customBorder: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: scheme.primary,
                foregroundColor: scheme.onPrimary,
                child: _name.isEmpty
                    ? const Icon(Icons.person_outline)
                    : Text(
                        _name.characters.first.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(
        current: _tab,
        onSelect: _go,
        displayName: _name,
        email: _email,
      ),
      body: switch (_tab) {
        ShellTab.home => HomeScreen(
          displayName: _name,
          onOpenApp: _openApp,
          onViewAllApps: () => setState(() => _tab = ShellTab.gallery),
          onViewAllExplore: () => setState(() => _tab = ShellTab.explore),
          onCreate: (prompt) => setState(() {
            _pendingPrompt = prompt;
            _tab = ShellTab.create;
          }),
        ),
        ShellTab.explore => ExploreScreen(onOpenApp: _openApp),
        ShellTab.create => CreateScreen(
          key: ValueKey(_pendingPrompt),
          initialPrompt: _pendingPrompt,
        ),
        ShellTab.gallery => GalleryScreen(onOpenApp: _openApp),
        ShellTab.profile => const ProfileScreen(),
      },
    );
  }
}
