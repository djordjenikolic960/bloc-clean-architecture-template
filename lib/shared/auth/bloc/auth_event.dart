import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entity/user_entity.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignOut extends AuthEvent {}

class InitializeAuthStateChangeStream extends AuthEvent {}

class AuthStateChanged extends AuthEvent {
  final User? user;

  AuthStateChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class InitializeUserStream extends AuthEvent {}

class LoadUser extends AuthEvent {
  final UserEntity user;

  LoadUser(this.user);

  @override
  List<Object?> get props => [user];
}
