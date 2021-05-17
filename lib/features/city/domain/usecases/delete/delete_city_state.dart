part of 'delete_city_cubit.dart';

@immutable
abstract class DeleteCityStateAbstract {}

class DeleteCityInitial extends DeleteCityStateAbstract {}
class DeleteCitySuccessfully extends DeleteCityStateAbstract {
  final City city;

  DeleteCitySuccessfully(this.city);
}
