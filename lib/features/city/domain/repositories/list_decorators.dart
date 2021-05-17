import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/city/domain/usecases/list_with_predefined_cities.dart';
import 'package:weathercast/features/location/domain/usecases/current_location_cubit.dart';
import 'package:meta/meta.dart';

abstract class CityListDecoratorAbstract implements CityListAbstract {
  @protected
  final CityListAbstract? decorated;

  CityListDecoratorAbstract({this.decorated});
}

class CityListWithLocalDecorator extends CityListDecoratorAbstract {
  final CurrentLocationCubit _currentLocation;

  CityListWithLocalDecorator(this._currentLocation,
      {CityListAbstract? decorated})
      : super(decorated: decorated);

  @override
  Stream<List<City>> watchList() async* {
    var locationOrFailure = await _currentLocation.get();

    await for (List<City> cityList
        in decorated?.watchList() ?? Stream.empty()) {
      locationOrFailure.fold(
        (l) => l,
        (r) {
          var city =
              City('Current location', lat: r.latitude, lon: r.longitude);
          cityList.add(city);
        },
      );

      yield cityList;
    }
  }
}

class CityListWithBostonDecorator extends CityListDecoratorAbstract {
  CityListWithBostonDecorator({CityListAbstract? decorated})
      : super(decorated: decorated);

  @override
  Stream<List<City>> watchList() async* {
    await for (List<City> cityList
        in decorated?.watchList() ?? Stream.empty()) {
      cityList.add(City('Boston', lat: 42.3584, lon: -71.0598));
      yield cityList;
    }
  }
}
