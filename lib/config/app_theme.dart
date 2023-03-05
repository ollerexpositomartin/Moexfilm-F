import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  AppTheme(this._brightness);

  final Brightness _brightness;

  ThemeData get themeData {
    return ThemeData(brightness: _brightness).copyWith(
      colorScheme: _colorScheme,
      scaffoldBackgroundColor: AppColors.primaryColor,
      textTheme: _textTheme,
      useMaterial3: true,
    );
  }

  TextTheme get _textTheme => const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      );

  ColorScheme get _colorScheme => ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: _brightness,
      background: AppColors.primaryColor,
      primaryContainer: AppColors.primaryColor,
      onBackground: AppColors.primaryColor,
      onPrimaryContainer: AppColors.primaryColor);
}
