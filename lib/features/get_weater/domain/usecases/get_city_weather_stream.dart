import 'package:weathercast/features/city/domain/usecases/list_with_predefined_cities.dart';
import 'package:weathercast/features/get_weater/domain/entities/city_weather.dart';
import 'package:weathercast/features/get_weater/domain/usecases/get_city_weather.dart';

class GetCityWeatherStreamUseCase {
  final CityWithLocalAndPredefinedUseCase cityStream;
  final GetCityWeatherUseCase weatherService;

  GetCityWeatherStreamUseCase(this.cityStream, this.weatherService);

  Stream<List<CityWeather>> watchList() async* {
    await for (var cityList in cityStream.watchList()) {
      List<CityWeather> cityWeatherList = [];
      for (var city in cityList) {
        var weatherCity = await weatherService(city);
        cityWeatherList.add(weatherCity);
      }
      yield cityWeatherList;
    }
  }
}
