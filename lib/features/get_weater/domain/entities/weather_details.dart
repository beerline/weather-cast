import 'package:weathercast/features/get_weater/domain/entities/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherDetails {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final List<WeatherSpecs> daily;
  final List<HourlyWeatherSpecs> hourly;
  final CurrentWeatherSpecs current;

  WeatherDetails(
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.daily,
    this.hourly,
    this.current,
  );

  factory WeatherDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Temperature {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  Temperature(this.day, this.min, this.max, this.night, this.eve, this.morn);

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FeelsLike {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherSpecs {
  final int dt;
  final Temperature temp;
  final List<WeatherDescription> weather;

  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final double? moonPhase;
  final FeelsLike? feelsLike;
  final double? pressure;
  final double? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final double? windDeg;
  final double? windGust;
  final double? clouds;
  final double? pop;
  final double? uvi;

  WeatherSpecs(
    this.dt,
    this.temp,
    this.weather, {
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.clouds,
    this.pop,
    this.uvi,
  });

  factory WeatherSpecs.fromJson(Map<String, dynamic> json) =>
      _$WeatherSpecsFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherSpecsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CurrentWeatherSpecs {
  final int dt;
  final double temp;
  final List<WeatherDescription> weather;
  final int? sunrise;
  final int? sunset;
  final double? feelsLike;
  final double? pressure;
  final double? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final double? windDeg;
  final double? windGust;
  final double? clouds;
  final double? uvi;
  final double? visibility;

  CurrentWeatherSpecs(
    this.dt,
    this.temp,
    this.weather, {
    this.sunrise,
    this.sunset,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.clouds,
    this.uvi,
    this.visibility,
  });

  factory CurrentWeatherSpecs.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherSpecsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherSpecsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class HourlyWeatherSpecs {
  final int dt;
  final double temp;
  final List<WeatherDescription> weather;
  final double? feelsLike;
  final double? pressure;
  final double? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final double? windDeg;
  final double? windGust;
  final double? clouds;
  final double? uvi;
  final double? visibility;
  final double? pop;

  HourlyWeatherSpecs(
    this.dt,
    this.temp,
    this.weather, {
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.clouds,
    this.uvi,
    this.visibility,
    this.pop,
  });

  factory HourlyWeatherSpecs.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherSpecsFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherSpecsToJson(this);
}
