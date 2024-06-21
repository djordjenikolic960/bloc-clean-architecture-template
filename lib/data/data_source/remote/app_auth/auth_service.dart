abstract class AuthService<T> {
  Future<T?> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<T?> createUserWithEmailAndPassword(
    String email,
    String password,
  );

  Future<void> signOut();

  T? getCurrentUser();

  Stream<T?> get authStateChanges;

  Future<void> sendPasswordResetEmail(String email);
}
