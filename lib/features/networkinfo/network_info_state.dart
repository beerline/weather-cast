part of 'network_info_cubit.dart';

@immutable
abstract class NetworkInfoStateAbstract {}

class NetworkInfoInitial extends NetworkInfoStateAbstract {}
class NetworkInfoNoConnection extends NetworkInfoStateAbstract {
  static const MESSAGE = 'No internet connection';
}
