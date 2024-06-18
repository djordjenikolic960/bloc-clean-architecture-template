import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/auth/send_password_reset_email_use_case.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;

  ForgotPasswordBloc(
    this._sendPasswordResetEmailUseCase,
  ) : super(ForgotPasswordInitial()) {
    on<SendPasswordResetEmail>(_emitSendPasswordResetEmail);
  }

  FutureOr<void> _emitSendPasswordResetEmail(
    SendPasswordResetEmail event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    //todo should add validation for email before sending email
    emit(EmailSendLoading());
    try {
      await _sendPasswordResetEmailUseCase.send(event.email);
      emit(EmailSendSuccess());
    } catch (e) {
      emit(EmailSendFailure());
    }
  }
}
