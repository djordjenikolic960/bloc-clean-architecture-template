abstract interface class SharedPreferencesService {
  Future<void> save<T>(String key, T value);

  Future<T?> get<T>(String key);
}
