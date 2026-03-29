import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

class _SelectHarness extends StatefulWidget {
  const _SelectHarness();

  @override
  State<_SelectHarness> createState() => _SelectHarnessState();
}

class _SelectHarnessState extends State<_SelectHarness> {
  String? v;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: RiseSelect<String>(
          label: const Text('State'),
          placeholder: 'Select',
          value: v,
          items: const [
            RiseSelectItem(value: 'a', label: 'Alpha'),
            RiseSelectItem(value: 'b', label: 'Beta'),
          ],
          onChanged: (x) => setState(() => v = x),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('RiseSelect opens menu and selects value', (tester) async {
    await tester.pumpWidget(const _SelectHarness());

    await tester.tap(find.text('Select'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Beta').last);
    await tester.pumpAndSettle();

    expect(find.text('Beta'), findsWidgets);
  });

  test('RiseSelect.kMinHeight matches RiseInput', () {
    expect(RiseSelect.kMinHeight, RiseInput.kMinHeight);
  });
}
