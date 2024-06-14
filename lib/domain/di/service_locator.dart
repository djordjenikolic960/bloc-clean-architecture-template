import 'package:get_it/get_it.dart';

import '../use_case/app_config/get_app_config_stream_use_case.dart';
import '../use_case/app_config/get_app_config_stream_use_case_impl.dart';
import '../use_case/app_config/set_app_config_use_case.dart';
import '../use_case/app_config/set_app_config_use_case_impl.dart';

final serviceLocator = GetIt.instance;

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

Future<void> init() async {
  _registerUseCases();
}

void _registerUseCases() {
  serviceLocator.registerFactory<GetAppConfigStreamUseCase>(
    () => GetAppConfigStreamUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SetAppConfigUseCase>(
    () => SetAppConfigUseCaseImpl(
      serviceLocator(),
    ),
  );
}
