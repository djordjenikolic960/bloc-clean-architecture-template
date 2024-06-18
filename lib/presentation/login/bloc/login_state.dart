import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../shared/constant.dart';

@immutable
class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool showPassword;
  final String? failureMessage;

  const LoginState({
    required this.email,
    required this.password,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.showPassword = false,
    this.failureMessage,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        isEmailValid,
        isPasswordValid,
        isSubmitting,
        isSuccess,
        isFailure,
        showPassword,
        failureMessage,
      ];

  factory LoginState.empty() {
    return const LoginState(
      email: Constant.emptyString,
      password: Constant.emptyString,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    bool? showPassword,
    String? failureMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? false,
      isSuccess: isSuccess ?? false,
      isFailure: isFailure ?? false,
      showPassword: showPassword ?? this.showPassword,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }
}
