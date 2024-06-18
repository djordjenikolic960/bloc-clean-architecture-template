import '../../entity/user_entity.dart';
import '../../repository/user_repository.dart';
import 'save_user_use_case.dart';

class SaveUserUseCaseImpl implements SaveUserUseCase {
  final UserRepository _userRepository;

  SaveUserUseCaseImpl(this._userRepository);

  @override
  Future<void> save(UserEntity user) async {
    await _userRepository.saveUser(user);
  }
}
