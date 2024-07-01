import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupWithEmailAndPassword extends SignupEvent {
  final String email;
  final String password;
  final String name;
  final String repeatedPassword;

  SignupWithEmailAndPassword(
    this.email,
    this.password,
    this.name,
    this.repeatedPassword,
  );

  @override
  List<Object?> get props => [
        email,
        password,
        name,
        repeatedPassword,
      ];
}

class UpdatePasswordVisibility extends SignupEvent {}

class UpdateRepeatedPasswordVisibility extends SignupEvent {}
