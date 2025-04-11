import 'package:flutter/material.dart';
import 'package:lms_app/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // Primary color scheme
    primaryColor: AppColors.primaryDarkPurple,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch:
          MaterialColor(AppColors.primaryDarkPurple.toARGB32(), <int, Color>{
            50: AppColors.primaryGradientEnd,
            100: AppColors.primaryGradientEnd,
            200: AppColors.primaryLightPurple,
            300: AppColors.primaryLightPurple,
            400: AppColors.primaryLightPurple,
            500: AppColors.primaryDarkPurple,
            600: AppColors.primaryDarkPurple,
            700: AppColors.primaryDarkPurple,
            800: AppColors.primaryDarkPurple,
            900: AppColors.primaryDarkPurple,
          }),
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    // AppBar theme
    appBarTheme: AppBarTheme(
      // backgroundColor: AppColors.primaryDarkPurple,
      titleTextStyle: TextStyle(
        color: AppColors.primaryDarkPurple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: AppColors.backgroundLight,
      iconTheme: IconThemeData(color: AppColors.primaryDarkPurple),
    ),
    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLightPurple,
        foregroundColor: AppColors.buttonText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),
    // Text theme
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: AppColors.textDark, fontSize: 24),
      bodyMedium: TextStyle(color: AppColors.textLight, fontSize: 16),
    ),
    // Card theme
    cardTheme: CardTheme(
      color: AppColors.cardBackground,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: AppColors.shadowColor,
    ),
    // Custom colors for charts or custom widgets
    canvasColor: AppColors.chartGray,

    // Search bar theme
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStateColor.resolveWith(
        (_) => AppColors.backgroundLight,
      ),
      elevation: WidgetStateProperty.resolveWith((_) => 0),
    ),
  );
}
