import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupWithEmailAndPassword extends SignupEvent {
  final String email;
  final String password;
  final String name;

  SignupWithEmailAndPassword(
    this.email,
    this.password,
    this.name,
  );

  @override
  List<Object?> get props => [
        email,
        password,
        name,
      ];
}

class UpdatePasswordVisibility extends SignupEvent {}
