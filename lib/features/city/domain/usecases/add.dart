import 'package:dartz/dartz.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/city/domain/repositories/city_repository_abstract.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather.dart';
import 'package:weathercast/features/get_weater/domain/usecases/get_city_weather.dart';

class CityAddUseCase {
  final CityRepositoryAbstract _repository;
  final GetCityWeatherUseCase _getCityWeather;

  CityAddUseCase(this._repository, this._getCityWeather);

  Future<Either<Failure, City>> call(City city) async {
    var cityWeather = await _getCityWeather(city);

    if (cityWeather.weather is! Weather) {
      return Left(CityNotFound());
    }

    if (cityWeather.weather?.coord.lat is! double ||
        cityWeather.weather?.coord.lon is! double) {
      return Left(CityNotFound());
    }

    var newCity = city.copyWith(
      lat: cityWeather.weather!.coord.lat,
      lon: cityWeather.weather!.coord.lon,
    );

    var res = await _repository.add(newCity);

    return res;
  }
}
