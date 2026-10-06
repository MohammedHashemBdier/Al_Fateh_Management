import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/core/contracts/base_state.dart';
import 'package:al_fateh_management/core/widgets/app_state_builder.dart';
import 'package:al_fateh_management/core/widgets/app_text.dart';

void main() {
  group('Unified Design System & Core Contracts Tests', () {
    testWidgets('AppText renders literal and styled text correctly', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppText.headline('عنوان رئيسي', isTranslated: false),
                AppText.literal('محمد هاشم بدير'),
                AppText.caption('تلميح صغير', isTranslated: false),
              ],
            ),
          ),
        ),
      );

      expect(find.text('عنوان رئيسي'), findsOneWidget);
      expect(find.text('محمد هاشم بدير'), findsOneWidget);
      expect(find.text('تلميح صغير'), findsOneWidget);
    });

    testWidgets(
      'AppStateBuilder switches cleanly between Loading and Loaded states',
      (tester) async {
        Widget buildTest(UIState<String> state) {
          return MaterialApp(
            home: Scaffold(
              body: AppStateBuilder<String>(
                state: state,
                onData: (context, data) => Text('بيانات: $data'),
              ),
            ),
          );
        }

        // 1. Loading
        await tester.pumpWidget(buildTest(const UIState.loading()));
        await tester.pump(const Duration(milliseconds: 100));
        expect(
          find.byKey(const ValueKey('state_loading_default')),
          findsOneWidget,
        );

        // 2. Loaded
        await tester.pumpWidget(
          buildTest(const UIState.loaded('تم جلب البيانات بنجاح')),
        );
        await tester.pump(const Duration(milliseconds: 350));
        await tester.pumpAndSettle();

        expect(find.text('بيانات: تم جلب البيانات بنجاح'), findsOneWidget);
      },
    );
  });
}
