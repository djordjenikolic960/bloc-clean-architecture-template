import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<User?> get authStateChanges;

  Future<User?> logIn(String email, String password);

  Future<User?> signUp(String email, String password);

  Future<void> signOut();

  Future<void> sendPasswordResetEmail(String email);

  User? getCurrentUser();
}
