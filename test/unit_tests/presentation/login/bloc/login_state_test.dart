import 'package:bloc_clean_architecture_template/presentation/login/bloc/login_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Given Login State", () {
    test(
        "When Login State instances with the same values exist "
        "Then they should be equal", () {
      // Arrange
      const email = "email";
      const password = "password";
      const loginState1 = LoginState(
        email: email,
        password: password,
      );
      const loginState2 = LoginState(
        email: email,
        password: password,
      );

      // Act && Assert
      expect(loginState1, equals(loginState2));
    });

    test(
        "When Login State instances with different values exist "
        "Then they should not be equal", () {
      // Arrange
      const email1 = "email";
      const password1 = "password";
      const email2 = "email2";
      const password2 = "password2";
      const loginState1 = LoginState(
        email: email1,
        password: password1,
      );
      const loginState2 = LoginState(
        email: email2,
        password: password2,
      );

      // Act && Assert
      expect(loginState1, isNot(loginState2));
    });

    test(
        "When Login State copy with different param is called "
        "Then copy should have only that param changed", () {
      // Arrange
      const email1 = "email";
      const password1 = "password";
      const email2 = "email2";
      const loginState1 = LoginState(
        email: email1,
        password: password1,
      );
      final loginState2 = loginState1.copyWith(email: email2);

      // Act && Assert
      expect(loginState1.password, equals(loginState2.password));
      expect(loginState1.email, isNot(equals(loginState2.email)));
    });

    test(
        "When Login State copy with no params is called "
        "Then copy should be the same as original", () {
      // Arrange
      const email1 = "email";
      const password1 = "password";
      const loginState1 = LoginState(
        email: email1,
        password: password1,
      );
      final loginState2 = loginState1.copyWith();

      // Act && Assert
      expect(loginState1, equals(loginState2));
    });
  });
}
