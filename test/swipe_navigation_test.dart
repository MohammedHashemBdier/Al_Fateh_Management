import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:al_fateh_management/core/localization/app_localizations.dart';
import 'package:al_fateh_management/core/localization/locale_cubit.dart';
import 'package:al_fateh_management/core/theme/theme.dart';
import 'package:al_fateh_management/core/theme/theme_cubit.dart';
import 'package:al_fateh_management/core/widgets/app_scaffold.dart';
import 'package:al_fateh_management/core/widgets/scaffold/components/app_swipe_navigation.dart';
import 'package:al_fateh_management/core/widgets/scaffold/models/role_definitions.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  const testUser = UserModel(
    userId: 'USR-001',
    username: 'admin',
    fullName: 'مدير النظام',
    department: 'MANAGEMENT',
    roleId: 'ROLE_ADMIN',
    status: 'ACTIVE',
  );

  group('RoleDefinitions Route Helpers Tests', () {
    test('getNextRoute returns sequential next route for admin', () {
      expect(RoleDefinitions.getNextRoute('/home', 'ROLE_ADMIN'), '/tickets');
      expect(
        RoleDefinitions.getNextRoute('/tickets', 'ROLE_ADMIN'),
        '/attendance',
      );
      expect(
        RoleDefinitions.getNextRoute('/attendance', 'ROLE_ADMIN'),
        '/employees',
      );
      expect(
        RoleDefinitions.getNextRoute('/employees', 'ROLE_ADMIN'),
        '/settings',
      );
      expect(RoleDefinitions.getNextRoute('/settings', 'ROLE_ADMIN'), isNull);
    });

    test('getPreviousRoute returns sequential previous route for admin', () {
      expect(RoleDefinitions.getPreviousRoute('/home', 'ROLE_ADMIN'), isNull);
      expect(
        RoleDefinitions.getPreviousRoute('/tickets', 'ROLE_ADMIN'),
        '/home',
      );
      expect(
        RoleDefinitions.getPreviousRoute('/attendance', 'ROLE_ADMIN'),
        '/tickets',
      );
      expect(
        RoleDefinitions.getPreviousRoute('/employees', 'ROLE_ADMIN'),
        '/attendance',
      );
      expect(
        RoleDefinitions.getPreviousRoute('/settings', 'ROLE_ADMIN'),
        '/employees',
      );
    });

    test('ignores query parameters in currentRoute gracefully', () {
      expect(
        RoleDefinitions.getNextRoute('/home?tab=1', 'ROLE_ADMIN'),
        '/tickets',
      );
      expect(
        RoleDefinitions.getPreviousRoute('/tickets?date=today', 'ROLE_ADMIN'),
        '/home',
      );
    });

    test('returns null for unknown routes', () {
      expect(RoleDefinitions.getNextRoute('/login', 'ROLE_ADMIN'), isNull);
      expect(
        RoleDefinitions.getPreviousRoute('/unknown', 'ROLE_ADMIN'),
        isNull,
      );
    });
  });

  group('AppSwipeNavigation Widget Tests', () {
    Widget createTestApp(Widget child) {
      return MaterialApp(home: Scaffold(body: child));
    }

    testWidgets('Swipe left triggers onNavigate to next route', (tester) async {
      String? navigatedRoute;

      await tester.pumpWidget(
        createTestApp(
          AppSwipeNavigation(
            activeRoute: '/home',
            user: testUser,
            onNavigate: (route) => navigatedRoute = route,
            child: const Center(child: Text('Home Content')),
          ),
        ),
      );

      expect(find.text('Home Content'), findsOneWidget);

      // Fling towards left (-350 px horizontally)
      await tester.fling(
        find.text('Home Content'),
        const Offset(-350, 0),
        1000,
      );
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 350));

      expect(navigatedRoute, '/tickets');
    });

    testWidgets('Swipe right triggers onNavigate to previous route', (
      tester,
    ) async {
      String? navigatedRoute;

      await tester.pumpWidget(
        createTestApp(
          AppSwipeNavigation(
            activeRoute: '/attendance',
            user: testUser,
            onNavigate: (route) => navigatedRoute = route,
            child: const Center(child: Text('Attendance Content')),
          ),
        ),
      );

      // Fling towards right (+350 px horizontally)
      await tester.fling(
        find.text('Attendance Content'),
        const Offset(350, 0),
        1000,
      );
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 350));

      expect(navigatedRoute, '/tickets');
    });

    testWidgets('Disabled swipe navigation does not trigger navigation', (
      tester,
    ) async {
      String? navigatedRoute;

      await tester.pumpWidget(
        createTestApp(
          AppSwipeNavigation(
            activeRoute: '/home',
            user: testUser,
            enabled: false,
            onNavigate: (route) => navigatedRoute = route,
            child: const Center(child: Text('Disabled Swipe')),
          ),
        ),
      );

      await tester.fling(
        find.text('Disabled Swipe'),
        const Offset(-350, 0),
        1000,
      );
      await tester.pumpAndSettle();

      expect(navigatedRoute, isNull);
    });

    testWidgets(
      'At boundaries, swipe beyond bounds does not trigger navigation',
      (tester) async {
        String? navigatedRoute;

        await tester.pumpWidget(
          createTestApp(
            AppSwipeNavigation(
              activeRoute: '/home',
              user: testUser,
              onNavigate: (route) => navigatedRoute = route,
              child: const Center(child: Text('First Tab')),
            ),
          ),
        );

        // Swipe right from first tab (no previous)
        await tester.fling(find.text('First Tab'), const Offset(350, 0), 1000);
        await tester.pumpAndSettle();

        expect(navigatedRoute, isNull);
      },
    );
  });

  group('AppScaffold Mobile Swipe Integration Tests', () {
    testWidgets('AppScaffold integrates swipe navigation on mobile layout', (
      tester,
    ) async {
      // Set small mobile screen size
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        MultiBlocProvider(
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
            locale: const Locale('ar'),
            theme: MaterialTheme.lightTheme,
            home: const AppScaffold(
              title: 'الرئيسية',
              currentRoute: '/home',
              user: testUser,
              showNavigation: true,
              body: Center(child: Text('Main Mobile Body')),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AppSwipeNavigation), findsOneWidget);
      expect(find.text('Main Mobile Body'), findsOneWidget);
    });
  });
}
