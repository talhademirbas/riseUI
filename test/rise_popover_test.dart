import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RisePopover builds with trigger child', (tester) async {
    final controller = OverlayPortalController();
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(extensions: const [RiseThemeData.light]),
        home: Scaffold(
          body: RisePopover(
            controller: controller,
            overlay: const Text('Overlay'),
            child: const Text('Trigger'),
          ),
        ),
      ),
    );

    expect(find.text('Trigger'), findsOneWidget);
  });
}
