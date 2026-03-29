import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseInputOtp renders and exposes semantics', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseInputOtp(length: 4),
        ),
      ),
    );

    expect(find.byType(RiseInputOtp), findsOneWidget);
    expect(find.bySemanticsLabel('One-time code entry'), findsOneWidget);
  });

  testWidgets('RiseInputOtpSeparator draws separator token color', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RiseInputOtpSeparator(),
        ),
      ),
    );

    expect(find.byType(RiseInputOtpSeparator), findsOneWidget);
    expect(find.byType(Container), findsWidgets);
  });
}
