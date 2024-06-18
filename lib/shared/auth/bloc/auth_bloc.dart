import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../domain/use_case/auth/get_auth_state_change_use_case.dart';
import '../../../domain/use_case/auth/sign_out_use_case.dart';
import '../../../domain/use_case/user/get_user_as_stream_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetAuthStateChangeUseCase _getAuthStateChangeUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetUserAsStreamUseCase _getUserAsStreamUseCase;

  StreamSubscription<User?>? _authStateChangeSubscription;
  StreamSubscription<UserEntity?>? _userSubscription;

  AuthBloc(
    this._getAuthStateChangeUseCase,
    this._signOutUseCase,
    this._getUserAsStreamUseCase,
  ) : super(AuthInitial()) {
    on<InitializeAuthStateChangeStream>(_emitInitializeAuthStateChangeStream);
    on<AuthStateChanged>(_emitAuthStateChanged);
    on<InitializeUserStream>(_emitInitializeUserStream);
    on<LoadUser>(_emitLoadUser);
    on<SignOut>(_signOut);
  }

  FutureOr<void> _emitInitializeAuthStateChangeStream(
    InitializeAuthStateChangeStream event,
    Emitter<AuthState> emit,
  ) {
    _authStateChangeSubscription =
        _getAuthStateChangeUseCase.get().listen((user) {
      add(AuthStateChanged(user));
    });
  }

  @override
  Future<void> close() {
    _authStateChangeSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _emitAuthStateChanged(
    AuthStateChanged event,
    Emitter<AuthState> emit,
  ) {
    if (event.user != null) {
      emit(Authenticated());
      _userSubscription?.cancel();
      _userSubscription =
          _getUserAsStreamUseCase.get(event.user!.uid).listen((user) {
        if (user != null) {
          add(LoadUser(user));
        }
      });
    } else {
      emit(Unauthenticated());
    }
  }

  FutureOr<void> _emitInitializeUserStream(
    InitializeUserStream event,
    Emitter<AuthState> emit,
  ) {}

  FutureOr<void> _signOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _signOutUseCase.signOut();
    } catch (e) {
      //todo emit some error state
      print("error");
    }
  }

  FutureOr<void> _emitLoadUser(
    LoadUser event,
    Emitter<AuthState> emit,
  ) {
    emit(UserLoaded(event.user));
  }
}
