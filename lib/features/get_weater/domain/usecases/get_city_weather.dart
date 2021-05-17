import 'package:dartz/dartz.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/get_weater/data/models/weather_by_city_name.dart';
import 'package:weathercast/features/get_weater/data/models/weather_by_coord.dart';
import 'package:weathercast/features/get_weater/data/repositories/wether_repository.dart';
import 'package:weathercast/features/get_weater/domain/entities/city_weather.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather.dart';
import 'package:weathercast/features/get_weater/domain/repositories/weather_repository_abstract.dart';

class GetCityWeatherUseCase {
  final WeatherRepositoryAbstract repository;

  GetCityWeatherUseCase(this.repository);

  Future<CityWeather> call(City city) async {
    Either<Failure, Weather> weatherOrFailure;
    if (city.lat is double && city.lon is double) {
      weatherOrFailure = await repository.byCoordinates(WeatherByCoord(
        city.lat!,
        city.lon!,
        WeatherRepository.UNITS_METRIC,
      ));
    } else {
      weatherOrFailure = await repository.byCityName(
          WeatherByCityName(city.name, WeatherRepository.UNITS_METRIC));
    }

    return weatherOrFailure.fold(
      (l) => CityWeather(city),
      (r) => CityWeather(city, weather: r),
    );
  }
}
