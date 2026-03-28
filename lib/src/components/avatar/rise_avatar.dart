import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Diameter tokens aligned with HeroUI [avatar.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/avatar.css) (`size-8`, `size-10`, `size-12`).
enum RiseAvatarSize {
  sm,
  md,
  lg,
}

/// Fallback / accent coloring ([Avatar](https://heroui.com/docs/react/components/avatar) `color` prop).
enum RiseAvatarColor {
  /// HeroUI `default`.
  standard,

  accent,
  success,
  warning,
  danger,
}

/// `default` · `soft` — [avatar.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/avatar.css) `avatar--soft`.
enum RiseAvatarVariant {
  solid,
  soft,
}

/// Circular user image, initials, or custom content ([avatar.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/avatar/avatar.tsx)).
class RiseAvatar extends StatelessWidget {
  const RiseAvatar({
    super.key,
    this.image,
    this.name,
    this.child,
    this.size = RiseAvatarSize.md,
    this.color = RiseAvatarColor.standard,
    this.variant = RiseAvatarVariant.solid,
    this.backgroundColor,
    this.foregroundColor,
  }) : assert(
          image != null || name != null || child != null,
          'Provide image, name (for initials), or child',
        );

  final ImageProvider? image;

  /// Used to derive up to two initials when [image] is null and [child] is null.
  final String? name;

  final Widget? child;

  final RiseAvatarSize size;

  /// Semantic tint for initials / soft surfaces.
  final RiseAvatarColor color;

  final RiseAvatarVariant variant;

  /// Overrides resolved fallback background.
  final Color? backgroundColor;

  /// Overrides resolved fallback foreground.
  final Color? foregroundColor;

  /// Half of Hero `size-*` (e.g. md → 20px radius, 40px diameter).
  static double radius(RiseAvatarSize s) {
    return switch (s) {
      RiseAvatarSize.sm => 16,
      RiseAvatarSize.md => 20,
      RiseAvatarSize.lg => 24,
    };
  }

  static double diameter(RiseAvatarSize s) => radius(s) * 2;

  static String _firstChar(String s) => s.isEmpty ? '' : s.substring(0, 1);

  static String? initialsFromName(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    final parts = raw.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return (_firstChar(parts[0]) + _firstChar(parts[1])).toUpperCase();
    }
    final p = parts[0];
    if (p.length >= 2) return p.substring(0, 2).toUpperCase();
    return p.toUpperCase();
  }

  static (Color bg, Color fg) _fallbackColors(
    RiseThemeData rise,
    RiseAvatarColor color,
    RiseAvatarVariant variant,
  ) {
    switch (variant) {
      case RiseAvatarVariant.solid:
        return switch (color) {
          RiseAvatarColor.standard => (rise.muted, rise.defaultForeground),
          RiseAvatarColor.accent => (rise.muted, rise.accent),
          RiseAvatarColor.success => (rise.muted, rise.success),
          RiseAvatarColor.warning => (rise.muted, rise.warning),
          RiseAvatarColor.danger => (rise.muted, rise.danger),
        };
      case RiseAvatarVariant.soft:
        return switch (color) {
          RiseAvatarColor.standard => (rise.muted, rise.defaultForeground),
          RiseAvatarColor.accent => (
              rise.accent.withValues(alpha: 0.14),
              rise.accent,
            ),
          RiseAvatarColor.success => (
              rise.success.withValues(alpha: 0.14),
              rise.success,
            ),
          RiseAvatarColor.warning => (
              rise.warning.withValues(alpha: 0.18),
              rise.warningForeground,
            ),
          RiseAvatarColor.danger => (rise.dangerSoft, rise.dangerSoftForeground),
        };
    }
  }

  /// Hero [avatar.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/avatar.css):
  /// `text-sm` on fallback; `text-base` only for `.avatar--lg`.
  static double _initialFontSize(RiseAvatarSize s) {
    return switch (s) {
      RiseAvatarSize.sm => 14,
      RiseAvatarSize.md => 14,
      RiseAvatarSize.lg => 16,
    };
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final r = radius(size);
    final d = diameter(size);
    final (cBg, cFg) = _fallbackColors(rise, color, variant);
    final bg = backgroundColor ?? cBg;
    final fg = foregroundColor ?? cFg;

    late final Widget inner;
    if (child != null) {
      // Match Hero `.avatar` + `.avatar__fallback`: icon / custom slots sit on the same
      // default or soft surface as letter fallbacks (not a transparent hole).
      inner = ClipOval(
        child: Container(
          width: d,
          height: d,
          color: bg,
          alignment: Alignment.center,
          child: IconTheme.merge(
            data: IconThemeData(color: fg, size: iconSizeFor(size)),
            child: DefaultTextStyle.merge(
              style: TextStyle(
                color: fg,
                fontSize: _initialFontSize(size),
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              child: child!,
            ),
          ),
        ),
      );
    } else if (image != null) {
      inner = ClipOval(
        child: Image(
          image: image!,
          width: d,
          height: d,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _InitialsPlaceholder(
            initials: initialsFromName(name) ?? '?',
            radius: r,
            bg: bg,
            fg: fg,
            fontSize: _initialFontSize(size),
          ),
        ),
      );
    } else {
      inner = _InitialsPlaceholder(
        initials: initialsFromName(name) ?? '?',
        radius: r,
        bg: bg,
        fg: fg,
        fontSize: _initialFontSize(size),
      );
    }

    return Semantics(
      label: name ?? 'Avatar',
      child: SizedBox(width: d, height: d, child: inner),
    );
  }

  /// Centered icon size for custom [child] slots (HeroUI icon fallbacks in [avatar.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/avatar/avatar.stories.tsx)).
  static double iconSizeFor(RiseAvatarSize s) => _iconSize(s);

  static double _iconSize(RiseAvatarSize s) {
    return switch (s) {
      RiseAvatarSize.sm => 16,
      RiseAvatarSize.md => 18,
      RiseAvatarSize.lg => 20,
    };
  }
}

class _InitialsPlaceholder extends StatelessWidget {
  const _InitialsPlaceholder({
    required this.initials,
    required this.radius,
    required this.bg,
    required this.fg,
    required this.fontSize,
  });

  final String initials;
  final double radius;
  final Color bg;
  final Color fg;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: bg,
      foregroundColor: fg,
      child: Text(
        initials,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          height: 1,
        ),
      ),
    );
  }
}

/// Stacked circular avatars with ring overlap (Hero “Avatar Group”).
class RiseAvatarGroup extends StatelessWidget {
  const RiseAvatarGroup({
    super.key,
    required this.children,
    this.size = RiseAvatarSize.md,
    this.overlap = 8,
    this.ringColor,
    this.ringWidth = 2,
  });

  final List<Widget> children;

  final RiseAvatarSize size;

  /// Horizontal shift between avatars (`size - overlap`).
  final double overlap;

  /// Typically page/surface background so rings match Hero bordered stack.
  final Color? ringColor;

  final double ringWidth;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();
    final d = RiseAvatar.diameter(size);
    final ring = ringColor ?? context.riseTheme.background;
    final cell = d + ringWidth * 2;
    final step = cell - overlap;
    final w = cell + (children.length - 1) * step;

    return SizedBox(
      width: w,
      height: cell,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (var i = 0; i < children.length; i++)
            Positioned(
              left: i * step,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ring, width: ringWidth),
                ),
                child: Padding(
                  padding: EdgeInsets.all(ringWidth),
                  child: children[i],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
