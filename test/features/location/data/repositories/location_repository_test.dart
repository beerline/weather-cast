import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/location/data/repositories/loaction_repository.dart';

class MockLocation extends Mock implements Location {}

void main() {
  group('hasPermission denied', () {
    late MockLocation mockLocation;

    setUp(() {
      mockLocation = MockLocation();
      when(() => mockLocation.hasPermission())
          .thenAnswer((_) async => PermissionStatus.denied);
    });

    test(
        'return Left<UseLocationNoPermissionFailure> if location.hasPermission denied',
        () async {
      when(() => mockLocation.requestPermission())
          .thenAnswer((_) async => PermissionStatus.denied);
      final locationRepository = LocationRepository(location: mockLocation);
      final res = await locationRepository.getCurrentLocation();
      verify(() => mockLocation.hasPermission()).called(1);

      final isSameClassInstance = res is Left<Failure, LocationData>;
      expect(isSameClassInstance, true,
          reason:
              '${res.runtimeType} must be instance Left<Failure, LocationData>');

      final failure = res.fold((l) => l, (r) => r);
      final isRightFailure = failure is UseLocationNoPermissionFailure;
      expect(isRightFailure, true,
          reason: 'Failre must be instance of UseLocationNoPermissionFailure');
    });

    test(
        'return Left<UseLocationPermissionDeniedForeverFailure> if location.hasPermission deniedForever',
        () async {
      when(() => mockLocation.requestPermission())
          .thenAnswer((_) async => PermissionStatus.deniedForever);
      final locationRepository = LocationRepository(location: mockLocation);
      final res = await locationRepository.getCurrentLocation();
      verify(() => mockLocation.hasPermission()).called(1);

      final isSameClassInstance = res is Left<Failure, LocationData>;
      expect(isSameClassInstance, true,
          reason:
              '${res.runtimeType} must be instance Left<Failure, LocationData>');

      final failure = res.fold((l) => l, (r) => r);
      final isRightFailure =
          failure is UseLocationPermissionDeniedForeverFailure;
      expect(isRightFailure, true,
          reason:
              'Failre must be instance of UseLocationPermissionDeniedForeverFailure');
    });
    test(
        'return Right<Failure, LocationData> if location.requestPermission is granted',
        () async {
      when(() => mockLocation.requestPermission())
          .thenAnswer((_) async => PermissionStatus.granted);
      when(() => mockLocation.getLocation())
          .thenAnswer((_) async => LocationData.fromMap({}));
      when(() => mockLocation.serviceEnabled()).thenAnswer((_) async => true);

      final locationRepository = LocationRepository(location: mockLocation);
      final res = await locationRepository.getCurrentLocation();
      verify(() => mockLocation.hasPermission()).called(1);
      verify(() => mockLocation.requestPermission()).called(1);
      verify(() => mockLocation.getLocation()).called(1);
      verify(() => mockLocation.serviceEnabled()).called(1);

      final isSameClassInstance = res is Right<Failure, LocationData>;
      expect(isSameClassInstance, true,
          reason:
              '${res.runtimeType} must be instance Right<Failure, LocationData>');

      final locationData = res.fold((l) => l, (r) => r);
      final isLocation = locationData is LocationData;
      expect(isLocation, true,
          reason: 'Failre must be instance of LocationData');
    });
  });

  group('permission granted', () {
    late MockLocation mockLocation;

    setUpAll(() {
      mockLocation = MockLocation();
      when(() => mockLocation.hasPermission())
          .thenAnswer((_) async => PermissionStatus.granted);
    });

    group('location.serviceEnabled is false', () {
      setUpAll(() {
        when(() => mockLocation.serviceEnabled())
            .thenAnswer((_) async => false);
      });

      test(
          'return Left<LocationServiceNotEnabledFailure, LocationData> if location.requestService is false result',
          () async {
        when(() => mockLocation.requestService())
            .thenAnswer((_) async => false);

        final locationRepository = LocationRepository(location: mockLocation);
        final res = await locationRepository.getCurrentLocation();

        verify(() => mockLocation.hasPermission()).called(1);
        verify(() => mockLocation.serviceEnabled()).called(1);

        final isSameClassInstance = res is Left<Failure, LocationData>;
        expect(isSameClassInstance, true,
            reason:
                '${res.runtimeType} must be instance Left<Failure, LocationData>');

        final failure = res.fold((l) => l, (r) => r);
        final isRightFailure = failure is LocationServiceNotEnabledFailure;

        expect(isRightFailure, true);
      });

      test(
          'return Right<Failure, LocationData> if location.requestService is true',
          () async {
        when(() => mockLocation.requestService()).thenAnswer((_) async => true);
        when(() => mockLocation.getLocation())
            .thenAnswer((_) async => LocationData.fromMap({}));

        final locationRepository = LocationRepository(location: mockLocation);
        final res = await locationRepository.getCurrentLocation();

        verify(() => mockLocation.hasPermission()).called(1);
        verify(() => mockLocation.serviceEnabled()).called(1);
        verify(() => mockLocation.getLocation()).called(1);

        final isSameClassInstance = res is Right<Failure, LocationData>;
        expect(isSameClassInstance, true,
            reason:
                '${res.runtimeType} must be instance Right<Failure, LocationData>');

        final locationData = res.fold((l) => l, (r) => r);
        final isRightLocationData = locationData is LocationData;

        expect(isRightLocationData, true);
      });
    });
  });

  test(
      'return Right<Failure, LocationData> if location.requestService and ocation.hasPermission is true',
      () async {
    final mockLocation = MockLocation();
    when(() => mockLocation.hasPermission())
        .thenAnswer((_) async => PermissionStatus.granted);
    when(() => mockLocation.serviceEnabled()).thenAnswer((_) async => true);
    when(() => mockLocation.getLocation())
        .thenAnswer((_) async => LocationData.fromMap({}));

    final locationRepository = LocationRepository(location: mockLocation);
    final res = await locationRepository.getCurrentLocation();

    verify(() => mockLocation.hasPermission()).called(1);
    verify(() => mockLocation.serviceEnabled()).called(1);
    verify(() => mockLocation.getLocation()).called(1);

    final isSameClassInstance = res is Right<Failure, LocationData>;
    expect(isSameClassInstance, true,
        reason:
            '${res.runtimeType} must be instance Right<Failure, LocationData>');

    final locationData = res.fold((l) => l, (r) => r);
    final isRightLocationData = locationData is LocationData;

    expect(isRightLocationData, true);
  });
}
