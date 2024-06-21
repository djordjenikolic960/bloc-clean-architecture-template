import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/constant.dart';
import '../../shared/dimens.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light().copyWith(
    primary: AppColors.bottomNavBarColorLight,
  ),
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
      fontFamily: Constant.fontFamilySemiBold,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textColorLight,
      fontSize: Dimens.fontSize16,
      fontFamily: Constant.fontFamilyRegular,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.iconColorLight,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: AppColors.appBarTitleColorLight,
      fontSize: Dimens.fontSize22,
      fontFamily: Constant.fontFamilyRegular,
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
      fontFamily: Constant.fontFamilyRegular,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: Dimens.size16,
      vertical: Dimens.size12,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: const TextStyle(
      fontSize: Dimens.fontSize16,
      color: Colors.black54,
    ),
    border: _getBorder(Colors.black54),
    focusedBorder: _getBorder(Colors.black54),
    enabledBorder: _getBorder(Colors.black54),
    suffixIconColor: Colors.black54,
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
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.bottomNavBarColorLight,
    shape: CircleBorder(),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: Constant.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(Dimens.radius24),
      ),
    ),
    backgroundColor: Colors.white,
    showDragHandle: false,
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
  ),
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark().copyWith(
    primary: AppColors.bottomNavBarColorLight,
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
  dividerColor: AppColors.dialogBackgroundColorDark,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.bottomNavBarColorDark,
    selectedItemColor: AppColors.bottomNavBarSelectedItemColorDark,
    unselectedItemColor: AppColors.bottomNavBarUnSelectedItemColorDark,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: AppColors.appBarTitleColorDark,
      fontSize: Dimens.fontSize22,
      fontFamily: Constant.fontFamilyRegular,
    ),
    color: AppColors.appBarColorDark,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: AppColors.textColorDark,
      fontSize: Dimens.fontSize32,
      fontFamily: Constant.fontFamilySemiBold,
    ),
    bodyMedium: TextStyle(
      color: AppColors.textColorDark,
      fontFamily: Constant.fontFamilyRegular,
      fontSize: Dimens.size16,
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
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: Dimens.size16,
      vertical: Dimens.size12,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: const TextStyle(
      fontSize: Dimens.fontSize16,
      color: Colors.white70,
      fontFamily: Constant.fontFamilyRegular,
    ),
    border: _getBorder(Colors.white70),
    focusedBorder: _getBorder(Colors.white),
    enabledBorder: _getBorder(Colors.white54),
    suffixIconColor: Colors.white70,
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
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.bottomNavBarColorLight,
    shape: CircleBorder(),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: Constant.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(Dimens.radius24),
      ),
    ),
    backgroundColor: AppColors.dialogBackgroundColorDark,
    showDragHandle: false,
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
  ),
);

OutlineInputBorder _getBorder(Color color) => OutlineInputBorder(
      borderSide: BorderSide(
        width: Dimens.size1,
        color: color,
      ),
      borderRadius: BorderRadius.circular(Dimens.radius20),
    );

enum CustomTheme {
  light,
  dark,
}
