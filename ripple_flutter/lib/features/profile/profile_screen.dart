import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

/// Profile + settings: identity, sign out, app info.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = AuthService();
  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final name = await _auth.fetchDisplayName();
    final email = await _auth.fetchEmail();
    if (mounted) {
      setState(() {
        _name = name == 'there' ? '' : name;
        _email = email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: scheme.primary,
                foregroundColor: scheme.onPrimary,
                child: _name.isEmpty
                    ? const Icon(Icons.person_outline, size: 40)
                    : Text(
                        _name.characters.first.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
              const SizedBox(height: 12),
              Text(
                _name.isEmpty ? 'Ripple user' : _name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              if (_email.isNotEmpty)
                Text(
                  _email,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: scheme.secondary),
                ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text('Settings', style: Theme.of(context).textTheme.titleMedium),
        ListTile(
          leading: Icon(
            Theme.of(context).brightness == Brightness.dark
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
          title: const Text('Appearance'),
          subtitle: const Text('Follows your system theme'),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Sign out'),
          onTap: () => _auth.signOut(),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'Ripple MVP — personal apps, no passwords, no servers to babysit.',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: scheme.secondary),
          ),
        ),
      ],
    );
  }
}
