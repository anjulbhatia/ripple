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

abstract class MagicLink
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  MagicLink._({
    this.id,
    required this.token,
    required this.appId,
    this.createdByUserId,
    this.expiresAt,
    bool? revoked,
    DateTime? createdAt,
  }) : revoked = revoked ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory MagicLink({
    int? id,
    required String token,
    required int appId,
    _isc.UuidValue? createdByUserId,
    DateTime? expiresAt,
    bool? revoked,
    DateTime? createdAt,
  }) = _MagicLinkImpl;

  factory MagicLink.fromJson(Map<String, dynamic> jsonSerialization) {
    return MagicLink(
      id: jsonSerialization['id'] as int?,
      token: jsonSerialization['token'] as String,
      appId: jsonSerialization['appId'] as int,
      createdByUserId: jsonSerialization['createdByUserId'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(
              jsonSerialization['createdByUserId'],
            ),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      revoked: jsonSerialization['revoked'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['revoked']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String token;

  int appId;

  _isc.UuidValue? createdByUserId;

  DateTime? expiresAt;

  bool revoked;

  DateTime createdAt;

  /// Returns a shallow copy of this [MagicLink]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  MagicLink copyWith({
    int? id,
    String? token,
    int? appId,
    _isc.UuidValue? createdByUserId,
    DateTime? expiresAt,
    bool? revoked,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MagicLink',
      if (id != null) 'id': id,
      'token': token,
      'appId': appId,
      if (createdByUserId != null) 'createdByUserId': createdByUserId?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'revoked': revoked,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MagicLink',
      if (id != null) 'id': id,
      'token': token,
      'appId': appId,
      if (createdByUserId != null) 'createdByUserId': createdByUserId?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'revoked': revoked,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MagicLinkImpl extends MagicLink {
  _MagicLinkImpl({
    int? id,
    required String token,
    required int appId,
    _isc.UuidValue? createdByUserId,
    DateTime? expiresAt,
    bool? revoked,
    DateTime? createdAt,
  }) : super._(
         id: id,
         token: token,
         appId: appId,
         createdByUserId: createdByUserId,
         expiresAt: expiresAt,
         revoked: revoked,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [MagicLink]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  MagicLink copyWith({
    Object? id = _Undefined,
    String? token,
    int? appId,
    Object? createdByUserId = _Undefined,
    Object? expiresAt = _Undefined,
    bool? revoked,
    DateTime? createdAt,
  }) {
    return MagicLink(
      id: id is int? ? id : this.id,
      token: token ?? this.token,
      appId: appId ?? this.appId,
      createdByUserId: createdByUserId is _isc.UuidValue?
          ? createdByUserId
          : this.createdByUserId,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      revoked: revoked ?? this.revoked,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
