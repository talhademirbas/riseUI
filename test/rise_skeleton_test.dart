import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rise_ui/rise_ui.dart';

void main() {
  testWidgets('RiseSkeleton paints surface-tertiary base', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(extensions: const [RiseThemeData.light]),
        home: const Scaffold(
          body: RiseSkeleton(
            width: 40,
            height: 12,
            animationType: RiseSkeletonAnimation.none,
          ),
        ),
      ),
    );

    final expected = RiseThemeData.light.surfaceTertiary.withValues(alpha: 0.7);
    final sk = find.byType(RiseSkeleton);
    final box = tester.widget<ColoredBox>(
      find.descendant(of: sk, matching: find.byType(ColoredBox)),
    );
    expect(box.color, expected);
  });

  testWidgets('RiseSkeletonSyncShimmer provides shared controller to descendants', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(extensions: const [RiseThemeData.light]),
        home: Scaffold(
          body: RiseSkeletonSyncShimmer(
            child: Row(
              children: const [
                Expanded(
                  child: RiseSkeleton(
                    animationType: RiseSkeletonAnimation.shimmer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.byType(RiseSkeleton), findsOneWidget);
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
