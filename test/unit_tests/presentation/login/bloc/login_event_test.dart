import 'package:bloc_clean_architecture_template/presentation/login/bloc/login_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Given Login Event", () {
    test(
        "When LoginWithEmailAndPassword instances with the same values exist "
        "Then they should be equal", () {
      // Arrange
      const email = "email";
      const password = "password";
      final loginWithEmailAndPassword1 =
          LoginWithEmailAndPassword(email, password);
      final loginWithEmailAndPassword2 =
          LoginWithEmailAndPassword(email, password);

      // Act && Assert
      expect(loginWithEmailAndPassword1, equals(loginWithEmailAndPassword2));
    });

    test(
        "When LoginWithEmailAndPassword instances with different values exist "
        "Then they should not be equal", () {
      // Arrange
      const email1 = "email1";
      const password1 = "password1";
      const email2 = "email2";
      const password2 = "password2";
      final loginWithEmailAndPassword1 =
          LoginWithEmailAndPassword(email1, password1);
      final loginWithEmailAndPassword2 =
          LoginWithEmailAndPassword(email2, password2);

      // Act && Assert
      expect(loginWithEmailAndPassword1, isNot(loginWithEmailAndPassword2));
    });

    test(
        "When UpdatePasswordVisibility instances with the same values exist "
        "Then they should be equal", () {
      // Arrange
      final updatePasswordVisibility1 = UpdatePasswordVisibility();
      final updatePasswordVisibility2 = UpdatePasswordVisibility();

      // Act && Assert
      expect(updatePasswordVisibility1, equals(updatePasswordVisibility2));
    });
  });
}
