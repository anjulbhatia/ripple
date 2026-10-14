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

abstract class MagicLink
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
    _is.UuidValue? createdByUserId,
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
          : _is.UuidValueJsonExtension.fromJson(
              jsonSerialization['createdByUserId'],
            ),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      revoked: jsonSerialization['revoked'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['revoked']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = MagicLinkTable();

  static const db = MagicLinkRepository._();

  @override
  int? id;

  String token;

  int appId;

  _is.UuidValue? createdByUserId;

  DateTime? expiresAt;

  bool revoked;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [MagicLink]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  MagicLink copyWith({
    int? id,
    String? token,
    int? appId,
    _is.UuidValue? createdByUserId,
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

  static MagicLinkInclude include() {
    return MagicLinkInclude._();
  }

  static MagicLinkIncludeList includeList({
    _is.WhereExpressionBuilder<MagicLinkTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MagicLinkTable>? orderBy,
    _is.OrderByListBuilder<MagicLinkTable>? orderByList,
    MagicLinkInclude? include,
  }) {
    return MagicLinkIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MagicLink.t),
      orderByList: orderByList?.call(MagicLink.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MagicLinkImpl extends MagicLink {
  _MagicLinkImpl({
    int? id,
    required String token,
    required int appId,
    _is.UuidValue? createdByUserId,
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
  @_is.useResult
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
      createdByUserId: createdByUserId is _is.UuidValue?
          ? createdByUserId
          : this.createdByUserId,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      revoked: revoked ?? this.revoked,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class MagicLinkUpdateTable extends _is.UpdateTable<MagicLinkTable> {
  MagicLinkUpdateTable(super.table);

  _is.ColumnValue<String, String> token(String value) => _is.ColumnValue(
    table.token,
    value,
  );

  _is.ColumnValue<int, int> appId(int value) => _is.ColumnValue(
    table.appId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> createdByUserId(
    _is.UuidValue? value,
  ) => _is.ColumnValue(
    table.createdByUserId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> expiresAt(DateTime? value) =>
      _is.ColumnValue(
        table.expiresAt,
        value,
      );

  _is.ColumnValue<bool, bool> revoked(bool value) => _is.ColumnValue(
    table.revoked,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class MagicLinkTable extends _is.Table<int?> {
  MagicLinkTable({super.tableRelation}) : super(tableName: 'magic_links') {
    updateTable = MagicLinkUpdateTable(this);
    token = _is.ColumnString(
      'token',
      this,
    );
    appId = _is.ColumnInt(
      'appId',
      this,
    );
    createdByUserId = _is.ColumnUuid(
      'createdByUserId',
      this,
    );
    expiresAt = _is.ColumnDateTime(
      'expiresAt',
      this,
    );
    revoked = _is.ColumnBool(
      'revoked',
      this,
      hasDefault: true,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final MagicLinkUpdateTable updateTable;

  late final _is.ColumnString token;

  late final _is.ColumnInt appId;

  late final _is.ColumnUuid createdByUserId;

  late final _is.ColumnDateTime expiresAt;

  late final _is.ColumnBool revoked;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    token,
    appId,
    createdByUserId,
    expiresAt,
    revoked,
    createdAt,
  ];
}

class MagicLinkInclude extends _is.IncludeObject {
  MagicLinkInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => MagicLink.t;
}

class MagicLinkIncludeList extends _is.IncludeList {
  MagicLinkIncludeList._({
    _is.WhereExpressionBuilder<MagicLinkTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MagicLink.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => MagicLink.t;
}

class MagicLinkRepository {
  const MagicLinkRepository._();

  /// Returns a list of [MagicLink]s matching the given query parameters.
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
  Future<List<MagicLink>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MagicLinkTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MagicLinkTable>? orderBy,
    _is.OrderByListBuilder<MagicLinkTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<MagicLink>(
      where: where?.call(MagicLink.t),
      orderBy: orderBy?.call(MagicLink.t),
      orderByList: orderByList?.call(MagicLink.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [MagicLink] matching the given query parameters.
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
  Future<MagicLink?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MagicLinkTable>? where,
    int? offset,
    _is.OrderByBuilder<MagicLinkTable>? orderBy,
    _is.OrderByListBuilder<MagicLinkTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<MagicLink>(
      where: where?.call(MagicLink.t),
      orderBy: orderBy?.call(MagicLink.t),
      orderByList: orderByList?.call(MagicLink.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [MagicLink] by its [id] or null if no such row exists.
  Future<MagicLink?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<MagicLink>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [MagicLink]s in the list and returns the inserted rows.
  ///
  /// The returned [MagicLink]s will have their `id` fields set.
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
  Future<List<MagicLink>> insert(
    _is.DatabaseSession session,
    List<MagicLink> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<MagicLink>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [MagicLink] and returns the inserted row.
  ///
  /// The returned [MagicLink] will have its `id` field set.
  Future<MagicLink> insertRow(
    _is.DatabaseSession session,
    MagicLink row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<MagicLink>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [MagicLink]s in the list and returns the resulting rows.
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
  /// The returned [MagicLink]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<MagicLink>> upsert(
    _is.DatabaseSession session,
    List<MagicLink> rows, {
    required _is.ColumnSelections<MagicLinkTable> conflictColumns,
    _is.ColumnSelections<MagicLinkTable>? updateColumns,
    _is.WhereExpressionBuilder<MagicLinkTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<MagicLink>(
      rows,
      conflictColumns: conflictColumns(MagicLink.t),
      updateColumns: updateColumns?.call(MagicLink.t),
      updateWhere: updateWhere?.call(MagicLink.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [MagicLink] and returns the resulting row.
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
  /// The returned [MagicLink] will have its `id` field set.
  Future<MagicLink?> upsertRow(
    _is.DatabaseSession session,
    MagicLink row, {
    required _is.ColumnSelections<MagicLinkTable> conflictColumns,
    _is.ColumnSelections<MagicLinkTable>? updateColumns,
    _is.WhereExpressionBuilder<MagicLinkTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<MagicLink>(
      row,
      conflictColumns: conflictColumns(MagicLink.t),
      updateColumns: updateColumns?.call(MagicLink.t),
      updateWhere: updateWhere?.call(MagicLink.t),
      transaction: transaction,
    );
  }

  /// Updates all [MagicLink]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<MagicLink>> update(
    _is.DatabaseSession session,
    List<MagicLink> rows, {
    _is.ColumnSelections<MagicLinkTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<MagicLink>(
      rows,
      columns: columns?.call(MagicLink.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [MagicLink]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MagicLink> updateRow(
    _is.DatabaseSession session,
    MagicLink row, {
    _is.ColumnSelections<MagicLinkTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<MagicLink>(
      row,
      columns: columns?.call(MagicLink.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MagicLink] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MagicLink?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<MagicLinkUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<MagicLink>(
      id,
      columnValues: columnValues(MagicLink.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MagicLink]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<MagicLink>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<MagicLinkUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<MagicLinkTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MagicLinkTable>? orderBy,
    _is.OrderByListBuilder<MagicLinkTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<MagicLink>(
      columnValues: columnValues(MagicLink.t.updateTable),
      where: where(MagicLink.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MagicLink.t),
      orderByList: orderByList?.call(MagicLink.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [MagicLink]s in the list and returns the deleted rows.
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
  Future<List<MagicLink>> delete(
    _is.DatabaseSession session,
    List<MagicLink> rows, {
    _is.OrderByBuilder<MagicLinkTable>? orderBy,
    _is.OrderByListBuilder<MagicLinkTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<MagicLink>(
      rows,
      orderBy: orderBy?.call(MagicLink.t),
      orderByList: orderByList?.call(MagicLink.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [MagicLink].
  Future<MagicLink> deleteRow(
    _is.DatabaseSession session,
    MagicLink row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MagicLink>(
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
  Future<List<MagicLink>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MagicLinkTable> where,
    _is.OrderByBuilder<MagicLinkTable>? orderBy,
    _is.OrderByListBuilder<MagicLinkTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<MagicLink>(
      where: where(MagicLink.t),
      orderBy: orderBy?.call(MagicLink.t),
      orderByList: orderByList?.call(MagicLink.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MagicLinkTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<MagicLink>(
      where: where?.call(MagicLink.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [MagicLink] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MagicLinkTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<MagicLink>(
      where: where(MagicLink.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
