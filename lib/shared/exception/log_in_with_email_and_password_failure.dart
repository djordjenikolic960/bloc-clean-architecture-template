class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.errorCode = LogInFailureErrorCode.defaultError,
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          LogInFailureErrorCode.invalidEmail,
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          LogInFailureErrorCode.userDisabled,
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          LogInFailureErrorCode.userNotFound,
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          LogInFailureErrorCode.wrongPassword,
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  final LogInFailureErrorCode errorCode;
}

enum LogInFailureErrorCode {
  wrongPassword,
  userNotFound,
  invalidEmail,
  userDisabled,
  defaultError,
}
