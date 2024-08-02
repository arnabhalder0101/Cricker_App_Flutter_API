import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    background: Colors.grey[900],
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade600,
    tertiary: Colors.grey.shade500,
    inversePrimary: Colors.grey[200],
  ),
);

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    background: Colors.grey[200],
    primary: Colors.grey.shade400,
    secondary: Colors.grey.shade600,
    tertiary: Colors.grey.shade700,
    inversePrimary: Colors.grey[900],
  ),
);
