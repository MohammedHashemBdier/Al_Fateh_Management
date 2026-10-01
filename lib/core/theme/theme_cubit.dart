import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _prefKey = 'selected_theme_mode';

  ThemeCubit() : super(ThemeMode.dark) {
    _loadSavedTheme();
  }

  Future<void> _loadSavedTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final modeStr = prefs.getString(_prefKey);
      if (modeStr == 'light') {
        emit(ThemeMode.light);
      } else if (modeStr == 'dark') {
        emit(ThemeMode.dark);
      } else {
        emit(ThemeMode.dark); // Default to dark for high-tech ISP look
      }
    } catch (_) {}
  }

  Future<void> toggleTheme() async {
    final nextMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(nextMode);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKey, nextMode == ThemeMode.dark ? 'dark' : 'light');
    } catch (_) {}
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    emit(mode);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKey, mode == ThemeMode.dark ? 'dark' : 'light');
    } catch (_) {}
  }
}
