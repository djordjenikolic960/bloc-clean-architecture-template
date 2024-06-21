import 'dart:async';

import '../../../domain/use_case/auth/sign_up_with_email_and_password_use_case.dart';
import '../../../shared/exception/sign_up_with_email_and_password_failure.dart';
import 'signup_event.dart';
import 'signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/constant.dart';
import '../../../shared/helpers/validation_helper.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;

  SignupBloc(
    this._signUpWithEmailAndPasswordUseCase,
  ) : super(SignupState.empty()) {
    on<SignupWithEmailAndPassword>(_emitSignupWithEmailAndPassword);
    on<UpdatePasswordVisibility>(_emitUpdatePasswordVisibility);
    on<UpdateRepeatedPasswordVisibility>(_emitUpdateRepeatedPasswordVisibility);
  }

  FutureOr<void> _emitSignupWithEmailAndPassword(
    SignupWithEmailAndPassword event,
    Emitter<SignupState> emit,
  ) async {
    final isEmailValid = ValidationHelper.isEmailValid(event.email);
    final isPasswordValid = ValidationHelper.isPasswordValid(event.password);
    final isNameValid = event.name.isNotEmpty;
    final isRepeatedPasswordValid = event.repeatedPassword == event.password;

    if (!isEmailValid ||
        !isPasswordValid ||
        !isNameValid ||
        !isRepeatedPasswordValid) {
      emit(
        state.copyWith(
          email: event.email,
          password: event.password,
          name: event.name,
          repeatedPassword: event.repeatedPassword,
          isEmailValid: isEmailValid,
          isPasswordValid: isPasswordValid,
          isNameValid: isNameValid,
          isRepeatedPasswordValid: isRepeatedPasswordValid,
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
      await _signUpWithEmailAndPasswordUseCase.signUp(
        event.email,
        event.password,
        event.name,
      );
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: true,
        ),
      );
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          isEmailValid: true,
          isPasswordValid: true,
          isNameValid: true,
          isRepeatedPasswordValid: true,
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
          isNameValid: true,
          isRepeatedPasswordValid: true,
          isSubmitting: false,
          isFailure: true,
          failureMessage: Constant.emptyString,
        ),
      );
    }
  }

  FutureOr<void> _emitUpdatePasswordVisibility(
    UpdatePasswordVisibility event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  FutureOr<void> _emitUpdateRepeatedPasswordVisibility(
    UpdateRepeatedPasswordVisibility event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(showRepeatedPassword: !state.showRepeatedPassword));
  }
}
