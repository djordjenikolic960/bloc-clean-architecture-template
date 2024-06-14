import 'package:get_it/get_it.dart';

import '../../shared/app_config/bloc/app_config_bloc.dart';
import '../bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../router/router.dart';
import '../router/router_impl.dart';

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

  serviceLocator.registerFactory<BottomNavigationBloc>(
    () => BottomNavigationBloc(),
  );
}

void _registerRouter() {
  serviceLocator.registerLazySingleton<Router>(
    () => RouterImpl.defaultRouter(),
  );
}
