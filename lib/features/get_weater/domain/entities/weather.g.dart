// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    (json['weather'] as List<dynamic>)
        .map((e) => WeatherDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    _Main.fromJson(json['main'] as Map<String, dynamic>),
    json['visibility'] as int,
    json['dt'] as int,
    _Wind.fromJson(json['wind'] as Map<String, dynamic>),
    _Coord.fromJson(json['coord'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'coord': instance.coord.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'main': instance.main.toJson(),
      'visibility': instance.visibility,
      'dt': instance.dt,
      'wind': instance.wind.toJson(),
    };

WeatherDescription _$WeatherDescriptionFromJson(Map<String, dynamic> json) {
  return WeatherDescription(
    json['id'] as int,
    json['main'] as String,
    json['description'] as String,
    json['icon'] as String,
  );
}

Map<String, dynamic> _$WeatherDescriptionToJson(WeatherDescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_Coord _$_CoordFromJson(Map<String, dynamic> json) {
  return _Coord(
    (json['lat'] as num).toDouble(),
    (json['lon'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_CoordToJson(_Coord instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

_Main _$_MainFromJson(Map<String, dynamic> json) {
  return _Main(
    (json['temp'] as num).toDouble(),
    (json['feels_like'] as num).toDouble(),
    (json['temp_min'] as num).toDouble(),
    (json['temp_max'] as num).toDouble(),
    (json['pressure'] as num).toDouble(),
    (json['humidity'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_MainToJson(_Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

_Wind _$_WindFromJson(Map<String, dynamic> json) {
  return _Wind(
    (json['speed'] as num).toDouble(),
    (json['deg'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_WindToJson(_Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };
