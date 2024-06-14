import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/auth/get_user_stream_use_case.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserStreamUseCase _getUserStreamUseCase;
  StreamSubscription<User?>? _userSubscription;

  UserBloc(
    this._getUserStreamUseCase,
  ) : super(UserInitial()) {
    on<InitializeUserStream>(_emitInitializeUserStream);
  }

  FutureOr<void> _emitInitializeUserStream(
    InitializeUserStream event,
    Emitter<UserState> emit,
  ) {
    _userSubscription = _getUserStreamUseCase.get().listen((user) {
      //todo user can be null, this listenes to users auth changes, test it
    });
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
