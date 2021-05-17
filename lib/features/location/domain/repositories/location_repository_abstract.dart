import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:weathercast/errors/failures.dart';

abstract class LocationRepositoryAbstract {
  Future<Either<Failure, LocationData>> getCurrentLocation();
}