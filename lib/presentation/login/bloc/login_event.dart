import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginWithEmailAndPassword extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmailAndPassword(this.email, this.password);

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class UpdatePasswordVisibility extends LoginEvent {}
