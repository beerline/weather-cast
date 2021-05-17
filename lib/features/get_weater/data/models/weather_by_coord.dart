import 'package:json_annotation/json_annotation.dart';
import 'package:weathercast/jsonnable.dart';

part 'weather_by_coord.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherByCoord implements Jsonnable {
  final double lat;
  final double lon;
  final String units;

  WeatherByCoord(this.lat, this.lon, this.units);

  factory WeatherByCoord.fromJson(Map<String, dynamic> json) =>
      _$WeatherByCoordFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherByCoordToJson(this);
}
