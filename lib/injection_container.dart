import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';
import 'package:weathercast/data_source/data_source_abstract.dart';
import 'package:weathercast/data_source/rest_data_source.dart';
import 'package:weathercast/dbs/cities/cities_db.dart';
import 'package:weathercast/dbs/cities/city.dart';
import 'package:weathercast/features/city/data/repositories/city_repository.dart';
import 'package:weathercast/features/city/domain/repositories/city_repository_abstract.dart';
import 'package:weathercast/features/city/domain/usecases/delete/delete_city_cubit.dart';
import 'package:weathercast/features/city/domain/usecases/list_with_predefined_cities.dart';
import 'package:weathercast/features/get_weater/data/repositories/wether_repository.dart';
import 'package:weathercast/features/get_weater/domain/repositories/weather_repository_abstract.dart';
import 'package:weathercast/features/get_weater/domain/usecases/get_city_weather.dart';
import 'package:weathercast/features/get_weater/domain/usecases/get_city_weather_stream.dart';
import 'package:weathercast/features/get_weater/presentation/bloc/city_weather_details/city_weather_details_cubit.dart';
import 'package:weathercast/features/location/data/repositories/loaction_repository.dart';
import 'package:weathercast/features/location/domain/repositories/location_repository_abstract.dart';
import 'package:weathercast/features/location/domain/usecases/current_location_cubit.dart';
import 'package:weathercast/features/networkinfo/network_info_cubit.dart';

import 'features/city/domain/usecases/add.dart';

final GetIt serviceLocator = GetIt.instance;

init() async {
  serviceLocator.registerLazySingleton<CitiesDB>(() => CitiesDB());
  serviceLocator.registerLazySingleton<CityDao>(
    () => CityDao(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<CityRepositoryAbstract>(
    () => CityDbRepository(serviceLocator()),
  );
  serviceLocator.registerFactory<CityWithLocalAndPredefinedUseCase>(
    () => CityWithLocalAndPredefinedUseCase(serviceLocator(), serviceLocator()),
  );
  serviceLocator.registerLazySingleton<LocationRepositoryAbstract>(
    () => LocationRepository(location: Location()),
  );
  serviceLocator.registerLazySingleton<CurrentLocationCubit>(
    () => CurrentLocationCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<CityAddUseCase>(
    () => CityAddUseCase(serviceLocator(), serviceLocator()),
  );
  serviceLocator.registerLazySingleton<NetworkInfoAbstract>(
    () => NetworkInfoCubit(InternetConnectionChecker()),
  );
  serviceLocator.registerLazySingleton<WeatherRepositoryAbstract>(
    () => WeatherRepository(serviceLocator(), serviceLocator()),
  );
  serviceLocator.registerLazySingleton<GetCityWeatherUseCase>(
    () => GetCityWeatherUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<GetCityWeatherStreamUseCase>(
    () => GetCityWeatherStreamUseCase(serviceLocator(), serviceLocator()),
  );
  serviceLocator.registerLazySingleton<DataSource>(
    () => RestClient(),
  );
  serviceLocator.registerLazySingleton<DeleteCityCubit>(
    () => DeleteCityCubit(serviceLocator()),
  );
  serviceLocator.registerFactory<CityWeatherDetailsCubit>(
    () => CityWeatherDetailsCubit(serviceLocator()),
  );
}
