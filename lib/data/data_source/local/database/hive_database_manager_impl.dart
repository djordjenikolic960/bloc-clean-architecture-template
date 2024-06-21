import 'package:hive/hive.dart';

import 'database_manager.dart';

class HiveDatabaseManager<T> implements DatabaseManager<T> {
  final Box<T> box;

  HiveDatabaseManager(this.box);

  @override
  Future<void> insert(String table, T data) {
    return box.add(data);
  }

  @override
  Future<void> update(int id, T data) {
    return box.put(id, data);
  }

  @override
  Future<void> delete(String table, dynamic id) {
    return box.delete(id);
  }

  @override
  Future<List<T>> getAll(String table) {
    return Future.value(box.values.toList());
  }

  @override
  Future<T?> get(String table, dynamic id) {
    return Future.value(box.get(id));
  }
}