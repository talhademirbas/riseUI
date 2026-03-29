import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseRadioGroup renders options and updates selection', (tester) async {
    String? value = 'a';

    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              body: RiseRadioGroup<String>(
                value: value,
                onChanged: (v) => setState(() => value = v),
                options: const [
                  RiseRadioOption(value: 'a', label: Text('A')),
                  RiseRadioOption(value: 'b', label: Text('B')),
                ],
              ),
            );
          },
        ),
      ),
    );

    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);

    await tester.tap(find.text('B'));
    await tester.pump();

    expect(value, 'b');
  });

  testWidgets('RiseRadio uses RawRadio (custom control)', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RiseRadioGroup<String>(
            value: 'x',
            onChanged: (_) {},
            options: const [
              RiseRadioOption(value: 'x', label: Text('One')),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(RawRadio<String>), findsOneWidget);
  });
}
