import '../../entity/app_config.dart';
import '../../repository/app_config_repository.dart';
import 'set_app_config_use_case.dart';

class SetAppConfigUseCaseImpl implements SetAppConfigUseCase {
  final AppConfigRepository _appConfigRepository;

  SetAppConfigUseCaseImpl(this._appConfigRepository);

  @override
  Future<void> set(AppConfig appConfig) async {
    await _appConfigRepository.setAppConfig(appConfig);
  }
}
