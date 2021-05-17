import 'package:dartz/dartz.dart';
import 'package:weathercast/dbs/cities/cities_db.dart';
import 'package:weathercast/dbs/cities/city.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/city/domain/repositories/city_repository_abstract.dart';
import 'package:moor/moor.dart' as moor;

class CityDbRepository extends CityRepositoryAbstract {
  final CityDao _cityDao;

  CityDbRepository(this._cityDao);

  @override
  Future<Either<Failure, City>> add(City city) async {
    int? cityId;
    try {
      cityId = await _cityDao.insertRequest(CityTableCompanion(
        name: moor.Value(city.name),
        lat: moor.Value(city.lat),
        lon: moor.Value(city.lon),
      ));
    } catch (e) {
      return Left(CityRepositoryFailure('Can\'t save city ${city.name}'));
    }

    return Right(city.copyWith(id: cityId));
  }

  @override
  Future<Either<Failure, bool>> delete(City city) async {
    try {
      if (city.id != null) {
        var deletedCount = await _cityDao.deleteRequest(city.id!);
        if (deletedCount == 0) {
          throw Exception();
        }
      }
    } catch (e) {
      return Left(CityRepositoryFailure('Can\'t remove city ${city.name}'));
    }

    return Right(true);
  }

  @override
  Stream<List<City>> watchList() async* {
    await for (var cityDataList in _cityDao.watch()) {
      yield List<City>.from(cityDataList.map((cityData) => City(
            cityData.name,
            id: cityData.id,
            lat: cityData.lat,
            lon: cityData.lon,
          )));
    }
  }

}

