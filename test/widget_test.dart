import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/main.dart';

void main() {
  testWidgets('AlFatehApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AlFatehApp());
    expect(find.text('شركة الفتح لخدمات الإنترنت'), findsOneWidget);
  });
}
