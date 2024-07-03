import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

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

class UpdatePasswordVisibility extends LoginEvent {
  @override
  List<Object?> get props => [];
}
