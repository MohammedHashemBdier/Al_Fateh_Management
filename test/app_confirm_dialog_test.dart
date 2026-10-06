import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/core/widgets/app_confirm_dialog.dart';

void main() {
  testWidgets(
    'AppConfirmDialog renders title, message and responds to buttons',
    (tester) async {
      bool confirmed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppConfirmDialog(
              title: 'تحذير الحذف',
              message: 'هل تريد حذف هذا السجل نهائياً؟',
              confirmText: 'نعم، حذف',
              cancelText: 'تراجع',
              variant: ConfirmDialogVariant.danger,
              onConfirm: () {
                confirmed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('تحذير الحذف'), findsOneWidget);
      expect(find.text('هل تريد حذف هذا السجل نهائياً؟'), findsOneWidget);
      expect(find.text('نعم، حذف'), findsOneWidget);
      expect(find.text('تراجع'), findsOneWidget);

      // Tap confirm button
      await tester.tap(find.text('نعم، حذف'));
      await tester.pump();

      expect(confirmed, isTrue);
    },
  );
}
