// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EmergencyReportsTable extends EmergencyReports
    with TableInfo<$EmergencyReportsTable, EmergencyReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmergencyReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sentViaSmsMeta = const VerificationMeta(
    'sentViaSms',
  );
  @override
  late final GeneratedColumn<int> sentViaSms = GeneratedColumn<int>(
    'sent_via_sms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    message,
    phoneNumber,
    latitude,
    longitude,
    sentViaSms,
    syncStatus,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'emergency_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmergencyReport> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('sent_via_sms')) {
      context.handle(
        _sentViaSmsMeta,
        sentViaSms.isAcceptableOrUnknown(
          data['sent_via_sms']!,
          _sentViaSmsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sentViaSmsMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmergencyReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmergencyReport(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      sentViaSms: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sent_via_sms'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $EmergencyReportsTable createAlias(String alias) {
    return $EmergencyReportsTable(attachedDatabase, alias);
  }
}

class EmergencyReport extends DataClass implements Insertable<EmergencyReport> {
  final String id;
  final String message;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  final int sentViaSms;
  final int syncStatus;
  final DateTime createdAt;
  const EmergencyReport({
    required this.id,
    required this.message,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.sentViaSms,
    required this.syncStatus,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['message'] = Variable<String>(message);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['sent_via_sms'] = Variable<int>(sentViaSms);
    map['sync_status'] = Variable<int>(syncStatus);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EmergencyReportsCompanion toCompanion(bool nullToAbsent) {
    return EmergencyReportsCompanion(
      id: Value(id),
      message: Value(message),
      phoneNumber: Value(phoneNumber),
      latitude: Value(latitude),
      longitude: Value(longitude),
      sentViaSms: Value(sentViaSms),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
    );
  }

  factory EmergencyReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmergencyReport(
      id: serializer.fromJson<String>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      sentViaSms: serializer.fromJson<int>(json['sentViaSms']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'message': serializer.toJson<String>(message),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'sentViaSms': serializer.toJson<int>(sentViaSms),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  EmergencyReport copyWith({
    String? id,
    String? message,
    String? phoneNumber,
    double? latitude,
    double? longitude,
    int? sentViaSms,
    int? syncStatus,
    DateTime? createdAt,
  }) => EmergencyReport(
    id: id ?? this.id,
    message: message ?? this.message,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    sentViaSms: sentViaSms ?? this.sentViaSms,
    syncStatus: syncStatus ?? this.syncStatus,
    createdAt: createdAt ?? this.createdAt,
  );
  EmergencyReport copyWithCompanion(EmergencyReportsCompanion data) {
    return EmergencyReport(
      id: data.id.present ? data.id.value : this.id,
      message: data.message.present ? data.message.value : this.message,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      sentViaSms: data.sentViaSms.present
          ? data.sentViaSms.value
          : this.sentViaSms,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyReport(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('sentViaSms: $sentViaSms, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    message,
    phoneNumber,
    latitude,
    longitude,
    sentViaSms,
    syncStatus,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmergencyReport &&
          other.id == this.id &&
          other.message == this.message &&
          other.phoneNumber == this.phoneNumber &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.sentViaSms == this.sentViaSms &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt);
}

class EmergencyReportsCompanion extends UpdateCompanion<EmergencyReport> {
  final Value<String> id;
  final Value<String> message;
  final Value<String> phoneNumber;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<int> sentViaSms;
  final Value<int> syncStatus;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const EmergencyReportsCompanion({
    this.id = const Value.absent(),
    this.message = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.sentViaSms = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EmergencyReportsCompanion.insert({
    required String id,
    required String message,
    required String phoneNumber,
    required double latitude,
    required double longitude,
    required int sentViaSms,
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       message = Value(message),
       phoneNumber = Value(phoneNumber),
       latitude = Value(latitude),
       longitude = Value(longitude),
       sentViaSms = Value(sentViaSms);
  static Insertable<EmergencyReport> custom({
    Expression<String>? id,
    Expression<String>? message,
    Expression<String>? phoneNumber,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<int>? sentViaSms,
    Expression<int>? syncStatus,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (sentViaSms != null) 'sent_via_sms': sentViaSms,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EmergencyReportsCompanion copyWith({
    Value<String>? id,
    Value<String>? message,
    Value<String>? phoneNumber,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<int>? sentViaSms,
    Value<int>? syncStatus,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return EmergencyReportsCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      sentViaSms: sentViaSms ?? this.sentViaSms,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (sentViaSms.present) {
      map['sent_via_sms'] = Variable<int>(sentViaSms.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<int>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmergencyReportsCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('sentViaSms: $sentViaSms, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EmergencyReportsTable emergencyReports = $EmergencyReportsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [emergencyReports];
}

typedef $$EmergencyReportsTableCreateCompanionBuilder =
    EmergencyReportsCompanion Function({
      required String id,
      required String message,
      required String phoneNumber,
      required double latitude,
      required double longitude,
      required int sentViaSms,
      Value<int> syncStatus,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$EmergencyReportsTableUpdateCompanionBuilder =
    EmergencyReportsCompanion Function({
      Value<String> id,
      Value<String> message,
      Value<String> phoneNumber,
      Value<double> latitude,
      Value<double> longitude,
      Value<int> sentViaSms,
      Value<int> syncStatus,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$EmergencyReportsTableFilterComposer
    extends Composer<_$AppDatabase, $EmergencyReportsTable> {
  $$EmergencyReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sentViaSms => $composableBuilder(
    column: $table.sentViaSms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EmergencyReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $EmergencyReportsTable> {
  $$EmergencyReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sentViaSms => $composableBuilder(
    column: $table.sentViaSms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmergencyReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmergencyReportsTable> {
  $$EmergencyReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<int> get sentViaSms => $composableBuilder(
    column: $table.sentViaSms,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$EmergencyReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmergencyReportsTable,
          EmergencyReport,
          $$EmergencyReportsTableFilterComposer,
          $$EmergencyReportsTableOrderingComposer,
          $$EmergencyReportsTableAnnotationComposer,
          $$EmergencyReportsTableCreateCompanionBuilder,
          $$EmergencyReportsTableUpdateCompanionBuilder,
          (
            EmergencyReport,
            BaseReferences<
              _$AppDatabase,
              $EmergencyReportsTable,
              EmergencyReport
            >,
          ),
          EmergencyReport,
          PrefetchHooks Function()
        > {
  $$EmergencyReportsTableTableManager(
    _$AppDatabase db,
    $EmergencyReportsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmergencyReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmergencyReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmergencyReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<int> sentViaSms = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EmergencyReportsCompanion(
                id: id,
                message: message,
                phoneNumber: phoneNumber,
                latitude: latitude,
                longitude: longitude,
                sentViaSms: sentViaSms,
                syncStatus: syncStatus,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String message,
                required String phoneNumber,
                required double latitude,
                required double longitude,
                required int sentViaSms,
                Value<int> syncStatus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EmergencyReportsCompanion.insert(
                id: id,
                message: message,
                phoneNumber: phoneNumber,
                latitude: latitude,
                longitude: longitude,
                sentViaSms: sentViaSms,
                syncStatus: syncStatus,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EmergencyReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmergencyReportsTable,
      EmergencyReport,
      $$EmergencyReportsTableFilterComposer,
      $$EmergencyReportsTableOrderingComposer,
      $$EmergencyReportsTableAnnotationComposer,
      $$EmergencyReportsTableCreateCompanionBuilder,
      $$EmergencyReportsTableUpdateCompanionBuilder,
      (
        EmergencyReport,
        BaseReferences<_$AppDatabase, $EmergencyReportsTable, EmergencyReport>,
      ),
      EmergencyReport,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EmergencyReportsTableTableManager get emergencyReports =>
      $$EmergencyReportsTableTableManager(_db, _db.emergencyReports);
}
