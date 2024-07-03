import 'shared/auth/bloc/auth_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/di/service_locator.dart' as data_service_locator;
import 'domain/di/service_locator.dart' as domain_service_locator;
import 'firebase_options.dart';
import 'presentation/di/service_locator.dart' as presentation_service_locator;
import 'presentation/router/router.dart' as app_router;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'presentation/theme/themes.dart';
import 'shared/app_config/bloc/app_config_bloc.dart';
import 'shared/app_config/bloc/app_config_event.dart';
import 'shared/app_config/bloc/app_config_state.dart';
import 'shared/auth/bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  await _initFirebase();
  await _initDependencies();
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> _initDependencies() async {
  await data_service_locator.init();
  domain_service_locator.init();
  presentation_service_locator.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => presentation_service_locator.get<AuthBloc>()
        ..add(InitializeAuthStateChangeStream()),
      child: BlocProvider<AppConfigBloc>(
        create: (_) => presentation_service_locator.get<AppConfigBloc>()
          ..add(InitializeAppConfig()),
        child: BlocBuilder<AppConfigBloc, AppConfigState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: 'Flutter Demo',
              theme: state.appConfig.theme == CustomTheme.light
                  ? lightTheme
                  : darkTheme,
              routerConfig: presentation_service_locator
                  .get<app_router.Router>()
                  .getRouter(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state.appConfig.locale,
            );
          },
        ),
      ),
    );
  }
}
