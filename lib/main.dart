import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localization/app_localizations.dart';
import 'core/localization/locale_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AlFatehManagementApp());
}

class AlFatehManagementApp extends StatelessWidget {
  const AlFatehManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<LocaleCubit>(create: (context) => LocaleCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LocaleCubit, Locale?>(
            builder: (context, currentLocale) {
              return MaterialApp.router(
                title: 'إدارة مزود خدمة الانترنت الفتح',
                debugShowCheckedModeBanner: false,

                // نظام التوجيه GoRouter
                routerConfig: AppRouter.router,

                // اللغات والتوطين (عربي / إنكليزي / لغة الجهاز التلقائية)
                locale: currentLocale,
                supportedLocales: const [Locale('ar'), Locale('en')],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  if (currentLocale != null) return currentLocale;
                  if (deviceLocale != null) {
                    for (final supported in supportedLocales) {
                      if (supported.languageCode == deviceLocale.languageCode) {
                        return supported;
                      }
                    }
                  }
                  // اللغة الافتراضية عند عدم توفر لغة الجهاز
                  return const Locale('ar');
                },
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                // الثيم المتجاوب (فاتح / داكن / ثيم الجهاز) مع خطوط Monadi و Alhadari
                theme: MaterialTheme.lightTheme,
                darkTheme: MaterialTheme.darkTheme,
                themeMode: themeMode,
              );
            },
          );
        },
      ),
    );
  }
}
