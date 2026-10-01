import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/main.dart';

void main() {
  testWidgets('AlFatehManagementApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AlFatehManagementApp());
    expect(find.byType(AlFatehManagementApp), findsOneWidget);
  });
}
