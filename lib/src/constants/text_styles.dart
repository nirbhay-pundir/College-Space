import 'package:flutter/material.dart';
import '../utils/theme.dart';

class CSTextStyles {
  CSTextStyles._();

  static final ColorScheme colorScheme = AppTheme.theme.colorScheme;

  static TextStyle bottomLine = TextStyle(
    color: colorScheme.surface,
    fontSize: 18,
    fontFamily: 'Blinker',
    fontWeight: FontWeight.w400,
  );

  static TextStyle signInButton = TextStyle(
    color: colorScheme.primary,
    fontSize: 20,
    fontFamily: 'Biryani',
    fontWeight: FontWeight.w400,
    height: 0,
  );

  static TextStyle heading = TextStyle(
    color: colorScheme.primary,
    fontSize: 40,
    fontFamily: 'Blinker',
    fontWeight: FontWeight.bold,
  );
}
