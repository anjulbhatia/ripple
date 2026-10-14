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

abstract class AppData
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AppData._({
    this.id,
    this.ownerUserId,
    required this.appId,
    required this.dataKey,
    this.dataValue,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  factory AppData({
    int? id,
    _isc.UuidValue? ownerUserId,
    required int appId,
    required String dataKey,
    String? dataValue,
    DateTime? updatedAt,
  }) = _AppDataImpl;

  factory AppData.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppData(
      id: jsonSerialization['id'] as int?,
      ownerUserId: jsonSerialization['ownerUserId'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(
              jsonSerialization['ownerUserId'],
            ),
      appId: jsonSerialization['appId'] as int,
      dataKey: jsonSerialization['dataKey'] as String,
      dataValue: jsonSerialization['dataValue'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _isc.UuidValue? ownerUserId;

  int appId;

  String dataKey;

  String? dataValue;

  DateTime updatedAt;

  /// Returns a shallow copy of this [AppData]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AppData copyWith({
    int? id,
    _isc.UuidValue? ownerUserId,
    int? appId,
    String? dataKey,
    String? dataValue,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppData',
      if (id != null) 'id': id,
      if (ownerUserId != null) 'ownerUserId': ownerUserId?.toJson(),
      'appId': appId,
      'dataKey': dataKey,
      if (dataValue != null) 'dataValue': dataValue,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppData',
      if (id != null) 'id': id,
      if (ownerUserId != null) 'ownerUserId': ownerUserId?.toJson(),
      'appId': appId,
      'dataKey': dataKey,
      if (dataValue != null) 'dataValue': dataValue,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppDataImpl extends AppData {
  _AppDataImpl({
    int? id,
    _isc.UuidValue? ownerUserId,
    required int appId,
    required String dataKey,
    String? dataValue,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         ownerUserId: ownerUserId,
         appId: appId,
         dataKey: dataKey,
         dataValue: dataValue,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [AppData]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AppData copyWith({
    Object? id = _Undefined,
    Object? ownerUserId = _Undefined,
    int? appId,
    String? dataKey,
    Object? dataValue = _Undefined,
    DateTime? updatedAt,
  }) {
    return AppData(
      id: id is int? ? id : this.id,
      ownerUserId: ownerUserId is _isc.UuidValue?
          ? ownerUserId
          : this.ownerUserId,
      appId: appId ?? this.appId,
      dataKey: dataKey ?? this.dataKey,
      dataValue: dataValue is String? ? dataValue : this.dataValue,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
