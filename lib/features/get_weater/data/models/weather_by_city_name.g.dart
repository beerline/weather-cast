// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_by_city_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherByCityName _$WeatherByCityNameFromJson(Map<String, dynamic> json) {
  return WeatherByCityName(
    json['q'] as String,
    json['units'] as String,
  );
}

Map<String, dynamic> _$WeatherByCityNameToJson(WeatherByCityName instance) =>
    <String, dynamic>{
      'q': instance.q,
      'units': instance.units,
    };
