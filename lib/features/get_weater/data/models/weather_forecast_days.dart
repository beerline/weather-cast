import 'package:json_annotation/json_annotation.dart';
import 'package:weathercast/jsonnable.dart';

part 'weather_forecast_days.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherForecastDays implements Jsonnable {
  final double lat;
  final double lon;
  final String units;
  final String? exclude;

  WeatherForecastDays(this.lat, this.lon, this.units, {this.exclude});

  factory WeatherForecastDays.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDaysFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastDaysToJson(this);
}
