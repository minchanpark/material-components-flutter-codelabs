import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shrine/app.dart';

void main() {
  testWidgets('opens the completed MDC-102 product grid', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ShrineApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle();

    expect(find.text('Vagabond sack'), findsOneWidget);
    expect(find.byType(Card), findsWidgets);
  });
}
