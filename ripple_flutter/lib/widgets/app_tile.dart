import 'package:flutter/material.dart';
import 'package:ripple_client/ripple_client.dart';

import '../theme/ripple_theme.dart';

/// Compact app icon tile: rounded mark + name. Used in 5-column grids.
class AppTile extends StatelessWidget {
  const AppTile({super.key, required this.app, this.onOpen});

  final AppDefinition app;
  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final initial = app.name.trim().isEmpty
        ? '?'
        : app.name.trim().characters.first.toUpperCase();
    final lime = app.id != null && app.id! % 2 == 0;
    return InkWell(
      onTap: onOpen,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: lime
                    ? RippleColors.lime
                    : scheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(18),
                border: lime ? null : Border.all(color: scheme.outline),
              ),
              alignment: Alignment.center,
              child: Text(
                initial,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: lime ? RippleColors.olive : scheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            app.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
