import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/remote/user_remote_data_source.dart';
import '../model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<void> saveUser(UserEntity user) async {
    final userModel = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
    await _remoteDataSource.saveUser(userModel);
  }

  @override
  Future<UserEntity?> getUser(String id) async {
    final userModel = await _remoteDataSource.getUser(id);
    if (userModel != null) {
      return UserEntity(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
      );
    }
    return null;
  }

  @override
  Stream<UserEntity?> getUserAsStream(String id) {
    return _remoteDataSource.getUserAsStream(id).map((userModel) {
      if (userModel != null) {
        return UserEntity(
          id: userModel.id,
          name: userModel.name,
          email: userModel.email,
        );
      }
      return null;
    });
  }
}
