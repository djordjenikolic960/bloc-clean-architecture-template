import 'package:firebase_auth/firebase_auth.dart';

import '../../repository/auth_repository.dart';
import 'get_user_stream_use_case.dart';

class GetUserStreamUseCaseImpl implements GetUserStreamUseCase {
  final AuthRepository _authRepository;

  GetUserStreamUseCaseImpl(this._authRepository);

  @override
  Stream<User?> get() {
    return _authRepository.authStateChanges;
  }
}
