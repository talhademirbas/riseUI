import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseButton renders label and handles tap', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light().copyWith(extensions: const [RiseThemeData.light]),
        home: Scaffold(
          body: Center(
            child: RiseButton(
              label: 'Continue',
              onPressed: () => taps++,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Continue'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    expect(taps, 1);
  });

  testWidgets('RiseButton is disabled when isDisabled is true', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light().copyWith(extensions: const [RiseThemeData.light]),
        home: Scaffold(
          body: RiseButton(
            label: 'No',
            isDisabled: true,
            onPressed: () => taps++,
          ),
        ),
      ),
    );

    await tester.tap(find.text('No'));
    expect(taps, 0);
  });
}
