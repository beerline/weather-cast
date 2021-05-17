// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CityTableData extends DataClass implements Insertable<CityTableData> {
  final int id;
  final String name;
  final double? lat;
  final double? lon;
  CityTableData({required this.id, required this.name, this.lat, this.lon});
  factory CityTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return CityTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      lat: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lat']),
      lon: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}lon']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double?>(lat);
    }
    if (!nullToAbsent || lon != null) {
      map['lon'] = Variable<double?>(lon);
    }
    return map;
  }

  CityTableCompanion toCompanion(bool nullToAbsent) {
    return CityTableCompanion(
      id: Value(id),
      name: Value(name),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lon: lon == null && nullToAbsent ? const Value.absent() : Value(lon),
    );
  }

  factory CityTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CityTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lat: serializer.fromJson<double?>(json['lat']),
      lon: serializer.fromJson<double?>(json['lon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lat': serializer.toJson<double?>(lat),
      'lon': serializer.toJson<double?>(lon),
    };
  }

  CityTableData copyWith({int? id, String? name, double? lat, double? lon}) =>
      CityTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
      );
  @override
  String toString() {
    return (StringBuffer('CityTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(name.hashCode, $mrjc(lat.hashCode, lon.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CityTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.lat == this.lat &&
          other.lon == this.lon);
}

class CityTableCompanion extends UpdateCompanion<CityTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double?> lat;
  final Value<double?> lon;
  const CityTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
  });
  CityTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CityTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double?>? lat,
    Expression<double?>? lon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
    });
  }

  CityTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double?>? lat,
      Value<double?>? lon}) {
    return CityTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double?>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double?>(lon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CityTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon')
          ..write(')'))
        .toString();
  }
}

class $CityTableTable extends CityTable
    with TableInfo<$CityTableTable, CityTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CityTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedRealColumn lat = _constructLat();
  GeneratedRealColumn _constructLat() {
    return GeneratedRealColumn(
      'lat',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedRealColumn lon = _constructLon();
  GeneratedRealColumn _constructLon() {
    return GeneratedRealColumn(
      'lon',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, lat, lon];
  @override
  $CityTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cities';
  @override
  final String actualTableName = 'cities';
  @override
  VerificationContext validateIntegrity(Insertable<CityTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    }
    if (data.containsKey('lon')) {
      context.handle(
          _lonMeta, lon.isAcceptableOrUnknown(data['lon']!, _lonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CityTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CityTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CityTableTable createAlias(String alias) {
    return $CityTableTable(_db, alias);
  }
}

abstract class _$CitiesDB extends GeneratedDatabase {
  _$CitiesDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CityTableTable cityTable = $CityTableTable(this);
  late final CityDao cityDao = CityDao(this as CitiesDB);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cityTable];
}
