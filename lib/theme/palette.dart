import 'package:flutter/material.dart';

class Palette {
  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Colors.red,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.purple,
      background: Colors.grey[300] as Color,
    ),
  );
}
