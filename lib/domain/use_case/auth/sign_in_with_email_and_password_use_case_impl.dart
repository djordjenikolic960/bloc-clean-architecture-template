import '../../repository/auth_repository.dart';
import '../network_client/add_auth_header_use_case.dart';
import 'sign_in_with_email_and_password_use_case.dart';

class SignInWithEmailAndPasswordUseCaseImpl
    implements SignInWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;
  final AddAuthHeaderUseCase _addAuthHeaderUseCase;

  SignInWithEmailAndPasswordUseCaseImpl(
    this._authRepository,
    this._addAuthHeaderUseCase,
  );

  @override
  Future<void> signIn(String email, String password) async {
    await _authRepository.signIn(email, password);
    _addAuthHeaderUseCase.addAuthHeader();
  }
}
