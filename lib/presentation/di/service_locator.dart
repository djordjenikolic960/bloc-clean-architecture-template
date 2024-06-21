import 'package:get_it/get_it.dart';

import '../../shared/app_config/bloc/app_config_bloc.dart';
import '../../shared/auth/bloc/auth_bloc.dart';
import '../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../forgot_password/bloc/forgot_password_bloc.dart';
import '../home/bloc/news_cubit.dart';
import '../login/bloc/login_bloc.dart';
import '../router/router.dart';
import '../router/router_impl.dart';
import '../signup/bloc/signup_bloc.dart';

final serviceLocator = GetIt.instance;

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

Future<void> init() async {
  _registerBlocs();
  _registerRouter();
}

void _registerBlocs() {
  serviceLocator.registerSingleton(
    AppConfigBloc(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerSingleton(
    AuthBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<BottomNavigationBloc>(
    () => BottomNavigationBloc(),
  );

  serviceLocator.registerFactory<LoginBloc>(
    () => LoginBloc(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SignupBloc>(
    () => SignupBloc(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<ForgotPasswordBloc>(
    () => ForgotPasswordBloc(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<NewsCubit>(
    () => NewsCubit(
      serviceLocator(),
    ),
  );
}

void _registerRouter() {
  serviceLocator.registerLazySingleton<Router>(
    () => RouterImpl.defaultRouter(),
  );
}
