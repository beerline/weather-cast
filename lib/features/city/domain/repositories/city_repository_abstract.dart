import 'package:weathercast/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/city/domain/usecases/list_with_predefined_cities.dart';

abstract class CityRepositoryAbstract implements CityListAbstract{
  Future<Either<Failure, City>> add(City city);
  Future<Either<Failure, bool>> delete(City city);
  Stream<List<City>> watchList();
}