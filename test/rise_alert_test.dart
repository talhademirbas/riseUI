import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseAlert renders title and uses surface + shadow', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(extensions: const [RiseThemeData.light]),
        home: const Scaffold(
          body: RiseAlert(
            title: Text('Hello'),
            description: Text('Details'),
          ),
        ),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('Details'), findsOneWidget);
    expect(find.byType(RiseSurface), findsOneWidget);
  });

  testWidgets('RiseAlert shows close when onClose is set', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(extensions: const [RiseThemeData.light]),
        home: Scaffold(
          body: RiseAlert(
            title: const Text('T'),
            onClose: () {},
          ),
        ),
      ),
    );

    expect(find.byType(RiseCloseButton), findsOneWidget);
  });

  testWidgets('RiseAlert omits close when onClose is null', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(extensions: const [RiseThemeData.light]),
        home: const Scaffold(
          body: RiseAlert(
            title: Text('T'),
          ),
        ),
      ),
    );

    expect(find.byType(RiseCloseButton), findsNothing);
  });
}
