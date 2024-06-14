abstract interface class SignInWithEmailAndPasswordUseCase {
  Future<void> signIn(
    final String email,
    final String password,
  );
}
