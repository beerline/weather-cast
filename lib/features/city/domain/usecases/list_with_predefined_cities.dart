import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/city/domain/repositories/city_repository_abstract.dart';
import 'package:weathercast/features/city/domain/repositories/list_decorators.dart';
import 'package:weathercast/features/location/domain/usecases/current_location_cubit.dart';

abstract class CityListAbstract {
  Stream<List<City>> watchList();
}

class CityWithLocalAndPredefinedUseCase {
  final CityRepositoryAbstract _repository;
  final CurrentLocationCubit _currentLocation;

  CityWithLocalAndPredefinedUseCase(this._repository, this._currentLocation);

  Stream<List<City>> watchList() async* {
    final withLocalCity =
        CityListWithLocalDecorator(_currentLocation, decorated: _repository);

    final withBoston = CityListWithBostonDecorator(decorated: withLocalCity);
    await for (var cityList in withBoston.watchList()) {
      yield cityList;
    }
  }
}
