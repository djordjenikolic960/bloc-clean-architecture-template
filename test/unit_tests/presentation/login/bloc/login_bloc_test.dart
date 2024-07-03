import 'package:bloc_clean_architecture_template/domain/use_case/auth/log_in_with_email_and_password_use_case.dart';
import 'package:bloc_clean_architecture_template/presentation/login/bloc/login_bloc.dart';
import 'package:bloc_clean_architecture_template/presentation/login/bloc/login_event.dart';
import 'package:bloc_clean_architecture_template/presentation/login/bloc/login_state.dart';
import 'package:bloc_clean_architecture_template/shared/constant.dart';
import 'package:bloc_clean_architecture_template/shared/exception/log_in_with_email_and_password_failure.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_bloc_test.mocks.dart';

@GenerateMocks([
  LogInWithEmailAndPasswordUseCase,
])
void main() {
  final serviceLocator = GetIt.instance;
  late MockLogInWithEmailAndPasswordUseCase
      mockSignInWithEmailAndPasswordUseCase;

  setUp(() {
    mockSignInWithEmailAndPasswordUseCase =
        MockLogInWithEmailAndPasswordUseCase();

    serviceLocator.registerFactory<LogInWithEmailAndPasswordUseCase>(
      () => mockSignInWithEmailAndPasswordUseCase,
    );
  });

  tearDown(() {
    serviceLocator.reset();
  });

  group("Given Login Bloc", () {
    const invalidEmail = "email";
    const invalidPassword = "pass";

    const validEmail = "email@gmail.com";
    const validPassword = "password";

    blocTest<LoginBloc, LoginState>(
        "When email and password are invalid"
        "Then it should emit Login State with isEmailValid and isPasswordValid set to false",
        build: () => LoginBloc(mockSignInWithEmailAndPasswordUseCase),
        act: (bloc) => bloc.add(
              LoginWithEmailAndPassword(
                invalidEmail,
                invalidPassword,
              ),
            ),
        expect: () => [
              const LoginState(
                email: invalidEmail,
                password: invalidPassword,
                isEmailValid: false,
                isPasswordValid: false,
                isFailure: false,
              ),
            ]);

    blocTest<LoginBloc, LoginState>(
        "When email and password are valid"
        "Then it should emit Login State with success param true",
        build: () {
          when(mockSignInWithEmailAndPasswordUseCase.logIn(
                  validEmail, validPassword))
              .thenAnswer((_) async => {});
          return LoginBloc(mockSignInWithEmailAndPasswordUseCase);
        },
        act: (bloc) => bloc.add(
              LoginWithEmailAndPassword(
                validEmail,
                validPassword,
              ),
            ),
        expect: () => [
              const LoginState(
                email: Constant.emptyString,
                password: Constant.emptyString,
                isSubmitting: true,
                isFailure: false,
                isSuccess: false,
              ),
              const LoginState(
                email: Constant.emptyString,
                password: Constant.emptyString,
                isSubmitting: false,
                isSuccess: true,
              ),
            ]);

    blocTest<LoginBloc, LoginState>(
        "When sign in with firebase exception occurs "
        "Then it should emit state with is failure set to true ",
        build: () {
          when(mockSignInWithEmailAndPasswordUseCase.logIn(
                  validEmail, validPassword))
              .thenThrow(const LogInWithEmailAndPasswordFailure());
          return LoginBloc(mockSignInWithEmailAndPasswordUseCase);
        },
        act: (bloc) => bloc.add(
              LoginWithEmailAndPassword(
                validEmail,
                validPassword,
              ),
            ),
        expect: () => [
              const LoginState(
                email: Constant.emptyString,
                password: Constant.emptyString,
                isSubmitting: true,
                isFailure: false,
                isSuccess: false,
              ),
              LoginState(
                email: Constant.emptyString,
                password: Constant.emptyString,
                isEmailValid: true,
                isPasswordValid: true,
                isSubmitting: false,
                isFailure: true,
                failureMessage: LogInFailureErrorCode.defaultError.name,
              ),
            ]);

    blocTest<LoginBloc, LoginState>(
        "When exception occurs "
        "Then it should emit state with is failure set to true ",
        build: () {
          when(mockSignInWithEmailAndPasswordUseCase.logIn(
                  validEmail, validPassword))
              .thenThrow(Exception());
          return LoginBloc(mockSignInWithEmailAndPasswordUseCase);
        },
        act: (bloc) => bloc.add(
              LoginWithEmailAndPassword(
                validEmail,
                validPassword,
              ),
            ),
        expect: () => [
              const LoginState(
                email: Constant.emptyString,
                password: Constant.emptyString,
                isSubmitting: true,
                isFailure: false,
                isSuccess: false,
              ),
              const LoginState(
                email: Constant.emptyString,
                password: Constant.emptyString,
                isEmailValid: true,
                isPasswordValid: true,
                isSubmitting: false,
                isFailure: true,
                failureMessage: Constant.emptyString,
              ),
            ]);

    blocTest<LoginBloc, LoginState>(
        "When UpdatePasswordVisibility event occurs "
        "Then it should emit state where showPassword has opposite value",
        build: () {
          return LoginBloc(mockSignInWithEmailAndPasswordUseCase);
        },
        act: (bloc) => bloc.add(UpdatePasswordVisibility()),
        expect: () => [
              const LoginState(
                email: Constant.emptyString,
                password: Constant.emptyString,
                showPassword: true,
              ),
            ]);
  });
}
