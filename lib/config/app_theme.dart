import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  AppTheme(this._brightness);

  final Brightness _brightness;

  ThemeData get themeData {
    return ThemeData(brightness: _brightness).copyWith(
      colorScheme: _colorScheme,
      scaffoldBackgroundColor: AppColors.BACKGROUND_COLOR,
      textTheme: _textTheme,
      useMaterial3: true,
    );
  }

  TextTheme get _textTheme => const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      );

  ColorScheme get _colorScheme => ColorScheme.fromSeed(
      seedColor: AppColors.BACKGROUND_COLOR,
      brightness: _brightness,
      background: AppColors.BACKGROUND_COLOR,
      primaryContainer: AppColors.BACKGROUND_COLOR,
      onBackground: AppColors.BACKGROUND_COLOR,
      onPrimaryContainer: AppColors.BACKGROUND_COLOR);
}
