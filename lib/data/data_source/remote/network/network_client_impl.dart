import 'package:dio/dio.dart';

import 'constants.dart';
import 'network_client.dart';

class NetworkClientImpl implements NetworkClient {
  final Dio _dio;

  NetworkClientImpl(this._dio) {
    updateConnectionTimeout();
    addAuthInterceptor();
  }

  @override
  void updateConnectionTimeout({int? connectionTimeout}) {
    _dio.options
      ..baseUrl = NetworkConstants.baseUrl
      ..connectTimeout = Duration(
          seconds:
              connectionTimeout ?? NetworkConstants.connectionTimeoutInSeconds);
  }

  @override
  void updateBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  @override
  void addAuthInterceptor() {
    // If we already have AuthInterceptor, remove it before adding new one
    /*   _dio.interceptors.removeWhere((element) => element is AuthInterceptor);
    _dio.interceptors.add(AuthInterceptor(_dio));*/
  }

  @override
  Future<T> get<T>(String path, Map<String, dynamic>? queryParams) async {
    final finalPath = "${_dio.options.baseUrl}$path";
    final response = await _dio.get(finalPath, queryParameters: queryParams);
    return response.data as T;
  }

  @override
  Future<T> post<T, K>(String path, K body) async {
    final response = await _dio.post(path, data: body);
    return response.data as T;
  }

  @override
  void addHeaderParam(String name, String value) {
    _dio.options.headers[name] = value;
  }

  @override
  void removeHeaderParam(final String key) {
    _dio.options.headers.remove(key);
  }

  @override
  Future<T> put<T, K>(String path, K body) async {
    return await _dio.put(path, data: body) as T;
  }
}
