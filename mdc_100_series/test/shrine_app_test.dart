import 'package:flutter_test/flutter_test.dart';
import 'package:shrine/app.dart';

void main() {
  testWidgets('completes the MDC-101 login flow', (WidgetTester tester) async {
    await tester.pumpWidget(const ShrineApp());
    await tester.pumpAndSettle();

    expect(find.text('SHRINE'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle();

    expect(find.text('You did it!'), findsOneWidget);
  });
}
