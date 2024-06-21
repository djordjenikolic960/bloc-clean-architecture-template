import '../../entity/user_entity.dart';
import '../../repository/auth_repository.dart';
import '../network_client/add_auth_header_use_case.dart';
import '../user/save_user_use_case.dart';
import 'sign_up_with_email_and_password_use_case.dart';

class SignUpWithEmailAndPasswordUseCaseImpl
    implements SignUpWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;
  final SaveUserUseCase _saveUserUseCase;
  final AddAuthHeaderUseCase _addAuthHeaderUseCase;

  SignUpWithEmailAndPasswordUseCaseImpl(
    this._authRepository,
    this._saveUserUseCase,
    this._addAuthHeaderUseCase,
  );

  @override
  Future<void> signUp(
    String email,
    String password,
    String name,
  ) async {
    final user = await _authRepository.signUp(
      email,
      password,
    );
    if (user != null) {
      final userEntity = UserEntity(
        id: user.uid,
        name: name,
        email: user.email,
      );
      await _saveUserUseCase.save(userEntity);
      _addAuthHeaderUseCase.addAuthHeader();
    }
  }
}
