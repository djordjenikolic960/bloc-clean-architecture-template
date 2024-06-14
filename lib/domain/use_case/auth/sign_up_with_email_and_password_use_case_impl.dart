import '../../repository/auth_repository.dart';
import 'sign_up_with_email_and_password_use_case.dart';

class SignUpWithEmailAndPasswordUseCaseImpl
    implements SignUpWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;

  SignUpWithEmailAndPasswordUseCaseImpl(this._authRepository);

  @override
  Future<void> signUp(String email, String password) async {
    await _authRepository.signUp(
      email,
      password,
    );
  }
}
