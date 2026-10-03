import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/main.dart';
import 'package:al_fateh_management/features/auth/presentation/views/login_view.dart';
import 'package:al_fateh_management/core/widgets/app_theme_language_switchers.dart';
import 'package:al_fateh_management/core/localization/locale_cubit.dart';
import 'package:al_fateh_management/core/theme/theme_cubit.dart';
import 'package:al_fateh_management/core/localization/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  testWidgets('AlFatehManagementApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AlFatehManagementApp());
    expect(find.byType(AlFatehManagementApp), findsOneWidget);
  });

  testWidgets('AppThemeLanguageSwitchers does not overflow on very narrow screen',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(180, 600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => LocaleCubit()),
        ],
        child: const MaterialApp(
          localizationsDelegates: [AppLocalizations.delegate],
          home: Scaffold(
            body: SizedBox(
              width: 175.3,
              child: AppThemeLanguageSwitchers(spread: true),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(AppThemeLanguageSwitchers), findsOneWidget);
  });

  testWidgets('LoginView renders without overflow on narrow mobile and desktop',
      (WidgetTester tester) async {
    // 1. Mobile narrow view
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => LocaleCubit()),
        ],
        child: const MaterialApp(
          localizationsDelegates: [AppLocalizations.delegate],
          home: LoginView(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(LoginView), findsOneWidget);

    // 2. Desktop view
    tester.view.physicalSize = const Size(1200, 800);
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => LocaleCubit()),
        ],
        child: const MaterialApp(
          localizationsDelegates: [AppLocalizations.delegate],
          home: LoginView(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(LoginView), findsOneWidget);
    addTearDown(tester.view.resetPhysicalSize);
  });
}

