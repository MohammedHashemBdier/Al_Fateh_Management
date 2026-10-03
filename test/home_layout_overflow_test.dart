import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:al_fateh_management/core/localization/app_localizations.dart';
import 'package:al_fateh_management/core/localization/locale_cubit.dart';
import 'package:al_fateh_management/core/theme/theme.dart';
import 'package:al_fateh_management/core/theme/theme_cubit.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:al_fateh_management/features/home/domain/models/dashboard_stats_model.dart';
import 'package:al_fateh_management/features/home/presentation/views/widgets/home_navigation_rail.dart';
import 'package:al_fateh_management/features/home/presentation/views/widgets/home_quick_actions.dart';
import 'package:al_fateh_management/features/home/presentation/views/widgets/home_recent_activity.dart';
import 'package:al_fateh_management/features/home/presentation/views/widgets/home_stats_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late UserModel testUser;
  late DashboardStatsModel testStats;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    testUser = const UserModel(
      userId: 'USR-001',
      username: 'admin',
      fullName: 'مدير النظام التنفيذي لشركة الفتح',
      department: 'MANAGEMENT',
      roleId: 'ROLE_ADMIN',
      status: 'ACTIVE',
    );

    testStats = DashboardStatsModel(
      totalTickets: 120,
      inProgressTickets: 15,
      resolvedToday: 8,
      activeEmployeesCount: 7,
      isCheckedInToday: true,
      lastSyncTime: DateTime.now(),
      recentTickets: const [
        RecentTicketItem(
          rowId: 101,
          subscriberName: 'شركة التقنية للحلول البرمجية المتطورة',
          landline: '0112233445',
          problem: 'انقطاع خدمة الإنترنت المفاجئ',
          status: 'قيد الحل',
          employee: 'محمد هاشم بدير',
          date: '2026-10-03',
        ),
      ],
    );
  });

  Widget buildTestableWidget({
    required Widget child,
    required Size screenSize,
  }) {
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
        home: MediaQuery(
          data: MediaQueryData(size: screenSize),
          child: Scaffold(body: child),
        ),
      ),
    );
  }

  group('Home Widgets Layout & Overflow Tests', () {
    testWidgets('HomeStatsGrid renders without overflow on tablet and mobile sizes', (tester) async {
      // Test mobile size
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        buildTestableWidget(
          screenSize: const Size(360, 800),
          child: SingleChildScrollView(
            child: HomeStatsGrid(stats: testStats, user: testUser),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);

      // Test tablet size
      tester.view.physicalSize = const Size(768, 1024);
      await tester.pumpWidget(
        buildTestableWidget(
          screenSize: const Size(768, 1024),
          child: SingleChildScrollView(
            child: HomeStatsGrid(stats: testStats, user: testUser),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    testWidgets('HomeNavigationRail renders without overflow in expanded and compact modes', (tester) async {
      // Compact rail (tablet/small screen)
      await tester.pumpWidget(
        buildTestableWidget(
          screenSize: const Size(768, 1024),
          child: SizedBox(
            width: 76,
            child: HomeNavigationRail(
              user: testUser,
              selectedIndex: 0,
              onDestinationSelected: (_) {},
              isExpanded: false,
              onLogout: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      // Expanded rail
      await tester.pumpWidget(
        buildTestableWidget(
          screenSize: const Size(1200, 800),
          child: SizedBox(
            width: 260,
            child: HomeNavigationRail(
              user: testUser,
              selectedIndex: 0,
              onDestinationSelected: (_) {},
              isExpanded: true,
              onLogout: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets('HomeRecentActivity & HomeQuickActions render cleanly on compact width', (tester) async {
      tester.view.physicalSize = const Size(320, 700);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        buildTestableWidget(
          screenSize: const Size(320, 700),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeQuickActions(user: testUser),
                const SizedBox(height: 20),
                HomeRecentActivity(tickets: testStats.recentTickets),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      // Verify that subscriber name and landline are found in the widget tree
      expect(find.text('شركة التقنية للحلول البرمجية المتطورة'), findsOneWidget);
      expect(find.textContaining('0112233445'), findsOneWidget);
    });
  });
}
