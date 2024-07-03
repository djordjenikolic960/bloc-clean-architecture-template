import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/repository/app_config_repository.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/repository/network_client_repository.dart';
import '../../domain/repository/news_repository.dart';
import '../../domain/repository/user_repository.dart';
import '../converters/article_converter.dart';
import '../converters/source_converter.dart';
import '../data_source/local/database/collections/article/article_collection.dart';
import '../data_source/local/database/database_manager.dart';
import '../data_source/local/database/isar_database_manager_impl.dart';
import '../data_source/remote/network/network_client.dart';
import '../data_source/remote/network/network_client_impl.dart';
import '../data_source/remote/user/user_remote_data_source.dart';
import '../data_source/remote/user/user_remote_data_source_impl.dart';
import '../repository/app_config_repository_impl.dart';
import '../repository/auth_repository_impl.dart';
import '../repository/network_client_repository_impl.dart';
import '../repository/news_repository_impl.dart';
import '../repository/user_repository_impl.dart';
import '../data_source/remote/app_auth/auth_service.dart';
import '../data_source/remote/app_auth/firebase_auth_service.dart';
import '../data_source/local/shared_preferences/shared_preferences_service.dart';
import '../data_source/local/shared_preferences/shared_preferences_service_impl.dart';

final serviceLocator = GetIt.instance;

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

Future<void> init({Isar? isar}) async {
  await _registerLocalDatabase(isar: isar);
  _registerExternalServices();
  _registerServices();
  _registerNetworkClient();
  _registerConverters();
  _registerRepositories();
}

Future<void> _registerLocalDatabase({Isar? isar}) async {
  final Isar resultIsar;
  if (isar != null) {
    resultIsar = isar;
  } else {
    final directory = await getApplicationDocumentsDirectory();
    resultIsar = await Isar.open(
      [
        ArticleEntitySchema,
      ],
      directory: directory.path,
    );
  }
  serviceLocator.registerSingleton<Isar>(resultIsar);

  serviceLocator.registerFactory<DatabaseManager>(
    () => IsarDatabaseManagerImpl(
      resultIsar,
    ),
  );
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

  serviceLocator.registerLazySingleton<AuthService<User>>(
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

void _registerNetworkClient() {
  serviceLocator.registerSingleton<Dio>(
    Dio(),
  );
  serviceLocator.registerLazySingleton<NetworkClient>(
    () => NetworkClientImpl(
      serviceLocator(),
    ),
  );
}

void _registerConverters() {
  serviceLocator.registerSingleton<SourceConverter>(
    SourceConverter(),
  );

  serviceLocator.registerSingleton<ArticleConverter>(
    ArticleConverter(
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

  serviceLocator.registerLazySingleton<NetworkClientRepository>(
    () => NetworkClientRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
}
