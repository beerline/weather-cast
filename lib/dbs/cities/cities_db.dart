import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:weathercast/dbs/cities/city.dart';

part 'cities_db.g.dart';

@UseMoor(
  tables: [CityTable],
  daos: [CityDao],
)
class CitiesDB extends _$CitiesDB {
  CitiesDB()
      : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'cities_db.sqlite'));
    return VmDatabase(file);
  });
}