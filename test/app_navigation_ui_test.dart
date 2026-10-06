import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:al_fateh_management/core/localization/app_localizations.dart';
import 'package:al_fateh_management/core/localization/locale_cubit.dart';
import 'package:al_fateh_management/core/theme/theme.dart';
import 'package:al_fateh_management/core/theme/theme_cubit.dart';
import 'package:al_fateh_management/core/widgets/app_app_bar.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:al_fateh_management/features/home/presentation/views/widgets/home_mobile_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserModel testUser;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    testUser = const UserModel(
      userId: 'USR-001',
      username: 'admin',
      fullName: 'مدير النظام',
      department: 'MANAGEMENT',
      roleId: 'ROLE_ADMIN',
      status: 'ACTIVE',
    );
  });

  Widget buildTestWidget(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar'), Locale('en')],
        locale: const Locale('ar'),
        theme: MaterialTheme.lightTheme,
        home: Scaffold(
          appBar: const AppAppBar(title: 'منظومة الفتح'),
          bottomNavigationBar: child,
        ),
      ),
    );
  }

  testWidgets('AppAppBar and HomeMobileNavBar render cleanly with animations', (
    tester,
  ) async {
    int selectedTab = 0;

    await tester.pumpWidget(
      buildTestWidget(
        HomeMobileNavBar(
          user: testUser,
          selectedIndex: selectedTab,
          onDestinationSelected: (idx) => selectedTab = idx,
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Initial render
    expect(find.byType(AppAppBar), findsOneWidget);
    expect(find.byType(HomeMobileNavBar), findsOneWidget);

    // Let pulse animation run
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.text('منظومة الفتح'), findsOneWidget);

    // Tap on second tab
    final navItems = find.descendant(
      of: find.byType(HomeMobileNavBar),
      matching: find.byType(GestureDetector),
    );
    if (navItems.evaluate().length > 1) {
      await tester.tap(navItems.at(1));
      await tester.pump(const Duration(milliseconds: 250));
      expect(selectedTab, 1);
    }
  });
}
