import '../../../shared/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SignupState extends Equatable {
  final String email;
  final String password;
  final String name;
  final String repeatedPassword;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isNameValid;
  final bool isRepeatedPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool showPassword;
  final bool showRepeatedPassword;
  final String? failureMessage;

  const SignupState({
    required this.email,
    required this.password,
    required this.name,
    required this.repeatedPassword,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isNameValid = true,
    this.isRepeatedPasswordValid = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.showPassword = false,
    this.showRepeatedPassword = false,
    this.failureMessage,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        name,
        repeatedPassword,
        isEmailValid,
        isPasswordValid,
        isNameValid,
        isRepeatedPasswordValid,
        isSubmitting,
        isSuccess,
        isFailure,
        showPassword,
        showRepeatedPassword,
        failureMessage,
      ];

  factory SignupState.empty() {
    return const SignupState(
      email: Constant.emptyString,
      password: Constant.emptyString,
      name: Constant.emptyString,
      repeatedPassword: Constant.emptyString,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    String? name,
    String? repeatedPassword,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isNameValid,
    bool? isRepeatedPasswordValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    bool? showPassword,
    bool? showRepeatedPassword,
    String? failureMessage,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      repeatedPassword: repeatedPassword ?? this.repeatedPassword,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isNameValid: isNameValid ?? this.isNameValid,
      isRepeatedPasswordValid:
          isRepeatedPasswordValid ?? this.isRepeatedPasswordValid,
      isSubmitting: isSubmitting ?? false,
      isSuccess: isSuccess ?? false,
      isFailure: isFailure ?? false,
      showPassword: showPassword ?? this.showPassword,
      showRepeatedPassword: showRepeatedPassword ?? this.showRepeatedPassword,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }
}
