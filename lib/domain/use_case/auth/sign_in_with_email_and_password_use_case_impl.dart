import '../../repository/auth_repository.dart';
import 'sign_in_with_email_and_password_use_case.dart';

class SignInWithEmailAndPasswordUseCaseImpl
    implements SignInWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;

  SignInWithEmailAndPasswordUseCaseImpl(this._authRepository);

  @override
  Future<void> signIn(String email, String password) async {
    await _authRepository.signIn(email, password);
  }
}
