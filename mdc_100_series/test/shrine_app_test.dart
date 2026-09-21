import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shrine/app.dart';

void main() {
  testWidgets('completes the primary Shrine codelab journey', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ShrineApp());
    await tester.pumpAndSettle();

    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextField, 'Username'),
      'shopper',
    );
    await tester.enterText(
      find.widgetWithText(TextField, 'Password'),
      'secret',
    );
    await tester.tap(find.text('CANCEL'));
    await tester.pump();

    expect(
      tester
          .widget<TextField>(find.widgetWithText(TextField, 'Username'))
          .controller!
          .text,
      isEmpty,
    );
    expect(
      tester
          .widget<TextField>(find.widgetWithText(TextField, 'Password'))
          .controller!
          .text,
      isEmpty,
    );

    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle();

    expect(find.text('Vagabond sack'), findsOneWidget);

    await tester.tap(find.byTooltip('Toggle menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('CLOTHING'));
    await tester.pumpAndSettle();

    expect(find.text('Clay sweater'), findsOneWidget);
    expect(find.text('Vagabond sack'), findsNothing);
  });
}
