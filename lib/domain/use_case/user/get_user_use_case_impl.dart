import 'package:firebase_auth/firebase_auth.dart';

import '../../repository/auth_repository.dart';
import 'get_user_use_case.dart';

class GetUserUseCaseImpl implements GetUserUseCase {
  final AuthRepository _authRepository;

  GetUserUseCaseImpl(this._authRepository);

  @override
  User? get() {
    return _authRepository.getCurrentUser();
  }
}
