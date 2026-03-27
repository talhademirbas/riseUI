import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('single selection closes other panel when opening a new one', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: const [RiseThemeData.light],
        ),
        home: Scaffold(
          body: RiseAccordion(
            selectionMode: RiseAccordionSelectionMode.single,
            children: [
              RiseAccordionItem.panel(
                value: '1',
                title: const Text('First'),
                content: const Text('Body one'),
              ),
              RiseAccordionItem.panel(
                value: '2',
                title: const Text('Second'),
                content: const Text('Body two'),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Body one'), findsNothing);
    expect(find.text('Body two'), findsNothing);

    await tester.tap(find.text('First'));
    await tester.pumpAndSettle();
    expect(find.text('Body one'), findsOneWidget);

    await tester.tap(find.text('Second'));
    await tester.pumpAndSettle();
    expect(find.text('Body one'), findsNothing);
    expect(find.text('Body two'), findsOneWidget);
  });

  testWidgets('multiple selection keeps several panels open', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: const [RiseThemeData.light],
        ),
        home: Scaffold(
          body: RiseAccordion(
            selectionMode: RiseAccordionSelectionMode.multiple,
            children: [
              RiseAccordionItem.panel(
                value: '1',
                title: const Text('A'),
                content: const Text('Alpha'),
              ),
              RiseAccordionItem.panel(
                value: '2',
                title: const Text('B'),
                content: const Text('Beta'),
              ),
            ],
          ),
        ),
      ),
    );

    await tester.tap(find.text('A'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('B'));
    await tester.pumpAndSettle();

    expect(find.text('Alpha'), findsOneWidget);
    expect(find.text('Beta'), findsOneWidget);
  });
}
