import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseLabel.text applies body copy and required star', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RiseLabel.text('Email', isRequired: true),
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('*'), findsOneWidget);
  });

  testWidgets('RiseLabel.text exposes merged accessibility label when required', (tester) async {
    final h = tester.ensureSemantics();
    try {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RiseLabel.text('Email', isRequired: true),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(RiseLabel)),
        matchesSemantics(label: 'Email, required'),
      );
    } finally {
      h.dispose();
    }
  });

  testWidgets('RiseLabel invalid uses danger color', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RiseLabel.text('Password', isInvalid: true),
        ),
      ),
    );

    final effective =
        DefaultTextStyle.of(tester.element(find.text('Password'))).style;
    expect(effective.color, RiseThemeData.light.danger);
  });
}
