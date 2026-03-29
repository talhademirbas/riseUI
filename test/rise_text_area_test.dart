import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseTextArea builds TextField', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseTextArea(
            placeholder: 'Hi',
            rows: 2,
            maxLines: 4,
          ),
        ),
      ),
    );
    expect(find.byType(TextField), findsOneWidget);
  });

  test('RiseTextArea.kMinHeight matches HeroUI textarea.css min-height', () {
    expect(RiseTextArea.kMinHeight, 38);
  });
}
