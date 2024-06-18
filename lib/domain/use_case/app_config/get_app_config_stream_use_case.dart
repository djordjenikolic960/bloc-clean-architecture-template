import '../../entity/app_config.dart';

abstract class GetAppConfigStreamUseCase {
  Stream<AppConfig> get();
}
