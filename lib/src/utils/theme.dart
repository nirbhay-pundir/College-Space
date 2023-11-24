import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CSColors.darker,
      secondary: CSColors.light,
      tertiary: CSColors.darkest,
      surface: CSColors.lighter,
      background: CSColors.lightest,
      onPrimary: CSColors.lightest,
      onSecondary: CSColors.darker,
      onBackground: CSColors.darker,
      onSurface: CSColors.darker,
      error: CSColors.lightest,
      onError: CSColors.errorColor,
      inverseSurface: CSColors.dark,
    ),
  );
}
