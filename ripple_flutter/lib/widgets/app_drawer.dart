import 'package:flutter/material.dart';

import '../shell/app_shell.dart';

/// Left drawer: create action, chats, apps, profile+settings at the end.
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.current,
    required this.onSelect,
    required this.displayName,
    required this.email,
  });

  final ShellTab current;
  final ValueChanged<ShellTab> onSelect;
  final String displayName;
  final String email;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: scheme.primary,
                    foregroundColor: scheme.onPrimary,
                    child: Text(
                      displayName.isEmpty
                          ? '?'
                          : displayName.characters.first.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName.isEmpty ? 'Ripple' : displayName,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (email.isNotEmpty)
                          Text(
                            email,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: scheme.secondary),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: ElevatedButton.icon(
                onPressed: () => onSelect(ShellTab.create),
                icon: const Icon(Icons.add),
                label: const Text('Create New App'),
              ),
            ),
            const Divider(),
            _item(
              context,
              icon: Icons.chat_bubble_outline,
              label: 'Your chats',
              selected: current == ShellTab.create,
              onTap: () => onSelect(ShellTab.create),
            ),
            _item(
              context,
              icon: Icons.widgets_outlined,
              label: 'Your apps',
              selected: current == ShellTab.gallery,
              onTap: () => onSelect(ShellTab.gallery),
            ),
            const Spacer(),
            const Divider(),
            _item(
              context,
              icon: Icons.person_outline,
              label: 'Profile and settings',
              selected: current == ShellTab.profile,
              onTap: () => onSelect(ShellTab.profile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        icon,
        color: selected ? scheme.primary : scheme.onSurface,
      ),
      title: Text(label),
      selected: selected,
      selectedColor: scheme.onSurface,
      selectedTileColor: scheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: onTap,
    );
  }
}
