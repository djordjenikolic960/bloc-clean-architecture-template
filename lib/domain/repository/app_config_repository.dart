import '../model/app_config.dart';

abstract class AppConfigRepository {
  Stream<AppConfig> getAppConfigStream();

  Future<void> setAppConfig(AppConfig appConfig);

  void dispose();
}
