import 'package:equatable/equatable.dart';

import '../../../domain/entity/user_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  Authenticated();
}

class Unauthenticated extends AuthState {}

class UserLoaded extends AuthState {
  final UserEntity user;

  UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}
