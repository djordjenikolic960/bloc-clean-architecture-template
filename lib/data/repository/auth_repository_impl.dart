import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/auth_repository.dart';
import '../../shared/exception/sign_in_with_email_and_password_failure.dart';
import '../../shared/exception/sign_up_with_email_and_password_failure.dart';
import '../service/firebase_auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Stream<User?> get authStateChanges => _authService.authStateChanges;

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      return await _authService.signInWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      throw SignInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (e) {
      throw const SignInWithEmailAndPasswordFailure();
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
      print(e);
    }
  }
}
