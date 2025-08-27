import 'package:flutter/material.dart';

class AppTheme {
  static const Color _lightBackground = Color(0xFFFDFDFD);
  static const Color _darkBackground = Color(0xFF121212);

  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _darkSurface = Color(0xFF1E1E1E);

  static const Color _primaryTextLight = Color(0xFF111111);
  static const Color _primaryTextDark = Color(0xFFEFEFEF);

  static const Color _secondaryTextLight = Color(0xFF6E6E6E);
  static const Color _secondaryTextDark = Color(0xFFAAAAAA);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _lightBackground,
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.grey,
      surface: _lightSurface,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: _primaryTextLight,
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: _primaryTextLight,
      ),
      bodyLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: _primaryTextLight,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: _secondaryTextLight,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: _primaryTextLight,
      ),
    ),
    // cardTheme: CardTheme(
    //   color: _lightSurface,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   elevation: 2,
    //   shadowColor: Colors.black12,
    //   surfaceTintColor: _lightSurface,
    //   margin: const EdgeInsets.all(6),
    // ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.grey,
      surface: _darkSurface,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: _primaryTextDark,
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: _primaryTextDark,
      ),
      bodyLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: _primaryTextDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: _secondaryTextDark,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: _primaryTextDark,
      ),
    ),
    // cardTheme: CardTheme(
    //   color: _darkSurface,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   elevation: 2,
    //   shadowColor: Colors.black38,
    //   surfaceTintColor: _darkSurface,
    //   margin: const EdgeInsets.all(6),
    // ),
  );
}
