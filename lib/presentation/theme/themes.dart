import 'package:flutter/material.dart';

import '../../shared/colors.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
  dividerColor: AppColors.dividerColorLight,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.bottomNavBarColorLight,
    selectedItemColor: AppColors.bottomNavBarSelectedItemColorLight,
    unselectedItemColor: AppColors.bottomNavBarUnSelectedItemColorLight,
  ),
  textTheme: const TextTheme(
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
      fontSize: 22,
    ),
    color: AppColors.appBarColorLight,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.dialogBackgroundColorLight,
    titleTextStyle: TextStyle(
      fontSize: 22,
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
      fontSize: 22,
    ),
    color: AppColors.appBarColorDark,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColorDark,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.iconColorDark),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.dialogBackgroundColorDark,
    titleTextStyle: TextStyle(
      fontSize: 22,
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
