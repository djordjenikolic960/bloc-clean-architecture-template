import 'package:get_it/get_it.dart';

import '../../domain/repository/app_config_repository.dart';
import '../repository/app_config_repository_impl.dart';
import '../service/shared_preferences_service.dart';
import '../service/shared_preferences_service_impl.dart';

final serviceLocator = GetIt.instance;

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

Future<void> init() async {
  _registerServices();
  //_registerNetworkClient();
  //_registerLocalStorage();
  //_registerConverters();
  //_registerHelpers();
  //_registerExternalServices();
  //_registerManagers();
  _registerRepositories();
}

void _registerServices() {
  serviceLocator.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesServiceImpl(),
  );
}

void _registerRepositories() {
  serviceLocator.registerLazySingleton<AppConfigRepository>(
    () => AppConfigRepositoryImpl(
      serviceLocator(),
    ),
  );
}
