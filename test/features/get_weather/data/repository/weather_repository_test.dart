import 'package:test/test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weathercast/data_source/data_source_abstract.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/get_weater/data/models/weather_by_city_name.dart';
import 'package:weathercast/features/get_weater/data/models/weather_by_coord.dart';
import 'package:weathercast/features/get_weater/data/models/weather_forecast_days.dart';
import 'package:weathercast/features/get_weater/data/repositories/wether_repository.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather_details.dart';
import 'package:weathercast/features/networkinfo/network_info_cubit.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockNetworkInfo extends Mock implements NetworkInfoAbstract {}

class MockDataSource extends Mock implements DataSource {}

void main() {
  group('weather repository test method "get"', () {
    late MockNetworkInfo networkInfo;
    late MockDataSource remoteDataSource;

    setUpAll(() {
      networkInfo = MockNetworkInfo();
      remoteDataSource = MockDataSource();
    });

    test('return Left<NoInternetConnection, T> if no internet connection',
        () async {
      when(() => networkInfo.isConnected())
          .thenAnswer((invocation) async => false);
      final weatherRepository =
          new WeatherRepository(networkInfo, remoteDataSource);

      final res = await weatherRepository.get(
          WeatherByCityName('', ''), '', (json) => null);

      verify(() => networkInfo.isConnected()).called(1);

      final isSameClassInstance = res is Left<Failure, Null>;
      expect(isSameClassInstance, true,
          reason:
              'response must be instance of Left<Failure, Null>, actual ${res.runtimeType}');

      final failure = res.fold((l) => l, (r) => r);
      final isRightFailure = failure is NoInternetConnection;
      expect(isRightFailure, true,
          reason:
              'Failure must be instane of NoInternetConnection, actual ${failure.runtimeType}');
    });

    test('return Left<CityRepositoryFailure, T> if DIO error', () async {
      when(() => networkInfo.isConnected()).thenAnswer((_) async => true);
      when(() => remoteDataSource.fetchData(''))
          .thenThrow(Exception('text msg'));

      final weatherRepository =
          new WeatherRepository(networkInfo, remoteDataSource);

      final res = await weatherRepository.get(
          WeatherByCityName('', ''), '', (json) => null);

      verify(() => networkInfo.isConnected()).called(1);

      final isSameClassInstance = res is Left<Failure, Null>;
      expect(isSameClassInstance, true,
          reason:
              'response must be instance of Left<Failure, Null>, actual ${res.runtimeType}');

      final failure = res.fold((l) => l, (r) => r);
      final isRightFailure = failure is CityRepositoryFailure;
      expect(isRightFailure, true,
          reason:
              'Failure must be instane of CityRepositoryFailure, actual ${failure.runtimeType}');
    });

    test('return Left<EmptyResponse, T> if empty response', () async {
      final request =
          WeatherByCityName('Boston', WeatherRepository.UNITS_METRIC);
      when(() => networkInfo.isConnected())
          .thenAnswer((invocation) async => true);
      when(() => remoteDataSource.fetchData(any(),
              queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => null);

      final weatherRepository =
          new WeatherRepository(networkInfo, remoteDataSource);

      final res = await weatherRepository.get(request, '', (json) => null);

      verify(() => networkInfo.isConnected()).called(1);
      verify(() =>
              remoteDataSource.fetchData('', queryParameters: request.toJson()))
          .called(1);

      final isSameClassInstance = res is Left<Failure, Null>;
      expect(isSameClassInstance, true,
          reason:
              'response must be instance of Left<Failure, Null>, actual ${res.runtimeType}');

      final failure = res.fold((l) => l, (r) => r);
      final isRightFailure = failure is EmptyResponse;
      expect(isRightFailure, true,
          reason:
              'Failure must be instane of EmptyResponse, actual ${failure.runtimeType}');
    });
  });

  test('return Right<Failure, WeatherDetails> on success forecast', () async {
    final request = WeatherForecastDays(1, 2, WeatherRepository.UNITS_METRIC);

    final networkInfo = MockNetworkInfo();
    final remoteDataSource = MockDataSource();

    when(() => networkInfo.isConnected())
        .thenAnswer((invocation) async => true);
    when(() => remoteDataSource.fetchData(any(),
            queryParameters: request.toJson()))
        .thenAnswer((_) async => fixture('forecast_day.json'));

    final weatherRepository =
        new WeatherRepository(networkInfo, remoteDataSource);

    final res = await weatherRepository.forecast(request);

    verify(() => networkInfo.isConnected()).called(1);
    verify(() => remoteDataSource.fetchData(any(),
        queryParameters: request.toJson())).called(1);

    final isSameClassInstance = res is Right<Failure, WeatherDetails>;
    expect(isSameClassInstance, true,
        reason:
            'response must be instance of Right<Failure, WeatherDetails>, actual ${res.runtimeType}');
  });

  test('return Right<Failure, Weather> on byCoordinates', () async {
    final request = WeatherByCoord(1, 2, WeatherRepository.UNITS_METRIC);

    final networkInfo = MockNetworkInfo();
    final remoteDataSource = MockDataSource();

    when(() => networkInfo.isConnected())
        .thenAnswer((invocation) async => true);
    when(() => remoteDataSource.fetchData(any(),
            queryParameters: request.toJson()))
        .thenAnswer((_) async => fixture('weather_by_coord.json'));

    final weatherRepository =
        new WeatherRepository(networkInfo, remoteDataSource);

    final res = await weatherRepository.byCoordinates(request);

    verify(() => networkInfo.isConnected()).called(1);
    verify(() => remoteDataSource.fetchData(any(),
        queryParameters: request.toJson())).called(1);

    final isSameClassInstance = res is Right<Failure, Weather>;
    expect(isSameClassInstance, true,
        reason:
            'response must be instance of Right<Failure, Weather>, actual ${res.runtimeType}');
  });

  test('return Right<Failure, Weather> on byName', () async {
    final request = WeatherByCityName('Boston', WeatherRepository.UNITS_METRIC);

    final networkInfo = MockNetworkInfo();
    final remoteDataSource = MockDataSource();

    when(() => networkInfo.isConnected())
        .thenAnswer((invocation) async => true);
    when(() => remoteDataSource.fetchData(any(),
            queryParameters: request.toJson()))
        .thenAnswer((_) async => fixture('weather_by_name.json'));

    final weatherRepository =
        new WeatherRepository(networkInfo, remoteDataSource);

    final res = await weatherRepository.byCityName(request);

    verify(() => networkInfo.isConnected()).called(1);
    verify(() => remoteDataSource.fetchData(any(),
        queryParameters: request.toJson())).called(1);

    final isSameClassInstance = res is Right<Failure, Weather>;
    expect(isSameClassInstance, true,
        reason:
            'response must be instance of Right<Failure, Weather>, actual ${res.runtimeType}');
  });
}
