import 'package:flutter_test/flutter_test.dart';

import 'package:rise_ui_example/main.dart';

void main() {
  testWidgets('Example app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const RiseUiExampleApp());
    await tester.pump();

    expect(find.text('RiseUI examples'), findsOneWidget);
    expect(find.text('Button'), findsOneWidget);
  });
}
