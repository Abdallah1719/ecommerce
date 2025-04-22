import 'package:ecommerce_app/core/common/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool lightMode = true;
  toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    lightMode ? lightMode = false : lightMode = true;
    prefs.setBool('lightMode', lightMode);
    emit(ThemeMode());
  }

  ThemeData currentTheme() {
    return lightMode ? AppTheme.lightMode : AppTheme.darkMode;
  }

  void loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    lightMode = prefs.getBool('lightMode') ?? true;
    emit(LoadSavedState());
  }
}
