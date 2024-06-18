import 'package:equatable/equatable.dart';

abstract class ForgotPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class EmailSendLoading extends ForgotPasswordState {}

class EmailSendSuccess extends ForgotPasswordState {}

class EmailSendFailure extends ForgotPasswordState {}
