import '../../repository/auth_repository.dart';
import 'send_password_reset_email_use_case.dart';

class SendPasswordResetEmailUseCaseImpl
    implements SendPasswordResetEmailUseCase {
  final AuthRepository _authRepository;

  SendPasswordResetEmailUseCaseImpl(this._authRepository);

  @override
  Future<void> send(String email) async {
    await _authRepository.sendPasswordResetEmail(email);
  }
}
