import '../../entity/user_entity.dart';

abstract class GetUserAsStreamUseCase {
  Stream<UserEntity?> get(String id);
}
