import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/core/widgets/app_animations.dart';

void main() {
  group('AppAnimations Tests', () {
    testWidgets('AppFadeSlide renders child and animates forward', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFadeSlide(
              duration: Duration(milliseconds: 300),
              delay: Duration(milliseconds: 50),
              child: Text('Animated Child'),
            ),
          ),
        ),
      );

      // Child is rendered in widget tree
      expect(find.text('Animated Child'), findsOneWidget);

      // Advance through delay and duration
      await tester.pump(const Duration(milliseconds: 60));
      await tester.pump(const Duration(milliseconds: 350));
      await tester.pumpAndSettle();

      expect(find.text('Animated Child'), findsOneWidget);
    });

    testWidgets('AppAnimatedSwitch switches children with fade transition', (tester) async {
      Widget buildTestWidget(String label) {
        return MaterialApp(
          home: Scaffold(
            body: AppAnimatedSwitch(
              key: const ValueKey('animated_switch'),
              duration: const Duration(milliseconds: 200),
              child: Text(label, key: ValueKey(label)),
            ),
          ),
        );
      }

      await tester.pumpWidget(buildTestWidget('Initial State'));
      expect(find.text('Initial State'), findsOneWidget);

      await tester.pumpWidget(buildTestWidget('Loaded State'));
      // During transition
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      expect(find.text('Loaded State'), findsOneWidget);
    });
  });
}
