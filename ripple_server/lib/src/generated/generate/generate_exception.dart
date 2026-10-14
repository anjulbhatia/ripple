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
import 'package:serverpod/serverpod.dart' as _is;
import '../generate/generate_reason.dart' as _im6rqsv3;

abstract class GenerateException
    implements
        _is.SerializableException,
        _is.SerializableModel,
        _is.ProtocolSerialization {
  GenerateException._({
    required this.message,
    required this.reason,
  });

  factory GenerateException({
    required String message,
    required _im6rqsv3.GenerateReason reason,
  }) = _GenerateExceptionImpl;

  factory GenerateException.fromJson(Map<String, dynamic> jsonSerialization) {
    return GenerateException(
      message: jsonSerialization['message'] as String,
      reason: _im6rqsv3.GenerateReason.fromJson(
        (jsonSerialization['reason'] as String),
      ),
    );
  }

  String message;

  _im6rqsv3.GenerateReason reason;

  /// Returns a shallow copy of this [GenerateException]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  GenerateException copyWith({
    String? message,
    _im6rqsv3.GenerateReason? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GenerateException',
      'message': message,
      'reason': reason.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GenerateException',
      'message': message,
      'reason': reason.toJson(),
    };
  }

  @override
  String toString() {
    return 'GenerateException(message: $message, reason: $reason)';
  }
}

class _GenerateExceptionImpl extends GenerateException {
  _GenerateExceptionImpl({
    required String message,
    required _im6rqsv3.GenerateReason reason,
  }) : super._(
         message: message,
         reason: reason,
       );

  /// Returns a shallow copy of this [GenerateException]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  GenerateException copyWith({
    String? message,
    _im6rqsv3.GenerateReason? reason,
  }) {
    return GenerateException(
      message: message ?? this.message,
      reason: reason ?? this.reason,
    );
  }
}
