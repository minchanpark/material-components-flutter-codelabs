import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shrine/app.dart';

void main() {
  testWidgets('opens the completed MDC-103 themed product layout', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ShrineApp());
    await tester.pumpAndSettle();

    final ThemeData theme = Theme.of(tester.element(find.text('SHRINE')));
    expect(theme.colorScheme.primary, const Color(0xFFFEDBD0));

    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle();

    expect(find.text('Vagabond sack'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });
}
