import 'package:flutter/material.dart';

class AppTheme {
  static const _primary = Color(0xFF22C55E);
  static const _secondary = Color(0xFF06B6D4);
  static const _bg = Color(0xFF0F172A);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _bg,

    colorScheme: const ColorScheme.dark(
      primary: _primary,
      secondary: _secondary,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E293B),
      centerTitle: true,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
  color: const Color(0xFF1E293B),
  elevation: 6,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18),
  ),
),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}