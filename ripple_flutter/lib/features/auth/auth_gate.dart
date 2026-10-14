import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../client.dart';
import 'otp_screen.dart';

/// Shows [child] when signed in, [OtpScreen] otherwise.
/// Rebuilds automatically via the auth session manager.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: client.auth.authInfoListenable,
      builder: (context, authInfo, _) {
        if (authInfo == null) return const OtpScreen();
        return child;
      },
    );
  }
}
