class SignInWithEmailAndPasswordFailure implements Exception {
  const SignInWithEmailAndPasswordFailure([
    this.errorCode = SignInFailureErrorCode.defaultError,
  ]);

  factory SignInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignInWithEmailAndPasswordFailure(
          SignInFailureErrorCode.invalidEmail,
        );
      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure(
          SignInFailureErrorCode.userDisabled,
        );
      case 'user-not-found':
        return const SignInWithEmailAndPasswordFailure(
          SignInFailureErrorCode.userNotFound,
        );
      case 'wrong-password':
        return const SignInWithEmailAndPasswordFailure(
          SignInFailureErrorCode.wrongPassword,
        );
      default:
        return const SignInWithEmailAndPasswordFailure();
    }
  }

  final SignInFailureErrorCode errorCode;
}

enum SignInFailureErrorCode {
  wrongPassword,
  userNotFound,
  invalidEmail,
  userDisabled,
  defaultError,
}
