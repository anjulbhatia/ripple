import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import '../generated/protocol.dart';

/// Passwordless email sign-in with a 4-digit OTP code.
///
/// Serverpod's email provider only supports password login, so this
/// endpoint implements the project's no-password flow on top of the
/// standard auth services: successful verification mints a real
/// Serverpod session via the registered token manager.
///
/// Flow: `requestCode(email)` -> user reads code -> `verifyCode(email,
/// code)` returns [AuthSuccess]; client stores it with
/// `client.auth.updateSignedInUser(...)`.
///
/// Code delivery is currently the server log (same as Serverpod's own
/// dev behavior for verification codes). Plug a real email sender into
/// [_deliverCode] before production.
class OtpAuthEndpoint extends Endpoint {
  static const codeValidity = Duration(minutes: 10);
  static const maxAttempts = 5;

  String _hash(String email, String code) =>
      sha256.convert(utf8.encode('$email:$code')).toString();

  Future<void> _deliverCode(
    Session session,
    String email,
    String code,
  ) async {
    // TODO: send via transactional email in staging/production.
    session.log('OTP code for $email: $code');
  }

  /// Issues a fresh 4-digit code for [email], invalidating older ones.
  Future<void> requestCode(Session session, String email) async {
    final normalized = email.trim().toLowerCase();
    if (!normalized.contains('@') || !normalized.contains('.')) {
      throw OtpAuthException(
        message: 'Enter a valid email address.',
        reason: OtpAuthReason.invalidEmail,
      );
    }

    await OtpChallenge.db.deleteWhere(
      session,
      where: (t) => t.email.equals(normalized),
    );

    final code =
        (Random.secure().nextInt(9000) + 1000).toString();
    await OtpChallenge.db.insertRow(
      session,
      OtpChallenge(
        email: normalized,
        codeHash: _hash(normalized, code),
        expiresAt: DateTime.now().toUtc().add(codeValidity),
        createdAt: DateTime.now().toUtc(),
      ),
    );

    await _deliverCode(session, normalized, code);
  }

  /// Verifies [code] and signs the user in (creating the account on
  /// first use). Returns a session the client must store via
  /// `client.auth.updateSignedInUser`.
  Future<AuthSuccess> verifyCode(
    Session session,
    String email,
    String code,
  ) async {
    final normalized = email.trim().toLowerCase();
    final now = DateTime.now().toUtc();

    final challenge = await OtpChallenge.db.findFirstRow(
      session,
      where: (t) => t.email.equals(normalized) & t.consumed.equals(false),
      orderByList: (t) => [t.createdAt.desc()],
    );
    if (challenge == null) {
      throw OtpAuthException(
        message: 'No active code for this email. Request a new one.',
        reason: OtpAuthReason.invalidCode,
      );
    }
    if (challenge.expiresAt.isBefore(now)) {
      await OtpChallenge.db.deleteRow(session, challenge);
      throw OtpAuthException(
        message: 'Code expired. Request a new one.',
        reason: OtpAuthReason.expired,
      );
    }
    if (challenge.attempts >= maxAttempts) {
      await OtpChallenge.db.deleteRow(session, challenge);
      throw OtpAuthException(
        message: 'Too many attempts. Request a new code.',
        reason: OtpAuthReason.tooManyAttempts,
      );
    }
    if (_hash(normalized, code.trim()) != challenge.codeHash) {
      await OtpChallenge.db.updateRow(
        session,
        challenge.copyWith(attempts: challenge.attempts + 1),
      );
      throw OtpAuthException(
        message: 'Wrong code. Try again.',
        reason: OtpAuthReason.invalidCode,
      );
    }
    await OtpChallenge.db.updateRow(
      session,
      challenge.copyWith(consumed: true),
    );

    final services = AuthServices.instance;
    final profiles = await services.userProfiles.admin.listUserProfiles(
      session,
      email: normalized,
      limit: 1,
    );

    late final UuidValue authUserId;
    late final Set<Scope> scopes;
    if (profiles.isEmpty) {
      final user = await services.authUsers.create(session);
      await services.userProfiles.createUserProfile(
        session,
        user.id,
        UserProfileData(email: normalized),
      );
      authUserId = user.id;
      scopes = user.scopes;
    } else {
      authUserId = profiles.first.authUserId;
      final authUser = await services.authUsers.get(
        session,
        authUserId: authUserId,
      );
      scopes = authUser.scopes;
    }

    return services.tokenManager.issueToken(
      session,
      authUserId: authUserId,
      method: 'otp',
      scopes: scopes,
    );
  }
}
