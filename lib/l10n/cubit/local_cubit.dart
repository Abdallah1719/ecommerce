import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<String> {
  LocaleCubit() : super('en');

  static List<LocalizationsDelegate> localizationsDelegates = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  void toggleLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final newLocale = state == 'en' ? 'ar' : 'en';
    await prefs.setString('locale', newLocale);
    emit(newLocale);
  }

  void loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString('locale') ?? 'en';
    emit(savedLocale);
  }
}
