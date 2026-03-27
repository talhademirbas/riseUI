import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Line contrast presets aligned with HeroUI [Separator](https://heroui.com/docs/react/components/separator)
/// (`separator--default` / `secondary` / `tertiary` — [separator.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/separator.css)).
enum RiseSeparatorTone {
  /// Standard contrast (`bg-separator`).
  standard,

  /// Medium contrast (`bg-separator-secondary`).
  secondary,

  /// Subtle contrast (`bg-separator-tertiary`).
  tertiary,
}

/// `data-orientation` — [separator.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/separator/separator.tsx).
enum RiseSeparatorOrientation {
  horizontal,
  vertical,
}

/// A 1px hairline divider with rounded caps (`rounded-[4px]`).
///
/// For [RiseSeparatorOrientation.vertical], place inside a **height-bounded** parent
/// (e.g. `SizedBox(height: 48, child: Row(...))`).
class RiseSeparator extends StatelessWidget {
  const RiseSeparator({
    super.key,
    this.tone = RiseSeparatorTone.standard,
    this.orientation = RiseSeparatorOrientation.horizontal,
    this.thickness = 1,
  });

  /// Foreground line contrast.
  final RiseSeparatorTone tone;

  final RiseSeparatorOrientation orientation;

  /// Line width (vertical) or height (horizontal). Hero defaults to `h-px` / `w-px`.
  final double thickness;

  static const double _radius = 4;

  static Color lineColor(BuildContext context, RiseSeparatorTone tone) {
    final rise = context.riseTheme;
    return switch (tone) {
      RiseSeparatorTone.standard => rise.separator,
      RiseSeparatorTone.secondary => rise.separatorSecondary,
      RiseSeparatorTone.tertiary => rise.separatorTertiary,
    };
  }

  @override
  Widget build(BuildContext context) {
    final c = lineColor(context, tone);
    final r = BorderRadius.circular(_radius);
    final line = orientation == RiseSeparatorOrientation.horizontal
        ? SizedBox(
            height: thickness,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(color: c, borderRadius: r),
            ),
          )
        : SizedBox(
            width: thickness,
            height: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(color: c, borderRadius: r),
            ),
          );

    return Semantics(
      label: 'Separator',
      child: line,
    );
  }
}

/// Horizontal rule with centered content (`separator__container` + `separator__content` in Hero).
///
/// Gap between lines and content follows Hero `gap-3` (12px).
class RiseLabeledSeparator extends StatelessWidget {
  const RiseLabeledSeparator({
    super.key,
    required this.child,
    this.tone = RiseSeparatorTone.standard,
    this.gap = 12,
    this.thickness = 1,
  });

  final Widget child;

  final RiseSeparatorTone tone;

  /// Space between the flex lines and [child].
  final double gap;

  final double thickness;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final labelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: rise.mutedForeground(),
          fontSize: 14,
          height: 20 / 14,
        );

    return Semantics(
      label: 'Separator',
      child: Row(
        children: [
          Expanded(
            child: RiseSeparator(tone: tone, thickness: thickness),
          ),
          SizedBox(width: gap),
          DefaultTextStyle(
            style: labelStyle ?? TextStyle(color: rise.mutedForeground(), fontSize: 14),
            textAlign: TextAlign.center,
            child: child,
          ),
          SizedBox(width: gap),
          Expanded(
            child: RiseSeparator(tone: tone, thickness: thickness),
          ),
        ],
      ),
    );
  }
}
