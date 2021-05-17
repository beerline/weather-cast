part of 'city_weather_details_cubit.dart';

@immutable
abstract class CityWeatherDetailsStateAbstract {}

class CityWeatherDetailsInitial extends CityWeatherDetailsStateAbstract {}
class CityWeatherDetailsLoading extends CityWeatherDetailsStateAbstract {}
class CityWeatherDetailsLoaded extends CityWeatherDetailsStateAbstract {
  final WeatherDetails weatherDetails;

  CityWeatherDetailsLoaded(this.weatherDetails);
}
class CityWeatherDetailsError extends CityWeatherDetailsStateAbstract {
  final String message;

  CityWeatherDetailsError(this.message);
}
