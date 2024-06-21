abstract class NetworkClient {
  void updateBaseUrl(String baseUrl);

  void updateConnectionTimeout({int? connectionTimeout});

  void addAuthInterceptor();

  void addHeaderParam(String name, String value);

  void removeHeaderParam(final String key);

  Future<T> get<T>(String path, Map<String, String>? queryParams);

  Future<T> post<T, K>(String path, K body);

  Future<T> put<T, K>(String path, K body);
}
