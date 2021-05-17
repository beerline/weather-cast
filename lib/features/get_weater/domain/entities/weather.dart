import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Weather {
  final _Coord coord;
  final List<WeatherDescription> weather;
  final _Main main;
  final int visibility;
  final int dt;
  final _Wind wind;

  Weather(this.weather, this.main, this.visibility, this.dt, this.wind, this.coord);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherDescription {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDescription(this.id, this.main, this.description, this.icon);

  factory WeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDescriptionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _Coord {
  final double lat;
  final double lon;

  _Coord(this.lat, this.lon);

  factory _Coord.fromJson(Map<String, dynamic> json) =>
      _$_CoordFromJson(json);

  Map<String, dynamic> toJson() => _$_CoordToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double humidity;

  _Main(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure,
      this.humidity);

  factory _Main.fromJson(Map<String, dynamic> json) =>
      _$_MainFromJson(json);

  Map<String, dynamic> toJson() => _$_MainToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _Wind {
  final double speed;
  final double deg;

  _Wind(this.speed, this.deg);

  factory _Wind.fromJson(Map<String, dynamic> json) =>
      _$_WindFromJson(json);

  Map<String, dynamic> toJson() => _$_WindToJson(this);
}
