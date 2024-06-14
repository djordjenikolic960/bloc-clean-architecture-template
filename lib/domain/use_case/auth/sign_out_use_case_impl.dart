import '../../repository/auth_repository.dart';
import 'sign_out_use_case.dart';

class SignOutUseCaseImpl implements SignOutUseCase {
  final AuthRepository _authRepository;

  SignOutUseCaseImpl(this._authRepository);

  @override
  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
