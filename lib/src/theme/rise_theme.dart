import 'package:flutter/material.dart';

/// Semantic tokens aligned with HeroUI v3 default theme
/// ([variables.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/themes/default/variables.css)).
///
/// sRGB values approximate OKLCH primitives from that file. Components should read
/// these via [BuildContext] ([riseTheme]) instead of ad-hoc colors.
@immutable
class RiseThemeData extends ThemeExtension<RiseThemeData> {
  const RiseThemeData({
    required this.background,
    required this.surface,
    required this.surfaceSecondary,
    required this.surfaceTertiary,
    required this.overlay,
    required this.muted,
    required this.mutedForegroundBase,
    required this.separator,
    required this.accent,
    required this.accentForeground,
    required this.accentSoftForeground,
    required this.defaultForeground,
    required this.border,
    required this.danger,
    required this.dangerForeground,
    required this.dangerSoft,
    required this.dangerSoftForeground,
    required this.disabledOpacity,
    required this.success,
    required this.successForeground,
    required this.warning,
    required this.warningForeground,
    this.accentHover,
    this.defaultHover,
    this.dangerHover,
    this.dangerSoftHover,
    this.successHover,
    this.warningHover,
  });

  /// HeroUI `--background` — page / canvas.
  final Color background;

  /// HeroUI `--surface` — cards, accordions, non-overlay shells (`bg-surface`).
  final Color surface;

  /// HeroUI `--surface-secondary`.
  final Color surfaceSecondary;

  /// HeroUI `--surface-tertiary`.
  final Color surfaceTertiary;

  /// HeroUI `--overlay` — tooltips, popovers, menus.
  final Color overlay;

  /// HeroUI `--default` — neutral fills (default button, neutral chip), not the muted *text* token.
  final Color muted;

  /// HeroUI `--muted` — secondary / placeholder text base; use [mutedForeground] with opacity.
  final Color mutedForegroundBase;

  /// HeroUI `--separator` — hairlines (distinct from [--border] in light theme).
  final Color separator;

  /// HeroUI `--accent`.
  final Color accent;

  /// HeroUI `--accent-foreground` (typically `--snow` on brand fills).
  final Color accentForeground;

  /// HeroUI `--color-accent-soft-foreground` → `var(--accent)` on soft tints.
  final Color accentSoftForeground;

  /// HeroUI `--foreground` / `--default-foreground` on canvas.
  final Color defaultForeground;

  /// HeroUI `--border`.
  final Color border;

  /// HeroUI `--danger`.
  final Color danger;

  final Color dangerForeground;

  final Color dangerSoft;

  final Color dangerSoftForeground;

  /// HeroUI `--disabled-opacity` (0.5).
  final double disabledOpacity;

  /// HeroUI `--success`; light/dark blocks (foreground is `--eclipse` in default theme).
  final Color success;

  final Color successForeground;

  /// HeroUI `--warning`.
  final Color warning;

  final Color warningForeground;

  /// `--color-accent-hover` (oklab mix) — optional override.
  final Color? accentHover;

  /// `--color-default-hover`.
  final Color? defaultHover;

  final Color? dangerHover;

  final Color? dangerSoftHover;

  final Color? successHover;

  final Color? warningHover;

  /// OKLCH-derived defaults — see repo comment block for source tokens.
  static const RiseThemeData light = RiseThemeData(
    background: Color(0xFFF5F5F5),
    surface: Color(0xFFFFFFFF),
    surfaceSecondary: Color(0xFFEFEFF0),
    surfaceTertiary: Color(0xFFEAEAEB),
    overlay: Color(0xFFFFFFFF),
    muted: Color(0xFFEBEBEC),
    mutedForegroundBase: Color(0xFF71717A),
    separator: Color(0xFFE4E4E7),
    accent: Color(0xFF0485F7),
    accentForeground: Color(0xFFFCFCFC),
    accentSoftForeground: Color(0xFF0485F7),
    defaultForeground: Color(0xFF18181B),
    border: Color(0xFFDEDEE0),
    danger: Color(0xFFFF383C),
    dangerForeground: Color(0xFFFCFCFC),
    dangerSoft: Color(0xFFFFE1E2),
    dangerSoftForeground: Color(0xFFFF383C),
    success: Color(0xFF17C964),
    successForeground: Color(0xFF18181B),
    warning: Color(0xFFF5A524),
    warningForeground: Color(0xFF18181B),
    disabledOpacity: 0.5,
    accentHover: Color(0xFF1D91F8),
    defaultHover: Color(0xFFE3E3E4),
    dangerHover: Color(0xFFFF4C4F),
    dangerSoftHover: Color(0xFFFFCDCE),
    successHover: Color(0xFF17B75D),
    warningHover: Color(0xFFDF9723),
  );

