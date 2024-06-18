import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repository/app_config_repository.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/remote/user_remote_data_source.dart';
import '../data_source/remote/user_remote_data_source_impl.dart';
import '../repository/app_config_repository_impl.dart';
import '../repository/auth_repository_impl.dart';
import '../repository/user_repository_impl.dart';
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
  _registerRepositories();
}

void _registerExternalServices() {
  serviceLocator.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  serviceLocator.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
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

  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
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

  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      serviceLocator(),
    ),
  );
}
