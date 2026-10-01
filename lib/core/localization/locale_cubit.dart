import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  static const String _prefKey = 'selected_locale';

  LocaleCubit() : super(const Locale('ar')) {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final langCode = prefs.getString(_prefKey) ?? 'ar';
      emit(Locale(langCode));
    } catch (_) {}
  }

  Future<void> setLocale(Locale locale) async {
    emit(locale);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKey, locale.languageCode);
    } catch (_) {}
  }

  void toggleLocale() {
    if (state.languageCode == 'ar') {
      setLocale(const Locale('en'));
    } else {
      setLocale(const Locale('ar'));
    }
  }
}
