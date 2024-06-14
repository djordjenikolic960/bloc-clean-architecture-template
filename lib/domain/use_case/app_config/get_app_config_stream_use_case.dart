import '../../model/app_config.dart';

abstract class GetAppConfigStreamUseCase {
  Stream<AppConfig> get();
}
