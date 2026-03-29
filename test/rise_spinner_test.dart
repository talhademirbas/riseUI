import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseSpinner shows loading semantics when loading', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(extensions: const [RiseThemeData.light]),
        home: const Scaffold(
          body: RiseSpinner(),
        ),
      ),
    );

    expect(find.bySemanticsLabel('Loading'), findsOneWidget);
    expect(find.byType(RiseSpinner), findsOneWidget);
  });

  testWidgets('RiseSpinner hides when isLoading is false', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(extensions: const [RiseThemeData.light]),
        home: const Scaffold(
          body: RiseSpinner(isLoading: false),
        ),
      ),
    );

    expect(find.bySemanticsLabel('Loading'), findsNothing);
  });
}
