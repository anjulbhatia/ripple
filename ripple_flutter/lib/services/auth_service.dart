import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../client.dart';

/// Passwordless sign-in via the server's 4-digit email OTP.
///
/// Successful verification stores the session with the standard
/// auth session manager, so `client.auth.isAuthenticated` and
/// `authInfoListenable` work as usual.
class AuthService {
  Future<void> requestCode(String email) => client.otpAuth.requestCode(email);

  Future<void> verifyCodeAndSignIn({
    required String email,
    required String code,
  }) async {
    final auth = await client.otpAuth.verifyCode(email, code);
    await client.auth.updateSignedInUser(auth);
  }

  Future<void> signOut() => client.auth.signOutDevice();

  bool get isSignedIn => client.auth.isAuthenticated;

  /// Display name for greetings: profile userName, else fullName,
  /// else email handle, else 'there'.
  Future<String> fetchDisplayName() async {
    try {
      final profile = await client.modules.serverpod_auth_core.userProfileInfo
          .get();
      final userName = profile.userName?.trim();
      if (userName != null && userName.isNotEmpty) return userName;
      final fullName = profile.fullName?.trim();
      if (fullName != null && fullName.isNotEmpty) return fullName;
      final email = profile.email ?? '';
      final handle = email.split('@').first.trim();
      if (handle.isNotEmpty) return handle;
    } catch (_) {
      // Offline or not signed in: fall through to default.
    }
    return 'there';
  }

  Future<String> fetchEmail() async {
    try {
      final profile = await client.modules.serverpod_auth_core.userProfileInfo
          .get();
      return profile.email ?? '';
    } catch (_) {
      return '';
    }
  }
}
