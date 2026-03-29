import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseSearchField builds and clear empties text', (tester) async {
    final controller = TextEditingController(text: 'hi');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RiseSearchField(
            controller: controller,
          ),
        ),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);
    expect(controller.text, 'hi');

    await tester.tap(find.byType(IconButton));
    await tester.pump();

    expect(controller.text, '');
  });

  testWidgets('RiseSearchField min height matches RiseInput', (tester) async {
    expect(RiseSearchField.kMinHeight, RiseInput.kMinHeight);
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseSearchField(),
        ),
      ),
    );
    final constrained = tester.widget<ConstrainedBox>(
      find.descendant(
        of: find.byType(RiseSearchField),
        matching: find.byWidgetPredicate(
          (w) => w is ConstrainedBox && w.constraints.minHeight == RiseInput.kMinHeight,
        ),
      ),
    );
    expect(constrained.constraints.minHeight, RiseInput.kMinHeight);
  });
}
