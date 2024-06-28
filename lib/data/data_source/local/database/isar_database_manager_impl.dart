import 'package:isar/isar.dart';

import 'database_manager.dart';

class IsarDatabaseManagerImpl implements DatabaseManager {
  final Isar _isar;

  IsarDatabaseManagerImpl(this._isar);

  IsarCollection<T> getCollection<T>() {
    return _isar.collection<T>();
  }

  @override
  Future<T?> getById<T>(final int id) async {
    return await _isar.collection<T>().get(id);
  }

  @override
  Future<void> put<T>(final T t) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().put(t);
    });
  }

  @override
  Future<void> putAll<T>(List<T> t) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().putAll(t);
    });
  }

  @override
  Future<void> delete<T>(final int id) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().delete(id);
    });
  }

  @override
  Future<void> deleteAll<T>(final List<int> ids) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().deleteAll(ids);
    });
  }

  @override
  Future<void> clearAll<T>() async {
    await _isar.writeTxn(() async {
      await clearAllWithoutTransaction();
    });
  }

  @override
  Stream<List<T>> getCollectionStream<T>() {
    return _isar.collection<T>().where().watch(fireImmediately: true);
  }

  @override
  Stream<T?> getStream<T>(int id) {
    return _isar.collection<T>().watchObject(id, fireImmediately: true);
  }

  @override
  Future<void> writeTransactionAsync<T>(Function transaction) async {
    await _isar.writeTxn(() async {
      await transaction();
    });
  }

  @override
  Future<void> writeTransactionSync<T>(Function transaction) async {
    await _isar.writeTxnSync(() async {
      await transaction();
    });
  }

  @override
  Future<void> clearAllWithoutTransaction<T>() async {
    await _isar.collection<T>().clear();
  }

  @override
  Future<void> putAllWithoutTransaction<T>(List<T> t) async {
    await _isar.collection<T>().putAll(t);
  }
}
