import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Tone presets aligned with HeroUI [separator.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/separator.css)
/// (`separator--default`, `separator--secondary`, `separator--tertiary`).
enum RiseSeparatorTone {
  /// `separator--default` / `bg-separator`.
  default_,

  /// `separator--secondary` / `bg-separator-secondary`.
  secondary,

  /// `separator--tertiary` / `bg-separator-tertiary`.
  tertiary,
}

/// `data-orientation` — [separator.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/separator/separator.tsx).
enum RiseSeparatorOrientation {
  /// `separator--horizontal` — `h-px w-full`.
  horizontal,

  /// `separator--vertical` — `w-px` + stretch in flex (`min-h-2` in Hero when not stretched).
  vertical,
}

/// 1px hairline with `rounded-[4px]` caps ([separator.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/separator.css) `.separator`).
///
/// **Vertical:** put inside a **height-bounded** flex child (e.g. `SizedBox(height: 48, child: Row(...))`)
/// so the line can stretch like `self-stretch`.
class RiseSeparator extends StatelessWidget {
  const RiseSeparator({
    super.key,
    this.tone = RiseSeparatorTone.default_,
    this.orientation = RiseSeparatorOrientation.horizontal,
    this.thickness = 1,
  });

  final RiseSeparatorTone tone;

  final RiseSeparatorOrientation orientation;

  /// Thickness in logical px (`h-px` / `w-px` → 1).
  final double thickness;

  static const double _radius = 4;

  static Color lineColor(BuildContext context, RiseSeparatorTone tone) {
    final rise = context.riseTheme;
    return switch (tone) {
      RiseSeparatorTone.default_ => rise.separator,
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

/// Horizontal rule with centered label (`separator__container`, `separator__line`, `separator__content`).
///
/// Gap between lines and label follows Hero `gap-3` (12px).
class RiseLabeledSeparator extends StatelessWidget {
  const RiseLabeledSeparator({
    super.key,
    required this.child,
    this.tone = RiseSeparatorTone.default_,
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
