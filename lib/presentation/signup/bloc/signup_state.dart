import '../../../shared/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SignupState extends Equatable {
  final String email;
  final String password;
  final String name;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isNameValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool showPassword;
  final String? failureMessage;

  const SignupState({
    required this.email,
    required this.password,
    required this.name,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isNameValid = true,
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
        name,
        isEmailValid,
        isPasswordValid,
        isNameValid,
        isSubmitting,
        isSuccess,
        isFailure,
        showPassword,
        failureMessage,
      ];

  factory SignupState.empty() {
    return const SignupState(
      email: Constant.emptyString,
      password: Constant.emptyString,
      name: Constant.emptyString,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    String? name,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isNameValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    bool? showPassword,
    String? failureMessage,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isNameValid: isNameValid ?? this.isNameValid,
      isSubmitting: isSubmitting ?? false,
      isSuccess: isSuccess ?? false,
      isFailure: isFailure ?? false,
      showPassword: showPassword ?? this.showPassword,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }
}
