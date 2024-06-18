import '../constant.dart';

class ValidationHelper {
  static bool isEmailValid(String email) {
    var match = RegExp(
      Constant.emailPattern,
      caseSensitive: false,
    ).firstMatch(email);
    return match != null;
  }

  static bool isPasswordValid(String password) {
    return password.length >= Constant.passwordMinLength;
  }
}
