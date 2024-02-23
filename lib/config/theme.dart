import 'package:flutter/services.dart';

import '../constants/constants.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primarySwatch: Colors.purple,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldColor,
      fontFamily: AppConstants.primaryFont,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        color: AppColors.appBarColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontFamily: AppConstants.primaryFont,
        ),
        surfaceTintColor: Colors.grey,
      ),
      colorScheme: const ColorScheme.light(
        surface: Colors.grey,
        primary: AppColors.primaryColor,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black54,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.ink300),
        bodyMedium: TextStyle(color: AppColors.ink200),
        bodySmall: TextStyle(color: AppColors.ink100),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.purple,
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryDarkColor,
      primaryColorDark: AppColors.primaryLightColor,
      scaffoldBackgroundColor: AppColors.scaffoldColorDark,
      fontFamily: AppConstants.primaryFont,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        color: AppColors.appBarColorDark,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: AppConstants.primaryFont,
        ),
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        surface: Colors.grey,
        primary: AppColors.primaryColor,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }
}
