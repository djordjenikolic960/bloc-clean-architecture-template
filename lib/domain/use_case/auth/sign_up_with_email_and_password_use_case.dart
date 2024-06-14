abstract interface class SignUpWithEmailAndPasswordUseCase {
  Future<void> signUp(
    final String email,
    final String password,
  );
}
