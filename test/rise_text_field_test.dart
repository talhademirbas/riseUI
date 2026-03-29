import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseTextField composes label and RiseInput', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseTextField(
            labelText: 'Your name',
            placeholder: 'Ada',
          ),
        ),
      ),
    );
    expect(find.text('Your name'), findsOneWidget);
    expect(find.byType(RiseInput), findsOneWidget);
  });

  testWidgets('RiseTextField multiline uses RiseTextArea', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseTextField(
            labelText: 'Bio',
            minLines: 3,
            maxLines: 6,
            placeholder: 'Hello',
          ),
        ),
      ),
    );
    expect(find.byType(RiseTextArea), findsOneWidget);
  });

  testWidgets('RiseTextField hides helper when invalid', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseTextField(
            labelText: 'Field',
            helperText: 'Helper',
            isInvalid: true,
          ),
        ),
      ),
    );
    expect(find.text('Helper'), findsNothing);
  });
}
