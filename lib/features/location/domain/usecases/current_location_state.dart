part of 'current_location_cubit.dart';

@immutable
abstract class CurrentLocationStateAbstract {}

class CurrentLocationInitialState extends CurrentLocationStateAbstract {}
class CurrentLocationErrorState extends CurrentLocationStateAbstract {
  final String message;

  CurrentLocationErrorState(this.message);
}
