import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get LightTheme => ThemeData(
    colorScheme: ColorScheme.light(
      primary: const Color.fromARGB(255, 44, 121, 56),
      onPrimary: const Color.fromARGB(255, 27, 26, 26),
      secondary: const Color.fromARGB(255, 194, 91, 6),
      onSecondary: const Color.fromARGB(255, 225, 135, 67),
      background: const Color.fromARGB(255, 246, 233, 221),
      onSurface: Colors.black,
      error: const Color.fromARGB(255, 255, 0, 0),
    ),
  );
}
