import '../../model/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> saveUser(UserModel user);

  Future<UserModel?> getUser(String id);

  Stream<UserModel?> getUserAsStream(String id);
}