  static const RiseThemeData dark = RiseThemeData(
    background: Color(0xFF060607),
    surface: Color(0xFF18181B),
    surfaceSecondary: Color(0xFF232325),
    surfaceTertiary: Color(0xFF262728),
    overlay: Color(0xFF18181B),
    muted: Color(0xFF27272A),
    mutedForegroundBase: Color(0xFF9F9FA9),
    separator: Color(0xFF212124),
    accent: Color(0xFF0485F7),
    accentForeground: Color(0xFFFCFCFC),
    accentSoftForeground: Color(0xFF0485F7),
    defaultForeground: Color(0xFFFCFCFC),
    border: Color(0xFF28282C),
    danger: Color(0xFFDB3B3E),
    dangerForeground: Color(0xFFFCFCFC),
    dangerSoft: Color(0xFF3B1D20),
    dangerSoftForeground: Color(0xFFDB3B3E),
    success: Color(0xFF17C964),
    successForeground: Color(0xFF18181B),
    warning: Color(0xFFF7B750),
    warningForeground: Color(0xFF18181B),
    disabledOpacity: 0.5,
    accentHover: Color(0xFF1D91F8),
    defaultHover: Color(0xFF303032),
    dangerHover: Color(0xFFDE4E51),
    dangerSoftHover: Color(0xFF532023),
    successHover: Color(0xFF17B75D),
    warningHover: Color(0xFFDF9723),
  );

  Color resolveAccentHover() => accentHover ?? _darken(accent, 0.08);

  Color resolveDefaultHover() => defaultHover ?? _darken(muted, 0.06);

  Color resolveDangerHover() => dangerHover ?? _darken(danger, 0.08);

  Color resolveDangerSoftHover() => dangerSoftHover ?? _blend(dangerSoft, danger, 0.12);

  Color resolveSuccessHover() => successHover ?? _darken(success, 0.08);

  Color resolveWarningHover() => warningHover ?? _darken(warning, 0.06);

  /// HeroUI `--foreground`.
  Color get foreground => defaultForeground;

  /// Prefer [separator] for rules; [border] for outlines.
  Color get divider => separator;

  /// HeroUI `--focus` → `var(--accent)`.
  Color get focus => accent;

  /// HeroUI shared theme `separator-secondary` (surface / foreground mix).
  Color get separatorSecondary => Color.lerp(surface, defaultForeground, 0.15)!;

  /// `separator-tertiary` mix.
  Color get separatorTertiary => Color.lerp(surface, defaultForeground, 0.19)!;

  Color mutedForeground([double alpha = 0.65]) {
    return mutedForegroundBase.withValues(alpha: alpha);
  }

  static Color _darken(Color c, double amount) {
    final hsl = HSLColor.fromColor(c);
    return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
  }

  static Color _blend(Color a, Color b, double t) {
    return Color.lerp(a, b, t)!;
  }

