import 'package:bloc_clean_architecture_template/domain/use_case/auth/log_in_with_email_and_password_use_case.dart';
import 'package:bloc_clean_architecture_template/presentation/login/bloc/login_bloc.dart';
import 'package:bloc_clean_architecture_template/presentation/login/bloc/login_event.dart';
import 'package:bloc_clean_architecture_template/presentation/login/bloc/login_state.dart';
import 'package:bloc_clean_architecture_template/presentation/login/login_screen.dart';
import 'package:bloc_clean_architecture_template/presentation/widgets/primary_button.dart';
import 'package:bloc_clean_architecture_template/presentation/widgets/text_input_field.dart';
import 'package:bloc_clean_architecture_template/shared/constant.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'login_test.mocks.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

@GenerateMocks([
  LogInWithEmailAndPasswordUseCase,
])
void main() {
  group("Given Login Screen", () {
    late MockLoginBloc mockLoginBloc;
    late MockLogInWithEmailAndPasswordUseCase
        mockSignInWithEmailAndPasswordUseCase;
    final serviceLocator = GetIt.instance;

    setUp(() {
      mockLoginBloc = MockLoginBloc();
      mockSignInWithEmailAndPasswordUseCase =
          MockLogInWithEmailAndPasswordUseCase();

      serviceLocator.registerFactory<LoginBloc>(
        () => mockLoginBloc,
      );
      serviceLocator.registerFactory<LogInWithEmailAndPasswordUseCase>(
        () => mockSignInWithEmailAndPasswordUseCase,
      );
    });

    tearDown(() {
      serviceLocator.reset();
    });

    Widget createLocalizedWidget(Widget child) {
      return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: child,
      );
    }

    testWidgets(
        "When LoginScreen is loaded "
        "Then is should be rendered", (tester) async {
      // Arrange
      whenListen<LoginState>(
        mockLoginBloc,
        Stream.fromIterable([]),
        initialState: LoginState.empty(),
      );

      // Act
      await tester.pumpWidget(
        createLocalizedWidget(
          BlocProvider<LoginBloc>(
            create: (_) => mockLoginBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      // Assert
      expect(find.byType(TextInputField), findsNWidgets(2));
      expect(find.byType(PrimaryButton), findsOneWidget);
      expect(find.text("Welcome"), findsOneWidget);
      expect(find.text("Login"), findsOneWidget);
      expect(find.text("Email"), findsOneWidget);
      expect(find.text("Password"), findsOneWidget);
      expect(find.text("Forgot your password?"), findsOneWidget);
      expect(find.text("Don't have an account? Sign up"), findsOneWidget);
    });

    testWidgets(
        "When email is not it correct format "
        "Then error message should be rendered on screen", (tester) async {
      // Arrange
      const wrongEmailFormat = "wrongEmailFormat";
      whenListen<LoginState>(
        mockLoginBloc,
        Stream.fromIterable([
          const LoginState(
            email: wrongEmailFormat,
            password: Constant.emptyString,
            isEmailValid: false,
          ),
        ]),
        initialState: const LoginState(
          email: wrongEmailFormat,
          password: Constant.emptyString,
        ),
      );

      // Act
      await tester.pumpWidget(
        createLocalizedWidget(
          BlocProvider<LoginBloc>(
            create: (_) => mockLoginBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      await tester.tap(find.byType(PrimaryButton));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text("Invalid email format"), findsOneWidget);
    });

    testWidgets(
        "When password is shorter then 6 characters "
        "Then error message should be rendered on screen", (tester) async {
      // Arrange
      const shortPassword = "short";
      whenListen<LoginState>(
        mockLoginBloc,
        Stream.fromIterable([
          const LoginState(
            email: Constant.emptyString,
            password: shortPassword,
            isPasswordValid: false,
          ),
        ]),
        initialState: const LoginState(
          email: Constant.emptyString,
          password: shortPassword,
        ),
      );

      // Act
      await tester.pumpWidget(
        createLocalizedWidget(
          BlocProvider<LoginBloc>(
            create: (_) => mockLoginBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      await tester.tap(find.byType(PrimaryButton));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text("Password should be at least 6 characters long"),
          findsOneWidget);
    });

    testWidgets(
        "When both email and password have wrong form"
        "Then error message for both should be rendered on screen",
        (tester) async {
      // Arrange
      const wrongEmailFormat = "wrongEmailFormat";
      const shortPassword = "short";

      whenListen<LoginState>(
        mockLoginBloc,
        Stream.fromIterable([
          const LoginState(
            email: wrongEmailFormat,
            password: shortPassword,
            isEmailValid: false,
            isPasswordValid: false,
          ),
        ]),
        initialState: const LoginState(
          email: wrongEmailFormat,
          password: shortPassword,
        ),
      );

      // Act
      await tester.pumpWidget(
        createLocalizedWidget(
          BlocProvider<LoginBloc>(
            create: (_) => mockLoginBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      await tester.tap(find.byType(PrimaryButton));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text("Invalid email format"), findsOneWidget);
      expect(find.text("Password should be at least 6 characters long"),
          findsOneWidget);
    });

    testWidgets(
        "When both email and password have wrong form"
        "Then error message for both should be rendered on screen",
        (tester) async {
      // Arrange
      const wrongEmailFormat = "wrongEmailFormat";
      const shortPassword = "short";
      const errorMessage = "Something went wrong";
      whenListen<LoginState>(
        mockLoginBloc,
        Stream.fromIterable([
          const LoginState(
            email: wrongEmailFormat,
            password: shortPassword,
            isEmailValid: false,
            isPasswordValid: false,
            isFailure: true,
            failureMessage: errorMessage,
          ),
        ]),
        initialState: const LoginState(
          email: wrongEmailFormat,
          password: shortPassword,
        ),
      );

      // Act
      await tester.pumpWidget(
        createLocalizedWidget(
          BlocProvider<LoginBloc>(
            create: (_) => mockLoginBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      await tester.tap(find.byType(PrimaryButton));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text("Invalid email format"), findsOneWidget);
      expect(find.text("Password should be at least 6 characters long"),
          findsOneWidget);
      expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets(
        "When password visibility icon is clicked"
        "Then other icon should be rendered on screen", (tester) async {
      // Arrange
      whenListen<LoginState>(
        mockLoginBloc,
        Stream.fromIterable([
          const LoginState(
            email: Constant.emptyString,
            password: Constant.emptyString,
            showPassword: true,
          ),
        ]),
        initialState: const LoginState(
          email: Constant.emptyString,
          password: Constant.emptyString,
        ),
      );

      // Act
      await tester.pumpWidget(
        createLocalizedWidget(
          BlocProvider<LoginBloc>(
            create: (_) => mockLoginBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });
  });
}
