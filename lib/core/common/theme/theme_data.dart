import 'package:ecommerce_app/core/utils/resources/index.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    //main colors
    // input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(R.padding.p8),
      hintStyle: TextStyle(
        color: R.colors.lightgreen,
        fontSize: R.fontSize.s14,
      ),
      errorStyle: TextStyle(color: R.colors.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: R.colors.lightgreen1, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: R.colors.lightgreen, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',

    // input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(R.padding.p8),
      hintStyle: TextStyle(
        color: R.colors.lightgreen,
        fontSize: R.fontSize.s14,
      ),
      errorStyle: TextStyle(color: R.colors.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: R.colors.lightgreen1, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: R.colors.lightgreen1, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  //   primary: Colors.blue,
  //   secondary: Colors.tealAccent,
  //   surface: Colors.grey,
  //   onPrimary: Colors.black,
  //   onSecondary: Colors.black,
  //   onSurface: Colors.white,
}
