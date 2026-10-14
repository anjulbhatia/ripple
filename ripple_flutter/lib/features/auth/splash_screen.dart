import 'package:flutter/material.dart';

import '../../theme/ripple_theme.dart';

/// Brand splash. Shows `assets/images/splash.png` once the user drops it
/// into root `assets/` (copied to `ripple_flutter/assets/images/`);
/// until then falls back to the lime drop mark.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: RippleColors.olive,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: 160,
              errorBuilder: (_, _, _) => const Icon(
                Icons.water_drop,
                size: 96,
                color: RippleColors.lime,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Ripple',
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(color: scheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
