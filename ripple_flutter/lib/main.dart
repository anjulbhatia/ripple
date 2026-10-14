import 'package:flutter/material.dart';

import 'client.dart';
import 'features/auth/auth_gate.dart';
import 'features/auth/splash_screen.dart';
import 'shell/app_shell.dart';
import 'theme/ripple_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ripple',
      theme: RippleTheme.light,
      darkTheme: RippleTheme.dark,
      themeMode: ThemeMode.system,
      home: const _Boot(),
    );
  }
}

/// Brief brand splash, then auth gate, then the app shell.
class _Boot extends StatefulWidget {
  const _Boot();

  @override
  State<_Boot> createState() => _BootState();
}

class _BootState extends State<_Boot> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) setState(() => _ready = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) return const SplashScreen();
    return const AuthGate(child: AppShell());
  }
}
