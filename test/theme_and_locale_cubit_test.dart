import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:al_fateh_management/core/theme/theme_cubit.dart';
import 'package:al_fateh_management/core/localization/locale_cubit.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('ThemeCubit Tests', () {
    test('Default theme is ThemeMode.system on initial launch', () {
      final cubit = ThemeCubit();
      expect(cubit.state, equals(ThemeMode.system));
      expect(cubit.isSystem, isTrue);
    });

    test('Can switch to dark, light, and back to system', () async {
      final cubit = ThemeCubit();
      await cubit.setThemeMode(ThemeMode.dark);
      expect(cubit.state, equals(ThemeMode.dark));
      expect(cubit.isSystem, isFalse);

      await cubit.setThemeMode(ThemeMode.light);
      expect(cubit.state, equals(ThemeMode.light));

      await cubit.setThemeMode(ThemeMode.system);
      expect(cubit.state, equals(ThemeMode.system));
      expect(cubit.isSystem, isTrue);
    });
  });

  group('LocaleCubit Tests', () {
    test('Default locale is null (device language) on initial launch', () {
      final cubit = LocaleCubit();
      expect(cubit.state, isNull);
      expect(cubit.isSystem, isTrue);
    });

    test('Can switch to Arabic, English, and back to system', () async {
      final cubit = LocaleCubit();
      await cubit.setArabic();
      expect(cubit.state, equals(const Locale('ar')));
      expect(cubit.isSystem, isFalse);

      await cubit.setEnglish();
      expect(cubit.state, equals(const Locale('en')));

      await cubit.setSystem();
      expect(cubit.state, isNull);
      expect(cubit.isSystem, isTrue);
    });
  });
}
