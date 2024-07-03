abstract interface class LogInWithEmailAndPasswordUseCase {
  Future<void> logIn(
    final String email,
    final String password,
  );
}
