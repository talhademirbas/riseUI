import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Visual variant (HeroUI chip variants).
enum RiseChipVariant {
  /// Filled with semantic color.
  primary,

  /// Outlined border.
  secondary,

  /// Text-only / minimal.
  tertiary,

  /// Soft tinted background.
  soft,
}

/// Semantic color (HeroUI chip colors).
enum RiseChipColor {
  accent,
  default_,
  success,
  warning,
  danger,
}

enum RiseChipSize {
  sm,
  md,
  lg,
}

/// Compact label or removable tag — [HeroUI Chip (web)](https://heroui.com/docs/react/components/chip),
/// [Native](https://heroui.com/docs/native/components/chip).
class RiseChip extends StatelessWidget {
  const RiseChip({
    super.key,
    required this.child,
    this.variant = RiseChipVariant.soft,
    this.color = RiseChipColor.default_,
    this.size = RiseChipSize.md,
    this.onPressed,
    this.onDeleted,
    this.leading,
    this.borderRadius = 999,
  });

  final Widget child;

  final RiseChipVariant variant;

  final RiseChipColor color;

  final RiseChipSize size;

  final VoidCallback? onPressed;

  final VoidCallback? onDeleted;

  final Widget? leading;

  final double borderRadius;

  static EdgeInsets _padding(RiseChipSize s) {
    return switch (s) {
      RiseChipSize.sm => const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      RiseChipSize.md => const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      RiseChipSize.lg => const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    };
  }

  static double _fontSize(RiseChipSize s) {
    return switch (s) {
      RiseChipSize.sm => 12,
      RiseChipSize.md => 13,
      RiseChipSize.lg => 14,
    };
  }

  static double _iconSize(RiseChipSize s) {
    return switch (s) {
      RiseChipSize.sm => 14,
      RiseChipSize.md => 16,
      RiseChipSize.lg => 18,
    };
  }

  _ChipPalette _palette(BuildContext context) {
    final rise = context.riseTheme;
    // HeroUI chip.css: `--chip-bg/--chip-fg` per color; soft rows use *-soft / *-soft-foreground
    // (accentSoftForeground, dangerSoftForeground, tinted fills — not only raw alpha).
    return switch (color) {
      RiseChipColor.accent => _ChipPalette(
          fgEmphasis: rise.accent,
          fgOnSoft: rise.accentSoftForeground,
          fgOnFill: rise.accentForeground,
          fill: rise.accent,
          soft: rise.accent.withValues(alpha: 0.12),
          border: rise.accent,
        ),
      RiseChipColor.default_ => _ChipPalette(
          fgEmphasis: rise.defaultForeground,
          fgOnSoft: rise.defaultForeground,
          fgOnFill: rise.defaultForeground,
          fill: rise.muted,
          soft: rise.muted,
          border: rise.border,
        ),
      RiseChipColor.success => _ChipPalette(
          fgEmphasis: rise.success,
          fgOnSoft: rise.success,
          fgOnFill: rise.successForeground,
          fill: rise.success,
          soft: rise.success.withValues(alpha: 0.14),
          border: rise.success,
        ),
      RiseChipColor.warning => _ChipPalette(
          fgEmphasis: rise.warningForeground,
          fgOnSoft: rise.warningForeground,
          fgOnFill: rise.warningForeground,
          fill: rise.warning,
          soft: rise.warning.withValues(alpha: 0.2),
          border: rise.warning,
        ),
      RiseChipColor.danger => _ChipPalette(
          fgEmphasis: rise.danger,
          fgOnSoft: rise.dangerSoftForeground,
          fgOnFill: rise.dangerForeground,
          fill: rise.danger,
          soft: rise.dangerSoft,
          border: rise.danger,
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final p = _palette(context);
    final pad = _padding(size);
    final fs = _fontSize(size);
    final iconSz = _iconSize(size);

    final Color bg;
    final Color fg;
    final Color? borderColor;
    switch (variant) {
      case RiseChipVariant.primary:
        bg = p.fill;
        fg = p.fgOnFill;
        borderColor = null;
      case RiseChipVariant.secondary:
        bg = Colors.transparent;
        fg = p.fgEmphasis;
        borderColor = p.border;
      case RiseChipVariant.tertiary:
        bg = Colors.transparent;
        fg = p.fgEmphasis;
        borderColor = null;
      case RiseChipVariant.soft:
        bg = p.soft;
        fg = p.fgOnSoft;
        borderColor = null;
    }

    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelLarge?.copyWith(
          fontSize: fs,
          fontWeight: FontWeight.w500,
          color: fg,
          height: 1.2,
        ) ??
        TextStyle(fontSize: fs, fontWeight: FontWeight.w500, color: fg, height: 1.2);

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          IconTheme.merge(
            data: IconThemeData(size: iconSz, color: fg),
            child: leading!,
          ),
          const SizedBox(width: 6),
        ],
        Flexible(
          child: DefaultTextStyle.merge(
            style: textStyle,
            child: child,
          ),
        ),
        if (onDeleted != null) ...[
          const SizedBox(width: 4),
          InkWell(
            onTap: onDeleted,
            customBorder: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Icon(Icons.close, size: iconSz, color: fg),
            ),
          ),
        ],
      ],
    );

    content = Padding(padding: pad, child: content);

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: borderColor != null
          ? BorderSide(color: borderColor)
          : BorderSide.none,
    );

    if (onPressed != null) {
      content = Material(
        color: bg,
        shape: shape,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: content,
        ),
      );
    } else {
      content = Material(
        color: bg,
        shape: shape,
        clipBehavior: Clip.antiAlias,
        child: content,
      );
    }

    return content;
  }
}

class _ChipPalette {
  const _ChipPalette({
    required this.fgEmphasis,
    required this.fgOnSoft,
    required this.fgOnFill,
    required this.fill,
    required this.soft,
    required this.border,
  });

  /// Foreground for secondary / tertiary (outlined or ghost) — strong token.
  final Color fgEmphasis;

  /// Foreground on soft tinted background (HeroUI `*-soft-foreground`).
  final Color fgOnSoft;

  /// Foreground on solid primary fill.
  final Color fgOnFill;

  final Color fill;
  final Color soft;
  final Color border;
}
