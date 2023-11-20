import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: QColors.darker,
      secondary: QColors.light,
      tertiary: QColors.darkest,
      surface: QColors.lighter,
      background: QColors.lightest,
      onPrimary: QColors.lightest,
      onSecondary: QColors.darker,
      onBackground: QColors.darker,
      onSurface: QColors.darker,
      error: QColors.lightest,
      onError: QColors.errorColor,
      inverseSurface: QColors.dark,
    ),
  );
}
