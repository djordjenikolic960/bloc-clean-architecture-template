import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/auth/sign_in_with_email_and_password_use_case.dart';
import '../../../shared/constant.dart';
import '../../../shared/exception/sign_in_with_email_and_password_failure.dart';
import '../../../shared/helpers/validation_helper.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;

  LoginBloc(
    this._signInWithEmailAndPasswordUseCase,
  ) : super(LoginState.empty()) {
    on<LoginWithEmailAndPassword>(_emitLoginWithEmailAndPassword);
    on<UpdatePasswordVisibility>(_emitUpdatePasswordVisibility);
  }

  FutureOr<void> _emitLoginWithEmailAndPassword(
    LoginWithEmailAndPassword event,
    Emitter<LoginState> emit,
  ) async {
    final isEmailValid = ValidationHelper.isEmailValid(event.email);
    final isPasswordValid = ValidationHelper.isPasswordValid(event.password);

    if (!isEmailValid || !isPasswordValid) {
      emit(
        state.copyWith(
          email: event.email,
          password: event.password,
          isEmailValid: isEmailValid,
          isPasswordValid: isPasswordValid,
          isFailure: false,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isSubmitting: true,
        isFailure: false,
        isSuccess: false,
      ),
    );

    try {
      await _signInWithEmailAndPasswordUseCase.signIn(
        event.email,
        event.password,
      );
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: true,
        ),
      );
    } on SignInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          isEmailValid: true,
          isPasswordValid: true,
          isSubmitting: false,
          isFailure: true,
          failureMessage: e.errorCode.name,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isEmailValid: true,
          isPasswordValid: true,
          isSubmitting: false,
          isFailure: true,
          failureMessage: Constant.emptyString,
        ),
      );
    }
  }

  FutureOr<void> _emitUpdatePasswordVisibility(
    UpdatePasswordVisibility event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }
}
