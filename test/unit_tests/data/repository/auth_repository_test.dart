import 'package:bloc_clean_architecture_template/data/data_source/remote/app_auth/auth_service.dart';
import 'package:bloc_clean_architecture_template/data/repository/auth_repository_impl.dart';
import 'package:bloc_clean_architecture_template/domain/repository/auth_repository.dart';
import 'package:bloc_clean_architecture_template/shared/exception/log_in_with_email_and_password_failure.dart';
import 'package:bloc_clean_architecture_template/shared/exception/sign_up_with_email_and_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([
  AuthService,
])
void main() {
  late MockAuthService<User> mockAuthService;
  late AuthRepository authRepository;

  setUp(() {
    mockAuthService = MockAuthService();
    authRepository = AuthRepositoryImpl(mockAuthService);
  });

  group("Given Auth Repository", () {
    group("Log in", () {
      test(
          "When log in is called "
          "Then it auth service should call function once", () async {
        // Arrange
        const email = "email";
        const password = "password";
        when(mockAuthService.signInWithEmailAndPassword(any, any))
            .thenAnswer((_) async => null);

        // Act
        await authRepository.logIn(email, password);

        // Assert
        verify(mockAuthService.signInWithEmailAndPassword(email, password))
            .called(1);
      });

      test(
          "When FirebaseAuthException occurs while sign in "
          "Then it should throw SignInWithEmailAndPasswordFailure", () async {
        // Arrange
        const email = "email";
        const password = "password";
        when(mockAuthService.signInWithEmailAndPassword(email, password))
            .thenThrow(FirebaseAuthException);

        // Act && Assert
        expect(
          () async => await authRepository.logIn(email, password),
          throwsA(isA<LogInWithEmailAndPasswordFailure>()),
        );
      });

      test(
          "When Exception occurs while sign in "
          "Then it should throw SignInWithEmailAndPasswordFailure", () async {
        // Arrange
        const email = "email";
        const password = "password";
        when(mockAuthService.signInWithEmailAndPassword(email, password))
            .thenThrow(Exception);

        // Act && Assert
        expect(
          () async => await authRepository.logIn(email, password),
          throwsA(isA<LogInWithEmailAndPasswordFailure>()),
        );
      });
    });
    group("Sign up", () {
      test(
          "When sign up is called "
          "Then it auth service should call function once", () async {
        // Arrange
        const email = "email";
        const password = "password";
        when(mockAuthService.createUserWithEmailAndPassword(any, any))
            .thenAnswer((_) async => null);

        // Act
        await authRepository.signUp(email, password);

        // Assert
        verify(mockAuthService.createUserWithEmailAndPassword(email, password))
            .called(1);
      });

      test(
          "When FirebaseAuthException occurs while sign up "
          "Then it should throw SignInWithEmailAndPasswordFailure", () async {
        // Arrange
        const email = "email";
        const password = "password";
        when(mockAuthService.createUserWithEmailAndPassword(email, password))
            .thenThrow(FirebaseAuthException);

        // Act && Assert
        expect(
          () async => await authRepository.signUp(email, password),
          throwsA(isA<SignUpWithEmailAndPasswordFailure>()),
        );
      });

      test(
          "When Exception occurs while sign up "
          "Then it should throw SignInWithEmailAndPasswordFailure", () async {
        // Arrange
        const email = "email";
        const password = "password";
        when(mockAuthService.createUserWithEmailAndPassword(email, password))
            .thenThrow(Exception);

        // Act && Assert
        expect(
          () async => await authRepository.signUp(email, password),
          throwsA(isA<SignUpWithEmailAndPasswordFailure>()),
        );
      });
    });
    test(
        "When sign out is called "
        "Then verify that is called once in auth service", () async {
      // Act
      await authRepository.signOut();

      // Assert
      verify(mockAuthService.signOut()).called(1);
    });
    group("Send password reset email", () {
      test(
          "When send password is called "
          "Then verify that is called once in auth service ", () async {
        // Arrange
        when(mockAuthService.sendPasswordResetEmail(any))
            .thenAnswer((_) async => {});

        // Act
        await authRepository.sendPasswordResetEmail("email");

        // Assert
        verify(mockAuthService.sendPasswordResetEmail(any)).called(1);
      });
    });
    test(
        "When get current user is called "
        "Then verify that is called once in auth service", () async {
      // Arrange
      when(mockAuthService.getCurrentUser()).thenAnswer((_) => null);

      // Act
      authRepository.getCurrentUser();

      // Assert
      verify(mockAuthService.getCurrentUser()).called(1);
    });
  });
}
