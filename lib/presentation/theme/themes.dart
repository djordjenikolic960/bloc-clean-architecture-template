import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/dimens.dart';

final lightTheme = ThemeData(
  primaryColor: AppColors.scaffoldBackgroundColorLight,
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
  dividerColor: AppColors.dividerColorLight,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.bottomNavBarColorLight,
    selectedItemColor: AppColors.bottomNavBarSelectedItemColorLight,
    unselectedItemColor: AppColors.bottomNavBarUnSelectedItemColorLight,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: AppColors.textColorLight,
      fontSize: Dimens.fontSize32,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textColorLight,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.iconColorLight,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: AppColors.appBarTitleColorLight,
      fontSize: Dimens.fontSize22,
    ),
    color: AppColors.appBarColorLight,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.dialogBackgroundColorLight,
    titleTextStyle: TextStyle(
      fontSize: Dimens.fontSize22,
      color: AppColors.dialogTitleColorLight,
    ),
    contentTextStyle: TextStyle(
      color: AppColors.dialogContentColorLight,
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (!states.contains(WidgetState.selected)) {
        return AppColors.radioButtonUnselectedColorLight;
      }
      return AppColors.radioButtonSelectedColorLight;
    }),
  ),
);

final darkTheme = ThemeData(
  primaryColor: AppColors.scaffoldBackgroundColorDark,
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
  dividerColor: AppColors.dialogBackgroundColorDark,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.bottomNavBarColorDark,
    selectedItemColor: AppColors.bottomNavBarSelectedItemColorDark,
    unselectedItemColor: AppColors.bottomNavBarUnSelectedItemColorDark,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: AppColors.appBarTitleColorLight,
      fontSize: Dimens.fontSize22,
    ),
    color: AppColors.appBarColorDark,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: AppColors.textColorDark,
      fontSize: Dimens.fontSize32,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textColorDark,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.iconColorDark),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.dialogBackgroundColorDark,
    titleTextStyle: TextStyle(
      fontSize: Dimens.fontSize22,
      color: AppColors.dialogTitleColorDark,
    ),
    contentTextStyle: TextStyle(
      color: AppColors.dialogContentColorDark,
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (!states.contains(WidgetState.selected)) {
        return AppColors.radioButtonUnselectedColorDark;
      }
      return AppColors.radioButtonSelectedColorDark;
    }),
  ),
);

enum CustomTheme {
  light,
  dark,
}
