import 'package:firebase_auth/firebase_auth.dart';

// todo create generic auth service that will have all this methods, then you can have different auth service implementation, and when auth service provider need to be changed then it will just implement other one
// todo user is from firebase auth class, should be some generic app user and there should be some mappers between them
class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
