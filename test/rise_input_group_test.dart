import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseInputGroup renders text suffix', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseInputGroup(
            suffix: Text('.com'),
            children: [
              RiseInput(placeholder: 'subdomain'),
            ],
          ),
        ),
      ),
    );
    expect(find.text('.com'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('RiseInputGroup renders text prefix', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseInputGroup(
            prefix: Text('https://'),
            children: [
              RiseInput(placeholder: 'host'),
            ],
          ),
        ),
      ),
    );
    expect(find.text('https://'), findsOneWidget);
  });

  testWidgets('RiseInputGroup disabled does not throw', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseInputGroup(
            enabled: false,
            prefix: Icon(Icons.lock_outline),
            children: [
              RiseInput(placeholder: 'token'),
            ],
          ),
        ),
      ),
    );
    expect(find.byType(TextField), findsOneWidget);
  });
}
