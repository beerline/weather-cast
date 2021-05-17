import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather.dart';

class CityWeather {
  final City city;
  final Weather? weather;

  CityWeather(this.city, {this.weather});
}