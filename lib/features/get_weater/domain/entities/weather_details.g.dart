// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetails _$WeatherDetailsFromJson(Map<String, dynamic> json) {
  return WeatherDetails(
    (json['lat'] as num).toDouble(),
    (json['lon'] as num).toDouble(),
    json['timezone'] as String,
    json['timezone_offset'] as int,
    (json['daily'] as List<dynamic>)
        .map((e) => WeatherSpecs.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['hourly'] as List<dynamic>)
        .map((e) => HourlyWeatherSpecs.fromJson(e as Map<String, dynamic>))
        .toList(),
    CurrentWeatherSpecs.fromJson(json['current'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherDetailsToJson(WeatherDetails instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'daily': instance.daily.map((e) => e.toJson()).toList(),
      'hourly': instance.hourly.map((e) => e.toJson()).toList(),
      'current': instance.current.toJson(),
    };

Temperature _$TemperatureFromJson(Map<String, dynamic> json) {
  return Temperature(
    (json['day'] as num).toDouble(),
    (json['min'] as num).toDouble(),
    (json['max'] as num).toDouble(),
    (json['night'] as num).toDouble(),
    (json['eve'] as num).toDouble(),
    (json['morn'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

FeelsLike _$FeelsLikeFromJson(Map<String, dynamic> json) {
  return FeelsLike(
    day: (json['day'] as num?)?.toDouble(),
    night: (json['night'] as num?)?.toDouble(),
    eve: (json['eve'] as num?)?.toDouble(),
    morn: (json['morn'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$FeelsLikeToJson(FeelsLike instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

WeatherSpecs _$WeatherSpecsFromJson(Map<String, dynamic> json) {
  return WeatherSpecs(
    json['dt'] as int,
    Temperature.fromJson(json['temp'] as Map<String, dynamic>),
    (json['weather'] as List<dynamic>)
        .map((e) => WeatherDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    sunrise: json['sunrise'] as int?,
    sunset: json['sunset'] as int?,
    moonrise: json['moonrise'] as int?,
    moonset: json['moonset'] as int?,
    moonPhase: (json['moon_phase'] as num?)?.toDouble(),
    feelsLike: json['feels_like'] == null
        ? null
        : FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
    pressure: (json['pressure'] as num?)?.toDouble(),
    humidity: (json['humidity'] as num?)?.toDouble(),
    dewPoint: (json['dew_point'] as num?)?.toDouble(),
    windSpeed: (json['wind_speed'] as num?)?.toDouble(),
    windDeg: (json['wind_deg'] as num?)?.toDouble(),
    windGust: (json['wind_gust'] as num?)?.toDouble(),
    clouds: (json['clouds'] as num?)?.toDouble(),
    pop: (json['pop'] as num?)?.toDouble(),
    uvi: (json['uvi'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherSpecsToJson(WeatherSpecs instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'feels_like': instance.feelsLike?.toJson(),
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
    };

CurrentWeatherSpecs _$CurrentWeatherSpecsFromJson(Map<String, dynamic> json) {
  return CurrentWeatherSpecs(
    json['dt'] as int,
    (json['temp'] as num).toDouble(),
    (json['weather'] as List<dynamic>)
        .map((e) => WeatherDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    sunrise: json['sunrise'] as int?,
    sunset: json['sunset'] as int?,
    feelsLike: (json['feels_like'] as num?)?.toDouble(),
    pressure: (json['pressure'] as num?)?.toDouble(),
    humidity: (json['humidity'] as num?)?.toDouble(),
    dewPoint: (json['dew_point'] as num?)?.toDouble(),
    windSpeed: (json['wind_speed'] as num?)?.toDouble(),
    windDeg: (json['wind_deg'] as num?)?.toDouble(),
    windGust: (json['wind_gust'] as num?)?.toDouble(),
    clouds: (json['clouds'] as num?)?.toDouble(),
    uvi: (json['uvi'] as num?)?.toDouble(),
    visibility: (json['visibility'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$CurrentWeatherSpecsToJson(
        CurrentWeatherSpecs instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'clouds': instance.clouds,
      'uvi': instance.uvi,
      'visibility': instance.visibility,
    };

HourlyWeatherSpecs _$HourlyWeatherSpecsFromJson(Map<String, dynamic> json) {
  return HourlyWeatherSpecs(
    json['dt'] as int,
    (json['temp'] as num).toDouble(),
    (json['weather'] as List<dynamic>)
        .map((e) => WeatherDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    feelsLike: (json['feels_like'] as num?)?.toDouble(),
    pressure: (json['pressure'] as num?)?.toDouble(),
    humidity: (json['humidity'] as num?)?.toDouble(),
    dewPoint: (json['dew_point'] as num?)?.toDouble(),
    windSpeed: (json['wind_speed'] as num?)?.toDouble(),
    windDeg: (json['wind_deg'] as num?)?.toDouble(),
    windGust: (json['wind_gust'] as num?)?.toDouble(),
    clouds: (json['clouds'] as num?)?.toDouble(),
    uvi: (json['uvi'] as num?)?.toDouble(),
    visibility: (json['visibility'] as num?)?.toDouble(),
    pop: (json['pop'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$HourlyWeatherSpecsToJson(HourlyWeatherSpecs instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'clouds': instance.clouds,
      'uvi': instance.uvi,
      'visibility': instance.visibility,
      'pop': instance.pop,
    };
