import '../../model/app_config.dart';
import '../../repository/app_config_repository.dart';
import 'get_app_config_stream_use_case.dart';

class GetAppConfigStreamUseCaseImpl implements GetAppConfigStreamUseCase {
  final AppConfigRepository _appConfigRepository;

  GetAppConfigStreamUseCaseImpl(this._appConfigRepository);

  @override
  Stream<AppConfig> get() {
    return _appConfigRepository.getAppConfigStream();
  }
}
