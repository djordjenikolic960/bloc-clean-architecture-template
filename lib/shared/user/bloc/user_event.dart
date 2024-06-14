import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignOut extends UserEvent {}

class InitializeUserStream extends UserEvent {}
