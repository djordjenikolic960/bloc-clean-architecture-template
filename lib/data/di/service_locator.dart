import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repository/app_config_repository.dart';
import '../../domain/repository/auth_repository.dart';
import '../repository/app_config_repository_impl.dart';
import '../repository/auth_repository_impl.dart';
import '../service/firebase_auth_service.dart';
import '../service/shared_preferences_service.dart';
import '../service/shared_preferences_service_impl.dart';

final serviceLocator = GetIt.instance;

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

Future<void> init() async {
  _registerExternalServices();
  _registerServices();
  //_registerNetworkClient();
  //_registerLocalStorage();
  //_registerConverters();
  //_registerHelpers();
  //_registerManagers();
  _registerRepositories();
}

void _registerExternalServices() {
  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}

void _registerServices() {
  serviceLocator.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesServiceImpl(),
  );

  serviceLocator.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(
      serviceLocator(),
    ),
  );
}

void _registerRepositories() {
  serviceLocator.registerLazySingleton<AppConfigRepository>(
    () => AppConfigRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );
}
