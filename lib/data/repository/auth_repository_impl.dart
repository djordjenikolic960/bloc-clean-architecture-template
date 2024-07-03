import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/auth_repository.dart';
import '../../shared/exception/log_in_with_email_and_password_failure.dart';
import '../../shared/exception/sign_up_with_email_and_password_failure.dart';
import '../data_source/remote/app_auth/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService<User> _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Stream<User?> get authStateChanges => _authService.authStateChanges;

  @override
  Future<User?> logIn(String email, String password) async {
    try {
      return await _authService.signInWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (e) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      return await _authService.createUserWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (e) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> signOut() => _authService.signOut();

  @override
  User? getCurrentUser() => _authService.getCurrentUser();

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _authService.sendPasswordResetEmail(email);
    } catch (e) {
      //todo throw custom exception and handle it on ui
    }
  }
}
