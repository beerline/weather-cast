import 'package:dartz/dartz.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/get_weater/data/models/weather_by_city_name.dart';
import 'package:weathercast/features/get_weater/data/models/weather_by_coord.dart';
import 'package:weathercast/features/get_weater/data/models/weather_forecast_days.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather_details.dart';

abstract class WeatherRepositoryAbstract {
  Future<Either<Failure, Weather>> byCityName(WeatherByCityName request);
  Future<Either<Failure, Weather>> byCoordinates(WeatherByCoord request);
  Future<Either<Failure, WeatherDetails>> forecast(WeatherForecastDays request);
}