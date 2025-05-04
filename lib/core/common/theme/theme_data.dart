import 'package:ecommerce_app/core/utils/resources/index.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      backgroundColor: R.colors.white,
      iconTheme: IconThemeData(color: R.colors.darkgreen),
    ),
    //main colors
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: R.fontSize.s24),
      titleMedium: TextStyle(fontSize: R.fontSize.s22),
      titleSmall: TextStyle(fontSize: R.fontSize.s20),
      headlineLarge: TextStyle(
        fontSize: R.fontSize.s24,
        fontWeight: FontWeight.w600,
        color: R.colors.darkgreen,
      ),
      headlineMedium: TextStyle(fontSize: R.fontSize.s22),
      headlineSmall: TextStyle(fontSize: R.fontSize.s20),
      bodyLarge: TextStyle(fontSize: R.fontSize.s16),
      bodyMedium: TextStyle(
        fontSize: R.fontSize.s14,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(fontSize: R.fontSize.s12),
    ),

    // input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(R.padding.p8),
      hintStyle: TextStyle(color: R.colors.darkgreen, fontSize: R.fontSize.s14),

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
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: R.colors.darkgreen,
      selectionHandleColor: Colors.blue,
      selectionColor: Colors.green.withOpacity(0.3),
    ),
  );

  // Dark Theme
  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',

    // input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(R.padding.p8),
      hintStyle: TextStyle(color: R.colors.darkgreen, fontSize: R.fontSize.s14),
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
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.red,
      selectionHandleColor: Colors.blue,
      selectionColor: Colors.green.withOpacity(0.3),
    ),
  );

  //   primary: Colors.blue,
  //   secondary: Colors.tealAccent,
  //   surface: Colors.grey,
  //   onPrimary: Colors.black,
  //   onSecondary: Colors.black,
  //   onSurface: Colors.white,
}
