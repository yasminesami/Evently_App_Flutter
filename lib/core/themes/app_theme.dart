import 'package:evently/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.whiteColor,
      // لون النص غير النشط
      selectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      // لون النص النشط
      backgroundColor: AppColors.primaryLight,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.whiteColor,
      // لون النص غير النشط
      selectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      // لون النص النشط
      backgroundColor: AppColors.primaryDark,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
