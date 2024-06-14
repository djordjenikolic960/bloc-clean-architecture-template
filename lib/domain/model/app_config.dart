import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../presentation/theme/themes.dart';

class AppConfig extends Equatable {
  final Locale locale;
  final CustomTheme theme;

  const AppConfig(
    this.locale,
    this.theme,
  );

  @override
  List<Object?> get props => [
        locale,
        theme,
      ];

  AppConfig copyWith({
    final Locale? locale,
    final CustomTheme? theme,
  }) {
    return AppConfig(
      locale ?? this.locale,
      theme ?? this.theme,
    );
  }
}
