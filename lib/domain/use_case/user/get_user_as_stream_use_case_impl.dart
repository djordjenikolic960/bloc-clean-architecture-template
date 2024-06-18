import '../../entity/user_entity.dart';
import '../../repository/user_repository.dart';
import 'get_user_as_stream_use_case.dart';

class GetUserAsStreamUseCaseImpl implements GetUserAsStreamUseCase {
  final UserRepository _userRepository;

  GetUserAsStreamUseCaseImpl(this._userRepository);

  @override
  Stream<UserEntity?> get(String id) {
   return _userRepository.getUserAsStream(id);
  }

}