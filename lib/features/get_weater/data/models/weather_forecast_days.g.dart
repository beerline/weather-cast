// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_days.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastDays _$WeatherForecastDaysFromJson(Map<String, dynamic> json) {
  return WeatherForecastDays(
    (json['lat'] as num).toDouble(),
    (json['lon'] as num).toDouble(),
    json['units'] as String,
    exclude: json['exclude'] as String?,
  );
}

Map<String, dynamic> _$WeatherForecastDaysToJson(
        WeatherForecastDays instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'units': instance.units,
      'exclude': instance.exclude,
    };
