import '../../entity/user_entity.dart';

abstract class SaveUserUseCase {
  Future<void> save(UserEntity user);
}
