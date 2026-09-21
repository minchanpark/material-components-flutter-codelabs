import 'package:flutter_test/flutter_test.dart';
import 'package:shrine/app.dart';

void main() {
  testWidgets('shows the MDC-101 starter login page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ShrineApp());
    await tester.pumpAndSettle();

    expect(find.text('SHRINE'), findsOneWidget);
    expect(find.text('Username'), findsNothing);
    expect(find.text('NEXT'), findsNothing);
  });
}
