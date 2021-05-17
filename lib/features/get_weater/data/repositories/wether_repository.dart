import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:weathercast/data_source/data_source_abstract.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/get_weater/data/models/weather_by_city_name.dart';
import 'package:weathercast/features/get_weater/data/models/weather_by_coord.dart';
import 'package:weathercast/features/get_weater/data/models/weather_forecast_days.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather_details.dart';
import 'package:weathercast/features/get_weater/domain/repositories/weather_repository_abstract.dart';
import 'package:weathercast/features/networkinfo/network_info_cubit.dart';
import 'package:weathercast/jsonnable.dart';
import 'package:meta/meta.dart';

typedef CreateResponse<T> = T Function(Map<String, dynamic> json);

class WeatherRepository implements WeatherRepositoryAbstract {
  static const _WEATHER_URL = '/weather';
  static const _FORECAST_URL = '/onecall';

  static const EXCLUDE_MINUTELY = 'minutely';
  static const EXCLUDE_CURRENT = 'current';
  static const EXCLUDE_HOURLY = 'hourly';
  static const EXCLUDE_ALERTS = 'alerts';

  static const UNITS_METRIC = 'metric';
  static const UNITS_STANDARD = 'standard';
  static const UNITS_IMPERIAL = 'imperial';

  final NetworkInfoAbstract networkInfo;
  final DataSource remoteDataSource;

  WeatherRepository(this.networkInfo, this.remoteDataSource);

  @visibleForTesting
  Future<Either<Failure, T>> get<T>(
      Jsonnable request, String apiZone, CreateResponse<T> callBack) async {
    try {
      if (!await networkInfo.isConnected()) {
        return Left(NoInternetConnection());
      }

      final String? response = await remoteDataSource.fetchData(
        apiZone,
        queryParameters: request.toJson(),
      );

      if (response is! String) {
        return Left(EmptyResponse());
      }

      return Right(callBack(jsonDecode(response)));
    } catch (e) {
      return Left(CityRepositoryFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Weather>> byCityName(WeatherByCityName request) async {
    return get(request, _WEATHER_URL, (json) => Weather.fromJson(json));
  }

  @override
  Future<Either<Failure, Weather>> byCoordinates(WeatherByCoord request) async {
    return get(request, _WEATHER_URL, (json) => Weather.fromJson(json));
  }

  @override
  Future<Either<Failure, WeatherDetails>> forecast(
      WeatherForecastDays request) async {
    return get(
        request, _FORECAST_URL, (json) => WeatherDetails.fromJson(json));
  }
}
