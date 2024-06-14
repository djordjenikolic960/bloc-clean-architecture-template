import 'dart:async';

import '../../../domain/model/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/app_config/get_app_config_stream_use_case.dart';
import '../../../domain/use_case/app_config/set_app_config_use_case.dart';
import 'app_config_event.dart';
import 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  final GetAppConfigStreamUseCase _getAppConfigStreamUseCase;
  final SetAppConfigUseCase _setAppConfigUseCase;
  StreamSubscription<AppConfig>? _appConfigSubscription;

  AppConfigBloc(
    this._getAppConfigStreamUseCase,
    this._setAppConfigUseCase,
  ) : super(AppConfigState.empty()) {
    on<InitializeAppConfig>(_emitInitializeAppConfig);
    on<UpdateAppConfig>(_emitUpdateAppConfig);
    on<UpdateLocale>(_emitUpdateLocale);
    on<UpdateCustomTheme>(_emitUpdateCustomTheme);
  }

  FutureOr<void> _emitInitializeAppConfig(
    InitializeAppConfig event,
    Emitter<AppConfigState> emit,
  ) {
    _appConfigSubscription =
        _getAppConfigStreamUseCase.get().listen((appConfig) {
      add(UpdateAppConfig(appConfig));
    });
  }

  FutureOr<void> _emitUpdateAppConfig(
    UpdateAppConfig event,
    Emitter<AppConfigState> emit,
  ) {
    emit(AppConfigState(appConfig: event.newAppConfig));
  }

  FutureOr<void> _emitUpdateLocale(
    UpdateLocale event,
    Emitter<AppConfigState> emit,
  ) async {
    await _setAppConfigUseCase
        .set(state.appConfig.copyWith(locale: event.newLocale));
  }

  FutureOr<void> _emitUpdateCustomTheme(
    UpdateCustomTheme event,
    Emitter<AppConfigState> emit,
  ) async {
    await _setAppConfigUseCase
        .set(state.appConfig.copyWith(theme: event.newCustomTheme));
  }

  @override
  Future<void> close() {
    _appConfigSubscription?.cancel();
    return super.close();
  }
}
