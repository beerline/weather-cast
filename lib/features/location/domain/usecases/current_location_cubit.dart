import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:weathercast/errors/failures.dart';
import 'package:weathercast/features/location/domain/repositories/location_repository_abstract.dart';

part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationStateAbstract> {
  final LocationRepositoryAbstract _repository;

  CurrentLocationCubit(this._repository) : super(CurrentLocationInitialState());

  Future<Either<Failure, LocationData>> get() async {
    var locationOrFailure = await _repository.getCurrentLocation();

    return locationOrFailure.fold(
      (l) {
        emit(CurrentLocationErrorState(l.message));
        return Left(l);
      },
      (r) => Right(r),
    );
  }
}
