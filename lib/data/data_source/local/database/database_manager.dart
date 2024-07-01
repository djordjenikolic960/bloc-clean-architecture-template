import 'package:isar/isar.dart';

abstract class DatabaseManager {
  Future<T?> getById<T>(final int id);

  Future<void> put<T>(final T t);

  Future<void> delete<T>(final int id);

  Future<void> deleteAll<T>(final List<int> ids);

  Future<void> clearAll<T>();

  Future<void> clearAllWithoutTransaction<T>();

  Future<void> writeTransactionAsync<T>(Function transaction);

  Future<void> writeTransactionSync<T>(Function transaction);

  Future<void> putAll<T>(final List<T> t);

  Future<void> putAllWithoutTransaction<T>(final List<T> t);

  Stream<List<T>> getCollectionStream<T>();

  Stream<T?> getStream<T>(final int id);

  IsarCollection<T> getCollection<T>();
}
