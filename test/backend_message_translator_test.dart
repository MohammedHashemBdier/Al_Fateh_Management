import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:al_fateh_management/core/localization/app_localizations.dart';
import 'package:al_fateh_management/core/localization/backend_message_translator.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Widget buildTestWidget({
    required Locale locale,
    required Widget Function(BuildContext) builder,
  }) {
    return MaterialApp(
      locale: locale,
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Builder(builder: builder),
    );
  }

  group('BackendMessageTranslator Tests', () {
    testWidgets('Translates Arabic backend auth errors to English when locale is en',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          locale: const Locale('en'),
          builder: (context) {
            // 1. Password error
            final passMsg = BackendMessageTranslator.translate(
              context,
              'كلمة المرور غير صحيحة',
            );
            expect(passMsg, equals('Incorrect password'));

            // 2. User not found
            final userMsg = BackendMessageTranslator.translate(
              context,
              'اسم المستخدم غير موجود',
            );
            expect(userMsg, equals('Username not found'));

            // 3. Account disabled
            final disabledMsg = BackendMessageTranslator.translate(
              context,
              'تم تعطيل هذا الحساب، يرجى مراجعة إدارة الفتح',
            );
            expect(
              disabledMsg,
              equals('This account has been disabled, please contact Al-Fateh admin'),
            );

            // 4. Empty fields
            final emptyMsg = BackendMessageTranslator.translate(
              context,
              'يرجى إدخال اسم المستخدم وكلمة المرور',
            );
            expect(emptyMsg, equals('Please enter username and password'));

            return const SizedBox();
          },
        ),
      );
    });

    testWidgets('Translates English errors to Arabic when locale is ar',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          locale: const Locale('ar'),
          builder: (context) {
            final passMsg = BackendMessageTranslator.translate(
              context,
              'Incorrect password',
            );
            expect(passMsg, equals('كلمة المرور غير صحيحة'));

            final userMsg = BackendMessageTranslator.translate(
              context,
              'Username not found',
            );
            expect(userMsg, equals('اسم المستخدم غير موجود'));

            return const SizedBox();
          },
        ),
      );
    });

    testWidgets('Translates DioException network errors', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          locale: const Locale('en'),
          builder: (context) {
            final timeoutDio = DioException(
              requestOptions: RequestOptions(path: '/'),
              type: DioExceptionType.connectionTimeout,
            );
            final msg = BackendMessageTranslator.translate(context, timeoutDio);
            expect(msg, equals('Connection timed out, please try again'));

            final connErrorDio = DioException(
              requestOptions: RequestOptions(path: '/'),
              type: DioExceptionType.connectionError,
            );
            final connMsg = BackendMessageTranslator.translate(context, connErrorDio);
            expect(connMsg, contains('Unable to connect to server'));

            return const SizedBox();
          },
        ),
      );
    });

    testWidgets('Translates Tickets & Attendance backend responses', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          locale: const Locale('en'),
          builder: (context) {
            final ticketMsg = BackendMessageTranslator.translate(
              context,
              'تم تسجيل التذكرة بنجاح',
            );
            expect(ticketMsg, equals('Ticket registered successfully'));

            final geofenceMsg = BackendMessageTranslator.translate(
              context,
              'أنت خارج النطاق الجغرافي المسموح لمقر الشركة، لا يمكن تسجيل الدوام',
            );
            expect(
              geofenceMsg,
              equals('You are outside the company geofence radius, check-in blocked'),
            );

            return const SizedBox();
          },
        ),
      );
    });
  });
}
