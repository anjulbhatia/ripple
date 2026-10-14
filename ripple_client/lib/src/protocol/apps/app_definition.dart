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

abstract class AppDefinition
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AppDefinition._({
    this.id,
    this.ownerUserId,
    required this.name,
    this.description,
    required this.uiDefinition,
    int? schemaVersion,
    bool? isPublished,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : schemaVersion = schemaVersion ?? 1,
       isPublished = isPublished ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory AppDefinition({
    int? id,
    _isc.UuidValue? ownerUserId,
    required String name,
    String? description,
    required String uiDefinition,
    int? schemaVersion,
    bool? isPublished,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AppDefinitionImpl;

  factory AppDefinition.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppDefinition(
      id: jsonSerialization['id'] as int?,
      ownerUserId: jsonSerialization['ownerUserId'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(
              jsonSerialization['ownerUserId'],
            ),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      uiDefinition: jsonSerialization['uiDefinition'] as String,
      schemaVersion: jsonSerialization['schemaVersion'] as int?,
      isPublished: jsonSerialization['isPublished'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['isPublished']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
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

  String name;

  String? description;

  String uiDefinition;

  int schemaVersion;

  bool isPublished;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [AppDefinition]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AppDefinition copyWith({
    int? id,
    _isc.UuidValue? ownerUserId,
    String? name,
    String? description,
    String? uiDefinition,
    int? schemaVersion,
    bool? isPublished,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppDefinition',
      if (id != null) 'id': id,
      if (ownerUserId != null) 'ownerUserId': ownerUserId?.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'uiDefinition': uiDefinition,
      'schemaVersion': schemaVersion,
      'isPublished': isPublished,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppDefinition',
      if (id != null) 'id': id,
      if (ownerUserId != null) 'ownerUserId': ownerUserId?.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'uiDefinition': uiDefinition,
      'schemaVersion': schemaVersion,
      'isPublished': isPublished,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppDefinitionImpl extends AppDefinition {
  _AppDefinitionImpl({
    int? id,
    _isc.UuidValue? ownerUserId,
    required String name,
    String? description,
    required String uiDefinition,
    int? schemaVersion,
    bool? isPublished,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         ownerUserId: ownerUserId,
         name: name,
         description: description,
         uiDefinition: uiDefinition,
         schemaVersion: schemaVersion,
         isPublished: isPublished,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [AppDefinition]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AppDefinition copyWith({
    Object? id = _Undefined,
    Object? ownerUserId = _Undefined,
    String? name,
    Object? description = _Undefined,
    String? uiDefinition,
    int? schemaVersion,
    bool? isPublished,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppDefinition(
      id: id is int? ? id : this.id,
      ownerUserId: ownerUserId is _isc.UuidValue?
          ? ownerUserId
          : this.ownerUserId,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      uiDefinition: uiDefinition ?? this.uiDefinition,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      isPublished: isPublished ?? this.isPublished,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
