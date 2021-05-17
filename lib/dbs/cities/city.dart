import 'package:moor/moor.dart';
import 'package:weathercast/dbs/cities/cities_db.dart';

part 'city.g.dart';

class CityTable extends Table {
  @override
  String get tableName => 'cities';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  RealColumn get lat => real().nullable()();

  RealColumn get lon => real().nullable()();
}

@UseDao(tables: [CityTable])
class CityDao extends DatabaseAccessor<CitiesDB> with _$CityDaoMixin {
  final CitiesDB db;

  CityDao(this.db) : super(db);

  $CityTableTable get table => db.cityTable;

  Future<int> insertRequest(Insertable<CityTableData> city) =>
      into(table).insert(city);

  Future<int> deleteRequest(int id) =>
      (delete(table)..where((tbl) => tbl.id.equals(id))).go();

  Stream<List<CityTableData>> watch() =>
      select<CityTable, CityTableData>(table).watch();
}
