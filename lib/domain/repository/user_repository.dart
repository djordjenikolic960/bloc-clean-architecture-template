import '../entity/user_entity.dart';

abstract class UserRepository {
  Future<void> saveUser(UserEntity user);

  Future<UserEntity?> getUser(String id);

  Stream<UserEntity?> getUserAsStream(String id);
}
