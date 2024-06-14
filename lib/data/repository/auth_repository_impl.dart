import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/auth_repository.dart';
import '../service/firebase_auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Stream<User?> get authStateChanges => _authService.authStateChanges;

  @override
  Future<User?> signIn(String email, String password) =>
      _authService.signInWithEmailAndPassword(email, password);

  @override
  Future<User?> signUp(String email, String password) =>
      _authService.createUserWithEmailAndPassword(email, password);

  @override
  Future<void> signOut() => _authService.signOut();

  @override
  User? getCurrentUser() => _authService.getCurrentUser();
}
