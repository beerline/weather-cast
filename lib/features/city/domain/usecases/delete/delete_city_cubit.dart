import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weathercast/features/city/domain/entities/city.dart';
import 'package:weathercast/features/city/domain/repositories/city_repository_abstract.dart';

part 'delete_city_state.dart';

class DeleteCityCubit extends Cubit<DeleteCityStateAbstract> {
  final CityRepositoryAbstract _repository;

  DeleteCityCubit(this._repository) : super(DeleteCityInitial());

  Future<bool> delete(City city) async {
    var res = await _repository.delete(city);
    return res.fold((l) => false, (r) {
      emit(DeleteCitySuccessfully(city));
      return r;
    });
  }
}
