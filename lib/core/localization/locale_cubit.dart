import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale?> {
  static const String _prefKey = 'selected_locale';

  LocaleCubit() : super(null) {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedCode = prefs.getString(_prefKey);
      if (savedCode == 'ar') {
        emit(const Locale('ar'));
      } else if (savedCode == 'en') {
        emit(const Locale('en'));
      } else {
        // First launch or system default: null means use device language
        emit(null);
      }
    } catch (_) {}
  }

  Future<void> setLocale(Locale? locale) async {
    emit(locale);
    try {
      final prefs = await SharedPreferences.getInstance();
      if (locale == null) {
        await prefs.setString(_prefKey, 'system');
      } else {
        await prefs.setString(_prefKey, locale.languageCode);
      }
    } catch (_) {}
  }

  Future<void> setArabic() => setLocale(const Locale('ar'));
  Future<void> setEnglish() => setLocale(const Locale('en'));
  Future<void> setSystem() => setLocale(null);

  bool get isSystem => state == null;
}
