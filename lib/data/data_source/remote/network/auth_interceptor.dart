import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;

  AuthInterceptor(
    this._dio,
  );
}
