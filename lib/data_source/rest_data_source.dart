import 'package:dio/dio.dart';
import 'package:weathercast/data_source/data_source_abstract.dart';

class RestClient implements DataSource {
  final String _baseUrl = 'https://api.openweathermap.org';
  final String _apiResource = 'data';
  final String _version = '2.5';
  final String _apiId = 'e8dc5ae844dbd3d7f1f8a9c9cefb9d6b';
  late final Dio _client;

  RestClient() {
    _client = Dio();
    _client.options.baseUrl = [_baseUrl, _apiResource, _version].join('/');
  }

  @override
  Future<String?> fetchData(
    String url, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    queryParameters.addAll({'appid': _apiId});
    Response<String> response = await _client.get(
      url,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
