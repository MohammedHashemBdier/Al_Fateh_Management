import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/core/localization/app_localizations.dart';
import 'package:al_fateh_management/core/theme/theme.dart';
import 'package:al_fateh_management/features/attendance/domain/enums/attendance_enums.dart';
import 'package:al_fateh_management/features/attendance/domain/models/attendance_record.dart';
import 'package:al_fateh_management/features/attendance/domain/models/shift.dart';
import 'package:al_fateh_management/features/attendance/domain/models/today_status.dart';
import 'package:al_fateh_management/features/attendance/presentation/views/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Widget wrapWithThemeAndLocale(Widget child) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar'), Locale('en')],
      locale: const Locale('ar'),
      theme: MaterialTheme.lightTheme,
      home: Scaffold(body: child),
    );
  }

  group('Field Test - Attendance Presentation Widgets', () {
    testWidgets('AttendanceStatusCard displays today status correctly', (
      tester,
    ) async {
      const todayStatus = TodayStatus(
        hasCheckedIn: true,
        hasCheckedOut: false,
        checkInTime: '08:30:00',
        status: AttendanceStatus.present,
      );

      await tester.pumpWidget(
        wrapWithThemeAndLocale(
          const AttendanceStatusCard(todayStatus: todayStatus),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AttendanceStatusCard), findsOneWidget);
      expect(find.text('08:30:00'), findsOneWidget);
    });

    testWidgets('TodaySummaryCard renders shift hours and metrics', (
      tester,
    ) async {
      const todayStatus = TodayStatus(
        hasCheckedIn: true,
        hasCheckedOut: true,
        checkInTime: '08:00',
        checkOutTime: '16:00',
      );

      const shift = Shift(
        shiftId: 'SH-MORNING',
        shiftName: 'الوردية الصباحية',
        startTime: '08:00',
        endTime: '16:00',
        standardHours: 8.0,
        gracePeriodMins: 15,
      );

      await tester.pumpWidget(
        wrapWithThemeAndLocale(
          const TodaySummaryCard(todayStatus: todayStatus, currentShift: shift),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TodaySummaryCard), findsOneWidget);
      expect(find.text('الوردية الصباحية'), findsOneWidget);
      expect(find.text('08:00 - 16:00'), findsOneWidget);
    });

    testWidgets('GpsStatusIndicator and MockLocationWarning render cleanly', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrapWithThemeAndLocale(
          const Column(
            children: [
              GpsStatusIndicator(
                isGpsDisabled: false,
                isPermissionDenied: false,
                isPermissionDeniedForever: false,
                accuracyMeters: 12.5,
              ),
              MockLocationWarning(),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GpsStatusIndicator), findsOneWidget);
      expect(find.byType(MockLocationWarning), findsOneWidget);
    });

    testWidgets('AttendanceRecordTable renders rows with click callback', (
      tester,
    ) async {
      final records = [
        const AttendanceRecord(
          id: 'ATT-20261001-USR-002',
          userId: 'USR-002',
          date: '2026-10-01',
          checkInTime: '08:02',
          checkOutTime: '16:05',
          actualHours: 8.0,
          status: AttendanceStatus.present,
        ),
      ];

      AttendanceRecord? clicked;

      await tester.pumpWidget(
        wrapWithThemeAndLocale(
          AttendanceRecordTable(
            records: records,
            onRowTap: (rec) => clicked = rec,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AttendanceRecordTable), findsOneWidget);
      expect(find.text('2026-10-01'), findsOneWidget);

      await tester.tap(find.text('2026-10-01'));
      await tester.pumpAndSettle();
      expect(clicked?.id, 'ATT-20261001-USR-002');
    });

    testWidgets('ShiftCard renders shift information and action buttons', (
      tester,
    ) async {
      const shift = Shift(
        shiftId: 'SH-01',
        shiftName: 'دوام المساء',
        startTime: '16:00',
        endTime: '00:00',
        standardHours: 8.0,
        gracePeriodMins: 15,
      );

      bool editTapped = false;
      bool deleteTapped = false;

      await tester.pumpWidget(
        wrapWithThemeAndLocale(
          ShiftCard(
            shift: shift,
            onEdit: () => editTapped = true,
            onDelete: () => deleteTapped = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('دوام المساء'), findsOneWidget);
      expect(find.text('16:00 - 00:00'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.edit_outlined));
      await tester.pumpAndSettle();
      expect(editTapped, isTrue);

      await tester.tap(find.byIcon(Icons.delete_outline_rounded));
      await tester.pumpAndSettle();
      expect(deleteTapped, isTrue);
    });
  });
}
