import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Visual variant — [chip.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/chip.css)
/// (`chip--primary`, `chip--secondary`, `chip--tertiary`, `chip--soft`).
enum RiseChipVariant {
  /// Solid semantic fills for accent / success / warning / danger; default color uses default fill + fg.
  primary,

  /// Filled `--color-default` background with semantic **text** color only (Hero default story style).
  secondary,

  /// `chip--tertiary` — transparent background.
  tertiary,

  /// Soft tinted surfaces (`.chip--accent.chip--soft`, …).
  soft,
}

/// Semantic color — `chip--accent`, `chip--default`, …
enum RiseChipColor {
  accent,
  default_,
  success,
  warning,
  danger,
}

/// `chip--sm` · `chip--md` · `chip--lg`
enum RiseChipSize {
  sm,
  md,
  lg,
}

/// Inline badge — [chip.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/chip/chip.tsx),
/// [chip.styles.ts](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/src/components/chip/chip.styles.ts).
class RiseChip extends StatelessWidget {
  const RiseChip({
    super.key,
    required this.child,
    this.variant = RiseChipVariant.secondary,
    this.color = RiseChipColor.default_,
    this.size = RiseChipSize.md,
    this.onPressed,
    this.onDeleted,
    this.leading,
    this.trailing,
    this.borderRadius = 16,
  });

  final Widget child;

  final RiseChipVariant variant;

  final RiseChipColor color;

  final RiseChipSize size;

  final VoidCallback? onPressed;

  final VoidCallback? onDeleted;

  /// Optional leading icon / widget (`gap-0.5` before label).
  final Widget? leading;

  /// Optional trailing icon / widget (`gap-0.5` after label).
  final Widget? trailing;

  /// Hero `rounded-2xl` → **16** logical px ([chip.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/chip.css) `.chip`).
  final double borderRadius;

  /// Hero: `px-1 py-0` (sm), `px-2 py-0.5` (md), `px-3 py-1` (lg).
  static EdgeInsets _padding(RiseChipSize s) {
    return switch (s) {
      RiseChipSize.sm => const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      RiseChipSize.md => const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      RiseChipSize.lg => const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    };
  }

  /// `text-xs` (sm, md) · `text-sm` (lg).
  static double _fontSize(RiseChipSize s) {
    return switch (s) {
      RiseChipSize.sm => 12,
      RiseChipSize.md => 12,
      RiseChipSize.lg => 14,
    };
  }

  static double _iconSize(RiseChipSize s) {
    return switch (s) {
      RiseChipSize.sm => 12,
      RiseChipSize.md => 14,
      RiseChipSize.lg => 16,
    };
  }

  _ChipPalette _palette(RiseThemeData rise) {
    return switch (color) {
      RiseChipColor.accent => _ChipPalette(
          fgEmphasis: rise.accent,
          fgOnSoft: rise.accentSoftForeground,
          fgOnFill: rise.accentForeground,
          fill: rise.accent,
          softBg: rise.accent.withValues(alpha: 0.12),
        ),
      RiseChipColor.default_ => _ChipPalette(
          fgEmphasis: rise.defaultForeground,
          fgOnSoft: rise.defaultForeground,
          fgOnFill: rise.defaultForeground,
          fill: rise.muted,
          softBg: rise.muted,
        ),
      RiseChipColor.success => _ChipPalette(
          fgEmphasis: rise.success,
          fgOnSoft: rise.successForeground,
          fgOnFill: rise.successForeground,
          fill: rise.success,
          softBg: rise.success.withValues(alpha: 0.14),
        ),
      RiseChipColor.warning => _ChipPalette(
          fgEmphasis: rise.warningForeground,
          fgOnSoft: rise.warningForeground,
          fgOnFill: rise.warningForeground,
          fill: rise.warning,
          softBg: rise.warning.withValues(alpha: 0.2),
        ),
      RiseChipColor.danger => _ChipPalette(
          fgEmphasis: rise.danger,
          fgOnSoft: rise.dangerSoftForeground,
          fgOnFill: rise.dangerForeground,
          fill: rise.danger,
          softBg: rise.dangerSoft,
        ),
    };
  }

  ({Color bg, Color fg}) _resolve(RiseThemeData rise, _ChipPalette p) {
    final defaultBg = rise.muted;

    switch (variant) {
      case RiseChipVariant.primary:
        switch (color) {
          case RiseChipColor.default_:
            return (bg: defaultBg, fg: rise.defaultForeground);
          case RiseChipColor.accent:
            return (bg: p.fill, fg: p.fgOnFill);
          case RiseChipColor.success:
            return (bg: p.fill, fg: p.fgOnFill);
          case RiseChipColor.warning:
            return (bg: p.fill, fg: p.fgOnFill);
          case RiseChipColor.danger:
            return (bg: p.fill, fg: p.fgOnFill);
        }
      case RiseChipVariant.secondary:
        return (bg: defaultBg, fg: p.fgEmphasis);
      case RiseChipVariant.tertiary:
        return (bg: Colors.transparent, fg: p.fgEmphasis);
      case RiseChipVariant.soft:
        switch (color) {
          case RiseChipColor.default_:
            return (bg: defaultBg, fg: rise.defaultForeground);
          case RiseChipColor.accent:
            return (bg: p.softBg, fg: p.fgOnSoft);
          case RiseChipColor.success:
            return (bg: p.softBg, fg: p.fgOnSoft);
          case RiseChipColor.warning:
            return (bg: p.softBg, fg: p.fgOnSoft);
          case RiseChipColor.danger:
            return (bg: p.softBg, fg: p.fgOnSoft);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final p = _palette(rise);
    final resolved = _resolve(rise, p);
    final pad = _padding(size);
    final fs = _fontSize(size);
    final iconSz = _iconSize(size);
    final lh = fs <= 12 ? 20 / 12 : 20 / 14;

    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: fs,
          fontWeight: FontWeight.w500,
          color: resolved.fg,
          height: lh,
        ) ??
        TextStyle(
          fontSize: fs,
          fontWeight: FontWeight.w500,
          color: resolved.fg,
          height: lh,
        );

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          IconTheme.merge(
            data: IconThemeData(size: iconSz, color: resolved.fg),
            child: leading!,
          ),
          const SizedBox(width: 2),
        ],
        DefaultTextStyle.merge(
          style: textStyle,
          child: child,
        ),
        if (trailing != null) ...[
          const SizedBox(width: 2),
          IconTheme.merge(
            data: IconThemeData(size: iconSz, color: resolved.fg),
            child: trailing!,
          ),
        ],
        if (onDeleted != null) ...[
          const SizedBox(width: 4),
          InkWell(
            onTap: onDeleted,
            customBorder: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Icon(Icons.close, size: iconSz, color: resolved.fg),
            ),
          ),
        ],
      ],
    );

    content = Padding(padding: pad, child: content);

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: BorderSide.none,
    );

    final material = Material(
      color: resolved.bg,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: onPressed != null
          ? InkWell(onTap: onPressed, child: content)
          : content,
    );

    return material;
  }
}

class _ChipPalette {
  const _ChipPalette({
    required this.fgEmphasis,
    required this.fgOnSoft,
    required this.fgOnFill,
    required this.fill,
    required this.softBg,
  });

  final Color fgEmphasis;
  final Color fgOnSoft;
  final Color fgOnFill;
  final Color fill;
  final Color softBg;
}
