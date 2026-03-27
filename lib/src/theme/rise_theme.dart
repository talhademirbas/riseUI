import 'package:flutter/material.dart';

/// Semantic tokens aligned with [HeroUI v3](https://www.heroui.com) CSS variables:
/// `--background`, `--foreground`, `--muted`, `--muted-foreground`, `--border`,
/// `--primary`, `--danger`, etc. Components should read these instead of ad-hoc colors.
@immutable
class RiseThemeData extends ThemeExtension<RiseThemeData> {
  const RiseThemeData({
    required this.background,
    required this.muted,
    required this.mutedForegroundBase,
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

  /// HeroUI `--background` — default page / canvas (app scaffold, sheets).
  final Color background;

  /// HeroUI `--muted` — subtle fills (secondary surfaces, chips, skeleton base).
  final Color muted;

  /// Base for HeroUI `--muted-foreground`; use [mutedForeground] with an opacity.
  final Color mutedForegroundBase;

  /// HeroUI `--primary` / brand — primary filled actions.
  final Color accent;

  /// Text/icons on [accent].
  final Color accentForeground;

  /// Secondary text on default surfaces (e.g. secondary variant label).
  final Color accentSoftForeground;

  /// HeroUI `--foreground` — primary text on [background] / [muted].
  final Color defaultForeground;

  /// HeroUI `--border` — outlines, hairlines, separators.
  final Color border;

  /// Destructive filled background.
  final Color danger;

  final Color dangerForeground;

  /// Soft danger surface.
  final Color dangerSoft;

  final Color dangerSoftForeground;

  /// Success (alerts, chips, status).
  final Color success;

  final Color successForeground;

  /// Warning (alerts, chips, status).
  final Color warning;

  final Color warningForeground;

  /// Multiplier for disabled state (HeroUI uses `opacity-disabled`).
  final double disabledOpacity;

  /// Press/hover highlight for primary (optional; falls back to darkened [accent]).
  final Color? accentHover;

  /// Hover state for neutral / muted surfaces (optional).
  final Color? defaultHover;

  final Color? dangerHover;

  final Color? dangerSoftHover;

  final Color? successHover;

  final Color? warningHover;

  static const RiseThemeData light = RiseThemeData(
    background: Color(0xFFFFFFFF),
    muted: Color(0xFFF4F4F5),
    mutedForegroundBase: Color(0xFF71717A),
    accent: Color(0xFF006FEE),
    accentForeground: Color(0xFFFFFFFF),
    accentSoftForeground: Color(0xFF006FEE),
    defaultForeground: Color(0xFF18181B),
    border: Color(0xFFE4E4E7),
    danger: Color(0xFFE11D48),
    dangerForeground: Color(0xFFFFFFFF),
    dangerSoft: Color(0xFFFFE4E6),
    dangerSoftForeground: Color(0xFFE11D48),
    success: Color(0xFF17C964),
    successForeground: Color(0xFFFFFFFF),
    warning: Color(0xFFF5A524),
    warningForeground: Color(0xFF18181B),
    disabledOpacity: 0.5,
    accentHover: Color(0xFF005BC4),
    defaultHover: Color(0xFFD4D4D8),
    dangerHover: Color(0xFFBE123C),
    dangerSoftHover: Color(0xFFFECDD3),
    successHover: Color(0xFF12A150),
    warningHover: Color(0xFFE48B16),
  );

  static const RiseThemeData dark = RiseThemeData(
    background: Color(0xFF09090B),
    muted: Color(0xFF27272A),
    mutedForegroundBase: Color(0xFFA1A1AA),
    accent: Color(0xFF006FEE),
    accentForeground: Color(0xFFFFFFFF),
    accentSoftForeground: Color(0xFF7CB8FF),
    defaultForeground: Color(0xFFFAFAFA),
    border: Color(0xFF3F3F46),
    danger: Color(0xFFF31260),
    dangerForeground: Color(0xFFFFFFFF),
    dangerSoft: Color(0xFF312038),
    dangerSoftForeground: Color(0xFFF31260),
    success: Color(0xFF17C964),
    successForeground: Color(0xFFFFFFFF),
    warning: Color(0xFFF5A524),
    warningForeground: Color(0xFF18181B),
    disabledOpacity: 0.5,
    accentHover: Color(0xFF3389FF),
    defaultHover: Color(0xFF52525B),
    dangerHover: Color(0xFFC11E4A),
    dangerSoftHover: Color(0xFF4A2040),
    successHover: Color(0xFF12A150),
    warningHover: Color(0xFFE48B16),
  );

  Color resolveAccentHover() => accentHover ?? _darken(accent, 0.08);

  Color resolveDefaultHover() => defaultHover ?? _darken(muted, 0.06);

  Color resolveDangerHover() => dangerHover ?? _darken(danger, 0.08);

  Color resolveDangerSoftHover() => dangerSoftHover ?? _blend(dangerSoft, danger, 0.12);

  Color resolveSuccessHover() => successHover ?? _darken(success, 0.08);

  Color resolveWarningHover() => warningHover ?? _darken(warning, 0.06);

  /// HeroUI `--foreground` (alias for primary text).
  Color get foreground => defaultForeground;

  /// Hairlines / dividers — same token family as [border].
  Color get divider => border;

  /// Muted secondary text (HeroUI `--muted-foreground`) — scales [mutedForegroundBase].
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
    Color? muted,
    Color? mutedForegroundBase,
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
      muted: muted ?? this.muted,
      mutedForegroundBase: mutedForegroundBase ?? this.mutedForegroundBase,
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
      muted: Color.lerp(muted, other.muted, t)!,
      mutedForegroundBase: Color.lerp(mutedForegroundBase, other.mutedForegroundBase, t)!,
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
