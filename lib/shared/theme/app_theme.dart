import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants.dart';

enum AppTheme {
  blueLight("Blue Light"),
  blueDark("Blue Dark");

  final String name;

  const AppTheme(this.name);
}

final appThemeData = {
  AppTheme.blueLight: ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white.withValues(alpha: 0.0),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: defaultColor, size: 30),
      surfaceTintColor: Colors.white,
    ),
    iconTheme: IconThemeData(color: secondaryColor),
    primaryColor: Colors.white,
    shadowColor: Colors.black87,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.black45.withValues(alpha: .08),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: defaultColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        color: defaultColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: defaultColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      labelLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),

      headlineLarge: TextStyle(color: Colors.white, fontSize: 25),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headlineSmall: TextStyle(color: secondaryColor, fontSize: 16),

      bodyLarge: TextStyle(color: defaultColor, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.grey.shade600, fontSize: 14),
      bodySmall: TextStyle(color: defaultColor, fontSize: 12),

      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(color: Colors.grey.shade600, fontSize: 14),
    ),
    datePickerTheme: DatePickerThemeData(backgroundColor: Colors.white,dividerColor: defaultColor),
  ),
  AppTheme.blueDark: ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white.withValues(alpha: 0.0),
          statusBarBrightness: Brightness.light
      ),
      backgroundColor: Colors.grey.shade800,
      surfaceTintColor: Colors.grey.shade800,
      iconTheme: IconThemeData(color: Colors.grey.shade400, size: 30),
    ),
    iconTheme: IconThemeData(color: secondaryColor),
    brightness: Brightness.dark,
    primaryColor: Colors.grey.shade800,
    shadowColor: Colors.white70,
    scaffoldBackgroundColor: Colors.grey.shade800,
    cardColor: Colors.grey[500],
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.grey.shade800,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: defaultColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: defaultColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      labelLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontSize: 8,
        fontWeight: FontWeight.bold,
      ),

      headlineLarge: TextStyle(color: Colors.white, fontSize: 25),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headlineSmall: TextStyle(color: secondaryColor, fontSize: 16),

      bodyLarge: TextStyle(color: Colors.grey.shade400, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.grey.shade700, fontSize: 14),
      bodySmall: TextStyle(color: defaultColor, fontSize: 12),

      displayLarge: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(color: Colors.grey.shade500, fontSize: 14),
    ),
    datePickerTheme: DatePickerThemeData(backgroundColor: Colors.grey.shade800,dividerColor: Colors.grey.shade400),
  ),
};
