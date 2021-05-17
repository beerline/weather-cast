import 'package:dio/dio.dart';

abstract class DataSource {
  Future<String?> fetchData(
    String url, {
    ProgressCallback onReceiveProgress,
    Map<String, dynamic> queryParameters = const {},
  });
}
