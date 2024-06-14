import '../../model/app_config.dart';

abstract class SetAppConfigUseCase {
  Future<void> set(AppConfig appConfig);
}
