import '../../repository/auth_repository.dart';
import 'log_in_with_email_and_password_use_case.dart';

class LogInWithEmailAndPasswordUseCaseImpl
    implements LogInWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;

  LogInWithEmailAndPasswordUseCaseImpl(
    this._authRepository,
  );

  @override
  Future<void> logIn(String email, String password) async {
    await _authRepository.logIn(email, password);
  }
}
