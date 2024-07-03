import 'package:bloc_clean_architecture_template/domain/repository/auth_repository.dart';
import 'package:bloc_clean_architecture_template/domain/use_case/auth/log_in_with_email_and_password_use_case_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'log_in_with_email_and_password_use_case_test.mocks.dart';

@GenerateMocks([
  AuthRepository,
])
void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  test(
      "Given SignInWithEmailAndPasswordUseCase, "
      "When sign in from auth repository is called, "
      "Then it should verify that it is called. ", () async {
    // Arrange
    const email = "email";
    const password = "password";
    when(mockAuthRepository.logIn(any, any)).thenAnswer((_) async => null);

    // Act
    final signInWithEmailAndPasswordUseCaseImpl =
        LogInWithEmailAndPasswordUseCaseImpl(mockAuthRepository);
    await signInWithEmailAndPasswordUseCaseImpl.logIn(email, password);

    // Assert
    verify(mockAuthRepository.logIn(email, password)).called(1);
  });
}
