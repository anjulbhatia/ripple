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

abstract class AppData
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
    _is.UuidValue? ownerUserId,
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
          : _is.UuidValueJsonExtension.fromJson(
              jsonSerialization['ownerUserId'],
            ),
      appId: jsonSerialization['appId'] as int,
      dataKey: jsonSerialization['dataKey'] as String,
      dataValue: jsonSerialization['dataValue'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = AppDataTable();

  static const db = AppDataRepository._();

  @override
  int? id;

  _is.UuidValue? ownerUserId;

  int appId;

  String dataKey;

  String? dataValue;

  DateTime updatedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [AppData]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  AppData copyWith({
    int? id,
    _is.UuidValue? ownerUserId,
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

  static AppDataInclude include() {
    return AppDataInclude._();
  }

  static AppDataIncludeList includeList({
    _is.WhereExpressionBuilder<AppDataTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AppDataTable>? orderBy,
    _is.OrderByListBuilder<AppDataTable>? orderByList,
    AppDataInclude? include,
  }) {
    return AppDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppData.t),
      orderByList: orderByList?.call(AppData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppDataImpl extends AppData {
  _AppDataImpl({
    int? id,
    _is.UuidValue? ownerUserId,
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
  @_is.useResult
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
      ownerUserId: ownerUserId is _is.UuidValue?
          ? ownerUserId
          : this.ownerUserId,
      appId: appId ?? this.appId,
      dataKey: dataKey ?? this.dataKey,
      dataValue: dataValue is String? ? dataValue : this.dataValue,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class AppDataUpdateTable extends _is.UpdateTable<AppDataTable> {
  AppDataUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> ownerUserId(
    _is.UuidValue? value,
  ) => _is.ColumnValue(
    table.ownerUserId,
    value,
  );

  _is.ColumnValue<int, int> appId(int value) => _is.ColumnValue(
    table.appId,
    value,
  );

  _is.ColumnValue<String, String> dataKey(String value) => _is.ColumnValue(
    table.dataKey,
    value,
  );

  _is.ColumnValue<String, String> dataValue(String? value) => _is.ColumnValue(
    table.dataValue,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class AppDataTable extends _is.Table<int?> {
  AppDataTable({super.tableRelation}) : super(tableName: 'app_data') {
    updateTable = AppDataUpdateTable(this);
    ownerUserId = _is.ColumnUuid(
      'ownerUserId',
      this,
    );
    appId = _is.ColumnInt(
      'appId',
      this,
    );
    dataKey = _is.ColumnString(
      'dataKey',
      this,
    );
    dataValue = _is.ColumnString(
      'dataValue',
      this,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final AppDataUpdateTable updateTable;

  late final _is.ColumnUuid ownerUserId;

  late final _is.ColumnInt appId;

  late final _is.ColumnString dataKey;

  late final _is.ColumnString dataValue;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    ownerUserId,
    appId,
    dataKey,
    dataValue,
    updatedAt,
  ];
}

class AppDataInclude extends _is.IncludeObject {
  AppDataInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => AppData.t;
}

class AppDataIncludeList extends _is.IncludeList {
  AppDataIncludeList._({
    _is.WhereExpressionBuilder<AppDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppData.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => AppData.t;
}

class AppDataRepository {
  const AppDataRepository._();

  /// Returns a list of [AppData]s matching the given query parameters.
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
  Future<List<AppData>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AppDataTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AppDataTable>? orderBy,
    _is.OrderByListBuilder<AppDataTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<AppData>(
      where: where?.call(AppData.t),
      orderBy: orderBy?.call(AppData.t),
      orderByList: orderByList?.call(AppData.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [AppData] matching the given query parameters.
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
  Future<AppData?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AppDataTable>? where,
    int? offset,
    _is.OrderByBuilder<AppDataTable>? orderBy,
    _is.OrderByListBuilder<AppDataTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<AppData>(
      where: where?.call(AppData.t),
      orderBy: orderBy?.call(AppData.t),
      orderByList: orderByList?.call(AppData.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [AppData] by its [id] or null if no such row exists.
  Future<AppData?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<AppData>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [AppData]s in the list and returns the inserted rows.
  ///
  /// The returned [AppData]s will have their `id` fields set.
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
  Future<List<AppData>> insert(
    _is.DatabaseSession session,
    List<AppData> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<AppData>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [AppData] and returns the inserted row.
  ///
  /// The returned [AppData] will have its `id` field set.
  Future<AppData> insertRow(
    _is.DatabaseSession session,
    AppData row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppData>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [AppData]s in the list and returns the resulting rows.
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
  /// The returned [AppData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AppData>> upsert(
    _is.DatabaseSession session,
    List<AppData> rows, {
    required _is.ColumnSelections<AppDataTable> conflictColumns,
    _is.ColumnSelections<AppDataTable>? updateColumns,
    _is.WhereExpressionBuilder<AppDataTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<AppData>(
      rows,
      conflictColumns: conflictColumns(AppData.t),
      updateColumns: updateColumns?.call(AppData.t),
      updateWhere: updateWhere?.call(AppData.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [AppData] and returns the resulting row.
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
  /// The returned [AppData] will have its `id` field set.
  Future<AppData?> upsertRow(
    _is.DatabaseSession session,
    AppData row, {
    required _is.ColumnSelections<AppDataTable> conflictColumns,
    _is.ColumnSelections<AppDataTable>? updateColumns,
    _is.WhereExpressionBuilder<AppDataTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<AppData>(
      row,
      conflictColumns: conflictColumns(AppData.t),
      updateColumns: updateColumns?.call(AppData.t),
      updateWhere: updateWhere?.call(AppData.t),
      transaction: transaction,
    );
  }

  /// Updates all [AppData]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AppData>> update(
    _is.DatabaseSession session,
    List<AppData> rows, {
    _is.ColumnSelections<AppDataTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<AppData>(
      rows,
      columns: columns?.call(AppData.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [AppData]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppData> updateRow(
    _is.DatabaseSession session,
    AppData row, {
    _is.ColumnSelections<AppDataTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppData>(
      row,
      columns: columns?.call(AppData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppData] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AppData?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<AppDataUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<AppData>(
      id,
      columnValues: columnValues(AppData.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AppData]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AppData>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<AppDataUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<AppDataTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AppDataTable>? orderBy,
    _is.OrderByListBuilder<AppDataTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<AppData>(
      columnValues: columnValues(AppData.t.updateTable),
      where: where(AppData.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppData.t),
      orderByList: orderByList?.call(AppData.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [AppData]s in the list and returns the deleted rows.
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
  Future<List<AppData>> delete(
    _is.DatabaseSession session,
    List<AppData> rows, {
    _is.OrderByBuilder<AppDataTable>? orderBy,
    _is.OrderByListBuilder<AppDataTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<AppData>(
      rows,
      orderBy: orderBy?.call(AppData.t),
      orderByList: orderByList?.call(AppData.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [AppData].
  Future<AppData> deleteRow(
    _is.DatabaseSession session,
    AppData row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppData>(
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
  Future<List<AppData>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AppDataTable> where,
    _is.OrderByBuilder<AppDataTable>? orderBy,
    _is.OrderByListBuilder<AppDataTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<AppData>(
      where: where(AppData.t),
      orderBy: orderBy?.call(AppData.t),
      orderByList: orderByList?.call(AppData.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AppDataTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<AppData>(
      where: where?.call(AppData.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [AppData] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AppDataTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<AppData>(
      where: where(AppData.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
