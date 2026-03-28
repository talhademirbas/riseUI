import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('default variant builds and switches panels', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: const [RiseThemeData.light],
        ),
        home: Scaffold(
          body: RiseTabs(
            tabViewHeight: 120,
            tabs: const [
              Tab(text: 'One'),
              Tab(text: 'Two'),
            ],
            children: const [
              Text('Panel A'),
              Text('Panel B'),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Panel A'), findsOneWidget);
    await tester.tap(find.text('Two'));
    await tester.pumpAndSettle();
    expect(find.text('Panel B'), findsOneWidget);
  });

  testWidgets('disabled tab does not show its panel', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: const [RiseThemeData.light],
        ),
        home: Scaffold(
          body: RiseTabs(
            tabViewHeight: 120,
            tabEnabled: const [true, false, true],
            tabs: const [
              Tab(text: 'A'),
              Tab(text: 'B'),
              Tab(text: 'C'),
            ],
            children: const [
              Text('A panel'),
              Text('B panel'),
              Text('C panel'),
            ],
          ),
        ),
      ),
    );

    expect(find.text('A panel'), findsOneWidget);
    await tester.tap(find.text('B'));
    await tester.pumpAndSettle();
    expect(find.text('A panel'), findsOneWidget);
    expect(find.text('B panel'), findsNothing);
  });

  testWidgets('secondary variant builds', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: const [RiseThemeData.light],
        ),
        home: Scaffold(
          body: RiseTabs(
            variant: RiseTabsVariant.secondary,
            tabViewHeight: 100,
            tabs: const [Tab(text: 'X')],
            children: const [Text('Content')],
          ),
        ),
      ),
    );

    expect(find.text('Content'), findsOneWidget);
  });
}
