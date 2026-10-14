/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../auth/otp_auth_reason.dart' as _in4gjjul;

abstract class OtpAuthException
    implements
        _isc.SerializableException,
        _isc.SerializableModel,
        _isc.ProtocolSerialization {
  OtpAuthException._({
    required this.message,
    required this.reason,
  });

  factory OtpAuthException({
    required String message,
    required _in4gjjul.OtpAuthReason reason,
  }) = _OtpAuthExceptionImpl;

  factory OtpAuthException.fromJson(Map<String, dynamic> jsonSerialization) {
    return OtpAuthException(
      message: jsonSerialization['message'] as String,
      reason: _in4gjjul.OtpAuthReason.fromJson(
        (jsonSerialization['reason'] as String),
      ),
    );
  }

  String message;

  _in4gjjul.OtpAuthReason reason;

  /// Returns a shallow copy of this [OtpAuthException]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  OtpAuthException copyWith({
    String? message,
    _in4gjjul.OtpAuthReason? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OtpAuthException',
      'message': message,
      'reason': reason.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OtpAuthException',
      'message': message,
      'reason': reason.toJson(),
    };
  }

  @override
  String toString() {
    return 'OtpAuthException(message: $message, reason: $reason)';
  }
}

class _OtpAuthExceptionImpl extends OtpAuthException {
  _OtpAuthExceptionImpl({
    required String message,
    required _in4gjjul.OtpAuthReason reason,
  }) : super._(
         message: message,
         reason: reason,
       );

  /// Returns a shallow copy of this [OtpAuthException]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  OtpAuthException copyWith({
    String? message,
    _in4gjjul.OtpAuthReason? reason,
  }) {
    return OtpAuthException(
      message: message ?? this.message,
      reason: reason ?? this.reason,
    );
  }
}
