// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_by_coord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherByCoord _$WeatherByCoordFromJson(Map<String, dynamic> json) {
  return WeatherByCoord(
    (json['lat'] as num).toDouble(),
    (json['lon'] as num).toDouble(),
    json['units'] as String,
  );
}

Map<String, dynamic> _$WeatherByCoordToJson(WeatherByCoord instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'units': instance.units,
    };
