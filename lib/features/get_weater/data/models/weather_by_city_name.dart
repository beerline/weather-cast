import 'package:json_annotation/json_annotation.dart';
import 'package:weathercast/jsonnable.dart';

part 'weather_by_city_name.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherByCityName implements Jsonnable {
  final String q;
  final String units;

  WeatherByCityName(this.q, this.units);

  factory WeatherByCityName.fromJson(Map<String, dynamic> json) =>
      _$WeatherByCityNameFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherByCityNameToJson(this);
}
