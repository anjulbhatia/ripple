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

abstract class AppDefinition
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
    _is.UuidValue? ownerUserId,
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
          : _is.UuidValueJsonExtension.fromJson(
              jsonSerialization['ownerUserId'],
            ),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      uiDefinition: jsonSerialization['uiDefinition'] as String,
      schemaVersion: jsonSerialization['schemaVersion'] as int?,
      isPublished: jsonSerialization['isPublished'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['isPublished']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = AppDefinitionTable();

  static const db = AppDefinitionRepository._();

  @override
  int? id;

  _is.UuidValue? ownerUserId;

  String name;

  String? description;

  String uiDefinition;

  int schemaVersion;

  bool isPublished;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [AppDefinition]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  AppDefinition copyWith({
    int? id,
    _is.UuidValue? ownerUserId,
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

  static AppDefinitionInclude include() {
    return AppDefinitionInclude._();
  }

  static AppDefinitionIncludeList includeList({
    _is.WhereExpressionBuilder<AppDefinitionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AppDefinitionTable>? orderBy,
    _is.OrderByListBuilder<AppDefinitionTable>? orderByList,
    AppDefinitionInclude? include,
  }) {
    return AppDefinitionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppDefinition.t),
      orderByList: orderByList?.call(AppDefinition.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppDefinitionImpl extends AppDefinition {
  _AppDefinitionImpl({
    int? id,
    _is.UuidValue? ownerUserId,
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
  @_is.useResult
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
      ownerUserId: ownerUserId is _is.UuidValue?
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

class AppDefinitionUpdateTable extends _is.UpdateTable<AppDefinitionTable> {
  AppDefinitionUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> ownerUserId(
    _is.UuidValue? value,
  ) => _is.ColumnValue(
    table.ownerUserId,
    value,
  );

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> description(String? value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<String, String> uiDefinition(String value) => _is.ColumnValue(
    table.uiDefinition,
    value,
  );

  _is.ColumnValue<int, int> schemaVersion(int value) => _is.ColumnValue(
    table.schemaVersion,
    value,
  );

  _is.ColumnValue<bool, bool> isPublished(bool value) => _is.ColumnValue(
    table.isPublished,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class AppDefinitionTable extends _is.Table<int?> {
  AppDefinitionTable({super.tableRelation})
    : super(tableName: 'app_definitions') {
    updateTable = AppDefinitionUpdateTable(this);
    ownerUserId = _is.ColumnUuid(
      'ownerUserId',
      this,
    );
    name = _is.ColumnString(
      'name',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    uiDefinition = _is.ColumnString(
      'uiDefinition',
      this,
    );
    schemaVersion = _is.ColumnInt(
      'schemaVersion',
      this,
      hasDefault: true,
    );
    isPublished = _is.ColumnBool(
      'isPublished',
      this,
      hasDefault: true,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final AppDefinitionUpdateTable updateTable;

  late final _is.ColumnUuid ownerUserId;

  late final _is.ColumnString name;

  late final _is.ColumnString description;

  late final _is.ColumnString uiDefinition;

  late final _is.ColumnInt schemaVersion;

  late final _is.ColumnBool isPublished;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    ownerUserId,
    name,
    description,
    uiDefinition,
    schemaVersion,
    isPublished,
    createdAt,
    updatedAt,
  ];
}

class AppDefinitionInclude extends _is.IncludeObject {
  AppDefinitionInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => AppDefinition.t;
}

class AppDefinitionIncludeList extends _is.IncludeList {
  AppDefinitionIncludeList._({
    _is.WhereExpressionBuilder<AppDefinitionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppDefinition.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => AppDefinition.t;
}

class AppDefinitionRepository {
  const AppDefinitionRepository._();

  /// Returns a list of [AppDefinition]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<AppDefinition>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AppDefinitionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AppDefinitionTable>? orderBy,
    _is.OrderByListBuilder<AppDefinitionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<AppDefinition>(
      where: where?.call(AppDefinition.t),
      orderBy: orderBy?.call(AppDefinition.t),
      orderByList: orderByList?.call(AppDefinition.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [AppDefinition] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<AppDefinition?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AppDefinitionTable>? where,
    int? offset,
    _is.OrderByBuilder<AppDefinitionTable>? orderBy,
    _is.OrderByListBuilder<AppDefinitionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<AppDefinition>(
      where: where?.call(AppDefinition.t),
      orderBy: orderBy?.call(AppDefinition.t),
      orderByList: orderByList?.call(AppDefinition.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [AppDefinition] by its [id] or null if no such row exists.
  Future<AppDefinition?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<AppDefinition>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [AppDefinition]s in the list and returns the inserted rows.
  ///
  /// The returned [AppDefinition]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AppDefinition>> insert(
    _is.DatabaseSession session,
    List<AppDefinition> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<AppDefinition>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [AppDefinition] and returns the inserted row.
  ///
  /// The returned [AppDefinition] will have its `id` field set.
  Future<AppDefinition> insertRow(
    _is.DatabaseSession session,
    AppDefinition row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppDefinition>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [AppDefinition]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [AppDefinition]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AppDefinition>> upsert(
    _is.DatabaseSession session,
    List<AppDefinition> rows, {
    required _is.ColumnSelections<AppDefinitionTable> conflictColumns,
    _is.ColumnSelections<AppDefinitionTable>? updateColumns,
    _is.WhereExpressionBuilder<AppDefinitionTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<AppDefinition>(
      rows,
      conflictColumns: conflictColumns(AppDefinition.t),
      updateColumns: updateColumns?.call(AppDefinition.t),
      updateWhere: updateWhere?.call(AppDefinition.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [AppDefinition] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [AppDefinition] will have its `id` field set.
  Future<AppDefinition?> upsertRow(
    _is.DatabaseSession session,
    AppDefinition row, {
    required _is.ColumnSelections<AppDefinitionTable> conflictColumns,
    _is.ColumnSelections<AppDefinitionTable>? updateColumns,
    _is.WhereExpressionBuilder<AppDefinitionTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<AppDefinition>(
      row,
      conflictColumns: conflictColumns(AppDefinition.t),
      updateColumns: updateColumns?.call(AppDefinition.t),
      updateWhere: updateWhere?.call(AppDefinition.t),
      transaction: transaction,
    );
  }

  /// Updates all [AppDefinition]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AppDefinition>> update(
    _is.DatabaseSession session,
    List<AppDefinition> rows, {
    _is.ColumnSelections<AppDefinitionTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<AppDefinition>(
      rows,
      columns: columns?.call(AppDefinition.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [AppDefinition]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppDefinition> updateRow(
    _is.DatabaseSession session,
    AppDefinition row, {
    _is.ColumnSelections<AppDefinitionTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppDefinition>(
      row,
      columns: columns?.call(AppDefinition.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppDefinition] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AppDefinition?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<AppDefinitionUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<AppDefinition>(
      id,
      columnValues: columnValues(AppDefinition.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AppDefinition]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AppDefinition>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<AppDefinitionUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<AppDefinitionTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AppDefinitionTable>? orderBy,
    _is.OrderByListBuilder<AppDefinitionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<AppDefinition>(
      columnValues: columnValues(AppDefinition.t.updateTable),
      where: where(AppDefinition.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppDefinition.t),
      orderByList: orderByList?.call(AppDefinition.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [AppDefinition]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AppDefinition>> delete(
    _is.DatabaseSession session,
    List<AppDefinition> rows, {
    _is.OrderByBuilder<AppDefinitionTable>? orderBy,
    _is.OrderByListBuilder<AppDefinitionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<AppDefinition>(
      rows,
      orderBy: orderBy?.call(AppDefinition.t),
      orderByList: orderByList?.call(AppDefinition.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [AppDefinition].
  Future<AppDefinition> deleteRow(
    _is.DatabaseSession session,
    AppDefinition row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppDefinition>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AppDefinition>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AppDefinitionTable> where,
    _is.OrderByBuilder<AppDefinitionTable>? orderBy,
    _is.OrderByListBuilder<AppDefinitionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<AppDefinition>(
      where: where(AppDefinition.t),
      orderBy: orderBy?.call(AppDefinition.t),
      orderByList: orderByList?.call(AppDefinition.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AppDefinitionTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<AppDefinition>(
      where: where?.call(AppDefinition.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [AppDefinition] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AppDefinitionTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<AppDefinition>(
      where: where(AppDefinition.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
