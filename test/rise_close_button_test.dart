import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseCloseButton taps and shows icon', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light().copyWith(extensions: const [RiseThemeData.light]),
        home: Scaffold(body: RiseCloseButton(onPressed: () => taps++)),
      ),
    );

    expect(find.byIcon(Icons.close), findsOneWidget);
    await tester.tap(find.byType(RiseCloseButton));
    expect(taps, 1);
  });
}
