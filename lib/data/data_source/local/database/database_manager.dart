abstract interface class DatabaseManager<T> {
  Future<void> insert(String table, T data);

  Future<void> update(int id, T data);

  Future<void> delete(String table, dynamic id);

  Future<List<T>> getAll(String table);

  Future<T?> get(String table, dynamic id);
}
