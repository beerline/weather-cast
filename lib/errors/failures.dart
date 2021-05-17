abstract class Failure {
  final message;

  Failure(this.message);
}

class CityRepositoryFailure extends Failure {
  CityRepositoryFailure(message) : super(message);
}

class LocationServiceNotEnabledFailure extends Failure {
  LocationServiceNotEnabledFailure() : super('Can\'t find yuor location');
}

class UseLocationNoPermissionFailure extends Failure {
  UseLocationNoPermissionFailure() : super('Please allow to use your location');
}

class UseLocationPermissionDeniedForeverFailure extends Failure {
  UseLocationPermissionDeniedForeverFailure()
      : super(
            'to enable location tracking pleae go to setting and grand pthe permission');
}

class NoInternetConnection extends Failure {
  NoInternetConnection() : super('No iternet connection');
}

class EmptyResponse extends Failure {
  EmptyResponse() : super('Empty Response');
}

class ConnectionError extends Failure {
  ConnectionError() : super('Connection error');
}

class CityNotFound extends Failure {
  CityNotFound() : super('City not found');
}