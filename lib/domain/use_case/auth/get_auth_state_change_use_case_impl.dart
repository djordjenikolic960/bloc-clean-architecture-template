import 'package:firebase_auth/firebase_auth.dart';

import '../../repository/auth_repository.dart';
import 'get_auth_state_change_use_case.dart';

class GetAuthStateChangeUseCaseImpl implements GetAuthStateChangeUseCase {
  final AuthRepository _authRepository;

  GetAuthStateChangeUseCaseImpl(this._authRepository);

  @override
  Stream<User?> get() {
    return _authRepository.authStateChanges;
  }
}
