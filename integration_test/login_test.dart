import 'package:bloc_clean_architecture_template/firebase_options.dart';
import 'package:bloc_clean_architecture_template/presentation/login/login_screen.dart';
import 'package:bloc_clean_architecture_template/presentation/router/router.dart'
    as app_router;
import 'package:bloc_clean_architecture_template/presentation/widgets/primary_button.dart';
import 'package:bloc_clean_architecture_template/shared/auth/bloc/auth_bloc.dart';
import 'package:bloc_clean_architecture_template/shared/auth/bloc/auth_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bloc_clean_architecture_template/main.dart' as app_main;
import 'package:bloc_clean_architecture_template/data/di/service_locator.dart'
    as data_service_locator;
import 'package:bloc_clean_architecture_template/domain/di/service_locator.dart'
    as domain_service_locator;
import 'package:bloc_clean_architecture_template/presentation/di/service_locator.dart'
    as presentation_service_locator;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> createApp() async {
  await app_main.main();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final serviceLocator = GetIt.instance;

  Future<void> initDependencies() async {
    await data_service_locator.init();
    domain_service_locator.init();
    presentation_service_locator.init();
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  setUp(() async {
    await initFirebase();
    await initDependencies();
  });

  tearDown(() {
    serviceLocator.reset();
  });

  Widget createLocalizedWidget() {
    return BlocProvider<AuthBloc>(
      create: (_) => serviceLocator.get<AuthBloc>()
        ..add(InitializeAuthStateChangeStream()),
      child: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig:
            presentation_service_locator.get<app_router.Router>().getRouter(),
      ),
    );
  }

  testWidgets(
      "Given Login, "
      "When username and password are in correct form and button is clicked, "
      "Then it should open home screen", (tester) async {
    await tester.pumpWidget(createLocalizedWidget());
    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(LoginScreenConstants.emailKey), "test@gmail.com");
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(LoginScreenConstants.passwordKey), "test1234");
    await tester.pumpAndSettle();
    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Sign out"));
    await tester.pumpAndSettle();
  });
}
