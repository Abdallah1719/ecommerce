import 'package:ecommerce_app/core/global/theme/index.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      // primary: Colors.blue,
      // secondary: Colors.green,
      // surface: Colors.white,
      // onPrimary: Colors.white,
      // onSecondary: Colors.black,
      // onSurface: Colors.black,
    ),
  );
  // Dark Theme
  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      //   primary: Colors.blue,
      //   secondary: Colors.tealAccent,
      //   surface: Colors.grey,
      //   onPrimary: Colors.black,
      //   onSecondary: Colors.black,
      //   onSurface: Colors.white,
    ),
  );
}
