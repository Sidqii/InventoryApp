import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData SoftWhiteMinimalist = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFF8F9FA),
      onPrimary: Color(0xFF2D2D2D),
      secondary: Color(0xFFE9ECEF),
      onSecondary: Color(0xFF4A4A4A),
      error: Color(0xFFD66D75),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF2D2D2D),
    ),
  );

  static final ThemeData SoftCreamyWhite = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFF5E6CA),
      onPrimary: Color(0xFF3B3B3B),
      secondary: Color(0xFFF5E6CA),
      onSecondary: Color(0xFF4F4F4F),
      error: Color(0xFFE07A5F),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF2C2C2C),
    ),
  );

  static final ThemeData SoftFrostWhite = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFF0F0F3),
      onPrimary: Color(0xFF1C1C1E),
      secondary: Color(0xFFDEE2E6),
      onSecondary: Color(0xFF343A40),
      error: Color(0xFFD64550),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF202124),
    ),
  );

  static final ThemeData DarkMode = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.blueGrey,
      onPrimary: Colors.white,
      secondary: Colors.teal,
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.grey,
      surface: Colors.grey[900]!,
      onSurface: Colors.white,
    ),
  );

  static final ThemeData BrightPastel = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffFFF2CC),
      onPrimary: Color(0xff000000),
      secondary: Color(0xffFFD966),
      onSecondary: Color(0xff000000),
      error: Color(0xffF4B183),
      onError: Color(0xff000000),
      surface: Color(0xffDFA67B),
      onSurface: Color(0xff000000),
    ),
  );

  static final ThemeData FreshNature = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffA8D5BA),
      onPrimary: Color(0xff000000),
      secondary: Color(0xffF9ED69),
      onSecondary: Color(0xff000000),
      error: Color(0xffF08A5D),
      onError: Color(0xffFFFFFF),
      surface: Color(0xffB83B5E),
      onSurface: Color(0xffFFFFFF),
    ),
  );
}
