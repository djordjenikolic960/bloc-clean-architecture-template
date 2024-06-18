import '../../../domain/entity/app_config.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../presentation/theme/themes.dart';

@immutable
abstract class AppConfigEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializeAppConfig extends AppConfigEvent {}

class UpdateLocale extends AppConfigEvent {
  final Locale newLocale;

  UpdateLocale(this.newLocale);

  @override
  List<Object?> get props => [newLocale];
}

class UpdateCustomTheme extends AppConfigEvent {
  final CustomTheme newCustomTheme;

  UpdateCustomTheme(this.newCustomTheme);

  @override
  List<Object?> get props => [newCustomTheme];
}

class UpdateAppConfig extends AppConfigEvent {
  final AppConfig newAppConfig;

  UpdateAppConfig(this.newAppConfig);

  @override
  List<Object?> get props => [newAppConfig];
}
