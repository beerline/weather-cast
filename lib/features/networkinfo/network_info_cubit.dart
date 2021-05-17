import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

part 'network_info_state.dart';

abstract class NetworkInfoAbstract extends Cubit<NetworkInfoStateAbstract>   {
  NetworkInfoAbstract(NetworkInfoStateAbstract initialState) : super(initialState);

  Future<bool> isConnected();
}

class NetworkInfoCubit extends Cubit<NetworkInfoStateAbstract> implements NetworkInfoAbstract{
  final InternetConnectionChecker connectionChecker;

  NetworkInfoCubit(this.connectionChecker) : super(NetworkInfoInitial());

  @override
  Future<bool> isConnected() async {
    if (await connectionChecker.hasConnection) {
      return true;
    }
    
    emit(NetworkInfoNoConnection());

    return false;
  }
}
