import 'package:flutter/material.dart';

class AppColors {
  // Main dark background
  static const background = Color(0xFF141B2B);
  static const cardBg = Color(0xFF1C2538);
  static const border = Color(0xFF2A3550);

  // Primary blue
  static const primary = Color(0xFF0098E6);
  static const primaryForeground = Colors.white;

  // Muted
  static const muted = Color(0xFF283040);
  static const mutedForeground = Color(0xFF8B97AD);

  // Foreground
  static const foreground = Color(0xFFE8ECF1);

  // Secondary
  static const secondary = Color(0xFF283040);
  static const secondaryForeground = Color(0xFFE8ECF1);

  // Gradient
  static const gradientStart = Color(0xFF141B2B);
  static const gradientEnd = Color(0xFF1A2A3D);

  // Glow
  static const glowColor = Color(0x400098E6);

  // OCC theme
  static const occBlue = Color(0xFF3B82F6);
  static const occPurple = Color(0xFFA78BFA);

  // Keibo theme
  static const keiboOrange = Color(0xFFFF7B00);
  static const keiboBlue = Color(0xFF58A6FF);
  static const keiboBg = Color(0xFF0D1117);
  static const keiboCard = Color(0xFF161B22);
  static const keiboBorder = Color(0xFF30363D);
  static const keiboText = Color(0xFFC9D1D9);
  static const keiboMuted = Color(0xFF8B949E);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        surface: AppColors.cardBg,
        onPrimary: AppColors.primaryForeground,
        onSurface: AppColors.foreground,
      ),
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.foreground,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: AppColors.foreground,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: AppColors.foreground,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.foreground,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: AppColors.foreground,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: AppColors.foreground,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: AppColors.mutedForeground),
        bodyMedium: TextStyle(color: AppColors.mutedForeground),
        labelLarge: TextStyle(
          color: AppColors.foreground,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
