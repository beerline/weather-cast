import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/location/domain/repositories/location_repository_abstract.dart';

class LocationRepository implements LocationRepositoryAbstract {
  final Location location;

  LocationRepository({required this.location});

  @override
  Future<Either<Failure, LocationData>> getCurrentLocation() async {
    final permissionStatus = await _checkPermissionStatus();
    final failOrPermissionGranted =
        permissionStatus.fold((failure) => failure, (isGranted) => isGranted);
    if (failOrPermissionGranted is Failure) {
      return Left(failOrPermissionGranted);
    }

    final serviceStatus = await _checkSessionStatus();
    final failureOrServiceAvailable =
        serviceStatus.fold((failure) => failure, (isAvailable) => isAvailable);
    if (failureOrServiceAvailable is Failure) {
      return Left(failureOrServiceAvailable);
    }

    final locationData = await location.getLocation();
    return Right(locationData);
  }

  Future<Either<Failure, bool>> _checkSessionStatus() async {
    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final requestServiceEnabled = await location.requestService();
      if (!requestServiceEnabled) {
        return Left(LocationServiceNotEnabledFailure());
      }
    }

    return Right(true);
  }

  Future<Either<Failure, bool>> _checkPermissionStatus() async {
    final permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      final requestPermissionRes = await location.requestPermission();
      if (requestPermissionRes == PermissionStatus.denied) {
        return Left(UseLocationNoPermissionFailure());
      } else if (requestPermissionRes == PermissionStatus.deniedForever) {
        return Left(UseLocationPermissionDeniedForeverFailure());
      }
    }
    return Right(true);
  }
}
