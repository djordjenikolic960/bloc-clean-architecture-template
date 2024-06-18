import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/entity/app_config.dart';
import '../../domain/repository/app_config_repository.dart';
import '../../l10n/l10n.dart';
import '../../presentation/theme/themes.dart';
import '../service/shared_preferences_service.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  static const _localeKey = "locale";
  static const _themeKey = "theme";
  final SharedPreferencesService _sharedPreferencesService;

  final _controller = StreamController<AppConfig>();

  AppConfigRepositoryImpl(this._sharedPreferencesService) {
    _init();
  }

  void _init() async {
    final themeString = await _sharedPreferencesService.get<String>(_themeKey);
    final shortLocale = await _sharedPreferencesService.get<String>(_localeKey);
    final locale =
        shortLocale != null ? Locale(shortLocale) : L10n.defaultLocale;
    final theme = CustomTheme.values.firstWhere(
        (theme) => theme.name == themeString,
        orElse: () => CustomTheme.light);
    _controller.add(AppConfig(locale, theme));
  }

  @override
  Stream<AppConfig> getAppConfigStream() {
    return _controller.stream;
  }

  @override
  Future<void> setAppConfig(AppConfig appConfig) async {
    _controller.add(appConfig);
    await _sharedPreferencesService.save<String>(
        _themeKey, appConfig.theme.name);
    await _sharedPreferencesService.save<String>(
        _localeKey, appConfig.locale.languageCode);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
