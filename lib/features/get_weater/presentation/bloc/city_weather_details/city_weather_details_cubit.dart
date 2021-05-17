import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/get_weater/data/models/weather_forecast_days.dart';
import 'package:weathercast/features/get_weater/data/repositories/wether_repository.dart';
import 'package:weathercast/features/get_weater/domain/entities/weather_details.dart';
import 'package:weathercast/features/get_weater/domain/repositories/weather_repository_abstract.dart';

part 'city_weather_details_state.dart';

class CityWeatherDetailsCubit extends Cubit<CityWeatherDetailsStateAbstract> {
  final WeatherRepositoryAbstract _repository;

  CityWeatherDetailsCubit(this._repository)
      : super(CityWeatherDetailsInitial());

  Future<void> call(City city) async {
    emit(CityWeatherDetailsLoading());

    var res = await _repository.forecast(WeatherForecastDays(
        city.lat!,
        city.lon!,
        WeatherRepository.UNITS_METRIC,
        exclude: [
          WeatherRepository.EXCLUDE_MINUTELY,
          WeatherRepository.EXCLUDE_ALERTS
        ].join(',')));

    res.fold((l) {
      emit(CityWeatherDetailsError(l.message));
    }, (r) {
      emit(CityWeatherDetailsLoaded(r));
    });
  }
}