  @override
  RiseThemeData copyWith({
    Color? background,
    Color? surface,
    Color? surfaceSecondary,
    Color? surfaceTertiary,
    Color? overlay,
    Color? muted,
    Color? mutedForegroundBase,
    Color? separator,
    Color? accent,
    Color? accentForeground,
    Color? accentSoftForeground,
    Color? defaultForeground,
    Color? border,
    Color? danger,
    Color? dangerForeground,
    Color? dangerSoft,
    Color? dangerSoftForeground,
    Color? success,
    Color? successForeground,
    Color? warning,
    Color? warningForeground,
    double? disabledOpacity,
    Color? accentHover,
    Color? defaultHover,
    Color? dangerHover,
    Color? dangerSoftHover,
    Color? successHover,
    Color? warningHover,
  }) {
    return RiseThemeData(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      surfaceTertiary: surfaceTertiary ?? this.surfaceTertiary,
      overlay: overlay ?? this.overlay,
      muted: muted ?? this.muted,
      mutedForegroundBase: mutedForegroundBase ?? this.mutedForegroundBase,
      separator: separator ?? this.separator,
      accent: accent ?? this.accent,
      accentForeground: accentForeground ?? this.accentForeground,
      accentSoftForeground: accentSoftForeground ?? this.accentSoftForeground,
      defaultForeground: defaultForeground ?? this.defaultForeground,
      border: border ?? this.border,
      danger: danger ?? this.danger,
      dangerForeground: dangerForeground ?? this.dangerForeground,
      dangerSoft: dangerSoft ?? this.dangerSoft,
      dangerSoftForeground: dangerSoftForeground ?? this.dangerSoftForeground,
      success: success ?? this.success,
      successForeground: successForeground ?? this.successForeground,
      warning: warning ?? this.warning,
      warningForeground: warningForeground ?? this.warningForeground,
      disabledOpacity: disabledOpacity ?? this.disabledOpacity,
      accentHover: accentHover ?? this.accentHover,
      defaultHover: defaultHover ?? this.defaultHover,
      dangerHover: dangerHover ?? this.dangerHover,
      dangerSoftHover: dangerSoftHover ?? this.dangerSoftHover,
      successHover: successHover ?? this.successHover,
      warningHover: warningHover ?? this.warningHover,
    );
  }

  @override
  RiseThemeData lerp(ThemeExtension<RiseThemeData>? other, double t) {
    if (other is! RiseThemeData) return this;
    return RiseThemeData(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSecondary: Color.lerp(surfaceSecondary, other.surfaceSecondary, t)!,
      surfaceTertiary: Color.lerp(surfaceTertiary, other.surfaceTertiary, t)!,
      overlay: Color.lerp(overlay, other.overlay, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      mutedForegroundBase: Color.lerp(mutedForegroundBase, other.mutedForegroundBase, t)!,
      separator: Color.lerp(separator, other.separator, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentForeground: Color.lerp(accentForeground, other.accentForeground, t)!,
      accentSoftForeground: Color.lerp(accentSoftForeground, other.accentSoftForeground, t)!,
      defaultForeground: Color.lerp(defaultForeground, other.defaultForeground, t)!,
      border: Color.lerp(border, other.border, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerForeground: Color.lerp(dangerForeground, other.dangerForeground, t)!,
      dangerSoft: Color.lerp(dangerSoft, other.dangerSoft, t)!,
      dangerSoftForeground: Color.lerp(dangerSoftForeground, other.dangerSoftForeground, t)!,
      success: Color.lerp(success, other.success, t)!,
      successForeground: Color.lerp(successForeground, other.successForeground, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningForeground: Color.lerp(warningForeground, other.warningForeground, t)!,
      disabledOpacity: disabledOpacity + (other.disabledOpacity - disabledOpacity) * t,
      accentHover: Color.lerp(accentHover, other.accentHover, t),
      defaultHover: Color.lerp(defaultHover, other.defaultHover, t),
      dangerHover: Color.lerp(dangerHover, other.dangerHover, t),
      dangerSoftHover: Color.lerp(dangerSoftHover, other.dangerSoftHover, t),
      successHover: Color.lerp(successHover, other.successHover, t),
      warningHover: Color.lerp(warningHover, other.warningHover, t),
    );
  }
}

extension RiseThemeDataX on BuildContext {
  RiseThemeData get riseTheme {
    final ext = Theme.of(this).extension<RiseThemeData>();
    final brightness = Theme.of(this).brightness;
    return ext ?? (brightness == Brightness.dark ? RiseThemeData.dark : RiseThemeData.light);
  }
}
