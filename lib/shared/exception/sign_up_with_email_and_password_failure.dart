class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.errorCode = SignupFailureErrorCode.defaultError,
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          SignupFailureErrorCode.invalidEmail,
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          SignupFailureErrorCode.userDisabled,
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          SignupFailureErrorCode.emailAlreadyInUse,
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          SignupFailureErrorCode.operationNotAllowed,
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          SignupFailureErrorCode.weakPassword,
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  final SignupFailureErrorCode errorCode;
}

enum SignupFailureErrorCode {
  invalidEmail,
  userDisabled,
  emailAlreadyInUse,
  operationNotAllowed,
  weakPassword,
  defaultError,
}
