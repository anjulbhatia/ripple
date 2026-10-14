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

abstract class OtpChallenge
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  OtpChallenge._({
    this.id,
    required this.email,
    required this.codeHash,
    required this.expiresAt,
    int? attempts,
    bool? consumed,
    DateTime? createdAt,
  }) : attempts = attempts ?? 0,
       consumed = consumed ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory OtpChallenge({
    int? id,
    required String email,
    required String codeHash,
    required DateTime expiresAt,
    int? attempts,
    bool? consumed,
    DateTime? createdAt,
  }) = _OtpChallengeImpl;

  factory OtpChallenge.fromJson(Map<String, dynamic> jsonSerialization) {
    return OtpChallenge(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      codeHash: jsonSerialization['codeHash'] as String,
      expiresAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      attempts: jsonSerialization['attempts'] as int?,
      consumed: jsonSerialization['consumed'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['consumed']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String email;

  String codeHash;

  DateTime expiresAt;

  int attempts;

  bool consumed;

  DateTime createdAt;

  /// Returns a shallow copy of this [OtpChallenge]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  OtpChallenge copyWith({
    int? id,
    String? email,
    String? codeHash,
    DateTime? expiresAt,
    int? attempts,
    bool? consumed,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OtpChallenge',
      if (id != null) 'id': id,
      'email': email,
      'codeHash': codeHash,
      'expiresAt': expiresAt.toJson(),
      'attempts': attempts,
      'consumed': consumed,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OtpChallenge',
      if (id != null) 'id': id,
      'email': email,
      'codeHash': codeHash,
      'expiresAt': expiresAt.toJson(),
      'attempts': attempts,
      'consumed': consumed,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OtpChallengeImpl extends OtpChallenge {
  _OtpChallengeImpl({
    int? id,
    required String email,
    required String codeHash,
    required DateTime expiresAt,
    int? attempts,
    bool? consumed,
    DateTime? createdAt,
  }) : super._(
         id: id,
         email: email,
         codeHash: codeHash,
         expiresAt: expiresAt,
         attempts: attempts,
         consumed: consumed,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [OtpChallenge]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  OtpChallenge copyWith({
    Object? id = _Undefined,
    String? email,
    String? codeHash,
    DateTime? expiresAt,
    int? attempts,
    bool? consumed,
    DateTime? createdAt,
  }) {
    return OtpChallenge(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      codeHash: codeHash ?? this.codeHash,
      expiresAt: expiresAt ?? this.expiresAt,
      attempts: attempts ?? this.attempts,
      consumed: consumed ?? this.consumed,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
