import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/app_config.dart';
import '../../../l10n/l10n.dart';
import '../../../presentation/theme/themes.dart';

@immutable
class AppConfigState extends Equatable {
  final AppConfig appConfig;

  const AppConfigState({
    required this.appConfig,
  });

  factory AppConfigState.empty() {
    return const AppConfigState(
      appConfig: AppConfig(
        L10n.defaultLocale,
        CustomTheme.light,
      ),
    );
  }

  @override
  List<Object?> get props => [appConfig];
}
