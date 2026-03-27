import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';
import '../button_group/rise_button_group.dart';

/// Visual style variants (HeroUI `ButtonVariant`).
enum RiseButtonVariant {
  primary,
  secondary,
  tertiary,
  outline,
  ghost,
  danger,
  dangerSoft,
}

/// Layout sizes — heights aligned with [HeroUI button.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/button.css)
/// (`button--sm` / default / `button--lg`: 32px / 40px / 44px).
enum RiseButtonSize {
  sm,
  md,
  lg,
}

/// Press feedback mode (HeroUI `ButtonFeedbackVariant`).
enum RiseButtonFeedback {
  /// Subtle scale + translucent highlight overlay (default).
  scaleHighlight,

  /// Subtle scale + ink ripple.
  scaleRipple,

  /// Scale only (no overlay / ripple layer).
  scale,

  /// No press motion or overlay.
  none,
}

/// Fine-grained animation toggles (HeroUI `animation` prop).
///
/// Set [disableAll] to fully disable feedback. Individual flags override the
/// defaults implied by [RiseButton.feedback].
@immutable
class RiseButtonAnimation {
  const RiseButtonAnimation({
    this.disableAll = false,
    this.scale,
    this.highlight,
    this.ripple,
  });

  /// Disables scale, highlight, and ripple regardless of [RiseButton.feedback].
  final bool disableAll;

  /// `false` turns off scale; `null` uses [RiseButton.feedback] defaults.
  final bool? scale;

  final bool? highlight;

  final bool? ripple;

  static const RiseButtonAnimation disabled = RiseButtonAnimation(disableAll: true);
}

/// Inherited scope for [RiseButtonLabel] and custom children.
@immutable
class RiseButtonScope extends InheritedWidget {
  const RiseButtonScope({
    super.key,
    required this.variant,
    required this.size,
    required this.isDisabled,
    required this.borderRadius,
    required super.child,
  });

  final RiseButtonVariant variant;
  final RiseButtonSize size;
  final bool isDisabled;

  /// Corner radius for labels/overlays (matches HeroUI `rounded-3xl` / `rounded-4xl`).
  final double borderRadius;

  static RiseButtonScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RiseButtonScope>();
  }

  static RiseButtonScope of(BuildContext context) {
    final scope = maybeOf(context);
    assert(scope != null, 'RiseButtonScope not found');
    return scope!;
  }

  @override
  bool updateShouldNotify(RiseButtonScope oldWidget) {
    return variant != oldWidget.variant ||
        size != oldWidget.size ||
        isDisabled != oldWidget.isDisabled ||
        borderRadius != oldWidget.borderRadius;
  }
}

/// HeroUI-style button with variants, sizes, and press feedback.
///
/// Use [RiseButtonLabel] for text that should follow variant typography, or
/// pass any [child] for fully custom content (icons, rows, etc.).
class RiseButton extends StatefulWidget {
  const RiseButton({
    super.key,
    required this.onPressed,
    this.variant = RiseButtonVariant.primary,
    this.size = RiseButtonSize.md,
    this.feedback = RiseButtonFeedback.scaleHighlight,
    this.animation,
    this.isIconOnly = false,
    this.fullWidth = false,
    this.isDisabled = false,
    /// When `true`, stays enabled while the parent [RiseButtonGroup] has `isDisabled` set.
    this.allowEnabledWhenGroupDisabled = false,
    this.autofocus = false,
    this.focusNode,
    this.child,
    this.label,
  }) : assert(child != null || label != null, 'Provide child or label');

  final VoidCallback? onPressed;

  final RiseButtonVariant variant;

  final RiseButtonSize size;

  /// Fills cross-axis width (HeroUI `fullWidth` / `.button--full-width`).
  final bool fullWidth;

  /// Selects overlay vs ripple vs scale-only feedback.
  final RiseButtonFeedback feedback;

  /// Optional overrides; see [RiseButtonAnimation].
  final RiseButtonAnimation? animation;

  /// Square icon buttons (HeroUI `isIconOnly`).
  final bool isIconOnly;

  final bool isDisabled;

  /// See [RiseButton.allowEnabledWhenGroupDisabled] on the constructor.
  final bool allowEnabledWhenGroupDisabled;

  final bool autofocus;

  final FocusNode? focusNode;

  /// Main content. If you only need text, prefer [label].
  final Widget? child;

  /// Convenience string label; wrapped in [RiseButton.label] styling.
  final String? label;

  @override
  State<RiseButton> createState() => _RiseButtonState();
}

/// Text label that inherits [RiseButton] variant, size, and disabled state
/// (HeroUI `Button.Label`).
class RiseButtonLabel extends StatelessWidget {
  const RiseButtonLabel(
    this.data, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String data;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final scope = RiseButtonScope.of(context);
    final theme = context.riseTheme;
    final colors = _RiseButtonColors.resolve(theme, scope.variant);
    final style = _labelTextStyle(context, scope.size, colors.foreground).copyWith(
      color: scope.isDisabled ? colors.foreground.withValues(alpha: 0.6) : null,
    );
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style,
    );
  }
}

class _RiseButtonState extends State<RiseButton> with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool _pressed = false;

  /// HeroUI `button.css` active scale: default **0.97**, sm **0.98**, lg **0.96**.
  double get _pressedScaleEnd {
    switch (widget.size) {
      case RiseButtonSize.sm:
        return 0.98;
      case RiseButtonSize.md:
        return 0.97;
      case RiseButtonSize.lg:
        return 0.96;
    }
  }

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 250),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: _pressedScaleEnd).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutCubic, reverseCurve: Curves.easeOutCubic),
    );
  }

  @override
  void didUpdateWidget(RiseButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.size != widget.size) {
      _scaleAnimation = Tween<double>(begin: 1.0, end: _pressedScaleEnd).animate(
        CurvedAnimation(parent: _scaleController, curve: Curves.easeOutCubic, reverseCurve: Curves.easeOutCubic),
      );
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  RiseButtonAnimation get _anim => widget.animation ?? const RiseButtonAnimation();

  bool get _animationsDisabled {
    final a = _anim;
    if (a.disableAll) return true;
    return false;
  }

  bool _useScale({RiseButtonGroupSlotData? groupSlot}) {
    if (groupSlot != null) return false;
    if (_animationsDisabled || widget.feedback == RiseButtonFeedback.none) return false;
    if (_anim.scale == false) return false;
    return true;
  }

  bool get _useHighlight {
    if (_animationsDisabled) return false;
    if (widget.feedback != RiseButtonFeedback.scaleHighlight) return false;
    if (_anim.highlight == false) return false;
    return true;
  }

  bool get _useRipple {
    if (_animationsDisabled) return false;
    if (widget.feedback != RiseButtonFeedback.scaleRipple) return false;
    if (_anim.ripple == false) return false;
    return true;
  }

  void _setPressed(bool value) {
    final slot = RiseButtonGroupSlotData.maybeOf(context);
    if (_computeDisabled(slot) || !_useScale(groupSlot: slot)) return;
    if (_pressed == value) return;
    setState(() => _pressed = value);
    if (value) {
      _scaleController.forward();
    } else {
      _scaleController.reverse();
    }
  }

  bool _computeDisabled(RiseButtonGroupSlotData? slot) {
    if (widget.onPressed == null) return true;
    if (widget.isDisabled) return true;
    if (slot?.groupDisabled == true && !widget.allowEnabledWhenGroupDisabled) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.riseTheme;
    final slot = RiseButtonGroupSlotData.maybeOf(context);
    final variant = slot?.variant ?? widget.variant;
    final size = slot?.size ?? widget.size;
    final metrics = _RiseButtonMetrics.resolve(size, widget.isIconOnly);
    final colors = _RiseButtonColors.resolve(theme, variant);
    final labelStyle = _labelTextStyle(context, size, colors.foreground);

    final effectiveDisabled = _computeDisabled(slot);
    final r = metrics.borderRadius;
    final shapeRadius = slot == null ? BorderRadius.circular(r) : _riseGroupButtonRadius(slot, r);
    final scopeRadius = shapeRadius == BorderRadius.zero ? 0.0 : r;

    Widget child = _buildChild(labelStyle);

    // Use [Align] with width/height factors so the hit target hugs content when not
    // [fullWidth]. Plain [Center] expands to max width and mimics stretched buttons.
    child = SizedBox(
      height: metrics.height,
      child: Align(
        alignment: Alignment.center,
        widthFactor: widget.fullWidth ? null : 1.0,
        heightFactor: widget.fullWidth ? null : 1.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: metrics.horizontalPadding),
          child: child,
        ),
      ),
    );

    child = RiseButtonScope(
      variant: variant,
      size: size,
      isDisabled: effectiveDisabled,
      borderRadius: scopeRadius,
      child: IconTheme.merge(
        data: IconThemeData(size: metrics.iconSize, color: colors.foreground),
        child: DefaultTextStyle.merge(
          style: labelStyle,
          child: child,
        ),
      ),
    );

    final inkShape = RoundedRectangleBorder(borderRadius: shapeRadius);
    final groupedOutline = slot != null && variant == RiseButtonVariant.outline;

    Widget body = _useRipple
        ? _RippleButtonBody(
            onPressed: effectiveDisabled ? null : widget.onPressed,
            highlightColor: colors.highlight.withValues(alpha: 0.35),
            splashColor: colors.highlight.withValues(alpha: 0.45),
            onHighlightChanged: (v) {
              if (_useScale(groupSlot: slot)) {
                _setPressed(v);
              }
            },
            child: child,
          )
        : _HighlightButtonBody(
            pressed: _pressed && _useHighlight,
            highlight: colors.highlight,
            enabled: _useHighlight,
            borderRadius: shapeRadius,
            child: InkWell(
              onTap: effectiveDisabled ? null : widget.onPressed,
              onHighlightChanged: (v) {
                if (_useScale(groupSlot: slot)) {
                  _setPressed(v);
                }
              },
              customBorder: inkShape,
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: child,
            ),
          );

    Widget decorated;
    if (groupedOutline) {
      decorated = DecoratedBox(
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: shapeRadius,
          border: _riseGroupOutlineBorder(slot, theme.border),
        ),
        child: Material(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          child: body,
        ),
      );
    } else {
      decorated = Material(
        color: colors.background,
        shape: RoundedRectangleBorder(
          borderRadius: shapeRadius,
          side: colors.borderSide,
        ),
        clipBehavior: Clip.antiAlias,
        child: body,
      );
    }

    final scaleOn = _useScale(groupSlot: slot);
    decorated = AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        final scale = scaleOn ? _scaleAnimation.value : 1.0;
        return Transform.scale(scale: scale, alignment: Alignment.center, child: child);
      },
      child: decorated,
    );

    if (effectiveDisabled) {
      decorated = Opacity(opacity: theme.disabledOpacity, child: decorated);
    }

    final fullWidth = widget.fullWidth || (slot?.groupFullWidth == true);
    final w = fullWidth
        ? double.infinity
        : (widget.isIconOnly ? metrics.height : null);

    return MergeSemantics(
      child: Semantics(
        button: true,
        enabled: !effectiveDisabled,
        child: Focus(
          autofocus: widget.autofocus,
          focusNode: widget.focusNode,
          child: SizedBox(
            width: w,
            child: decorated,
          ),
        ),
      ),
    );
  }

  Widget _buildChild(TextStyle labelStyle) {
    if (widget.child != null) return widget.child!;
    return Text(widget.label!, style: labelStyle, textAlign: TextAlign.center);
  }
}

TextStyle _labelTextStyle(BuildContext context, RiseButtonSize size, Color color) {
  final base = Theme.of(context).textTheme.labelLarge ?? const TextStyle();
  final double fontSize;
  final double height;
  switch (size) {
    case RiseButtonSize.sm:
    case RiseButtonSize.md:
      fontSize = 14;
      height = 1.25;
      break;
    case RiseButtonSize.lg:
      fontSize = 16;
      height = 1.25;
      break;
  }
  return base.copyWith(
    fontSize: fontSize,
    height: height,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

class _RiseButtonMetrics {
  const _RiseButtonMetrics({
    required this.height,
    required this.horizontalPadding,
    required this.gap,
    required this.borderRadius,
    required this.iconSize,
  });

  final double height;
  final double horizontalPadding;
  final double gap;
  final double borderRadius;
  final double iconSize;

  static _RiseButtonMetrics resolve(RiseButtonSize size, bool iconOnly) {
    switch (size) {
      case RiseButtonSize.sm:
        return _RiseButtonMetrics(
          height: 32,
          horizontalPadding: iconOnly ? 0 : 12,
          gap: 8,
          borderRadius: 24,
          iconSize: 16,
        );
      case RiseButtonSize.md:
        return _RiseButtonMetrics(
          height: 40,
          horizontalPadding: iconOnly ? 0 : 16,
          gap: 8,
          borderRadius: 24,
          iconSize: 20,
        );
      case RiseButtonSize.lg:
        return _RiseButtonMetrics(
          height: 44,
          horizontalPadding: iconOnly ? 0 : 16,
          gap: 8,
          borderRadius: 24,
          iconSize: 20,
        );
    }
  }
}

class _RiseButtonColors {
  const _RiseButtonColors({
    required this.background,
    required this.foreground,
    required this.highlight,
    this.borderSide = BorderSide.none,
  });

  final Color background;
  final Color foreground;
  final Color highlight;
  final BorderSide borderSide;

  static _RiseButtonColors resolve(RiseThemeData theme, RiseButtonVariant variant) {
    switch (variant) {
      case RiseButtonVariant.primary:
        return _RiseButtonColors(
          background: theme.accent,
          foreground: theme.accentForeground,
          highlight: theme.resolveAccentHover(),
        );
      case RiseButtonVariant.secondary:
        return _RiseButtonColors(
          background: theme.muted,
          foreground: theme.accentSoftForeground,
          highlight: theme.resolveDefaultHover(),
        );
      case RiseButtonVariant.tertiary:
        return _RiseButtonColors(
          background: theme.muted,
          foreground: theme.defaultForeground,
          highlight: theme.resolveDefaultHover(),
        );
      case RiseButtonVariant.outline:
        return _RiseButtonColors(
          background: Colors.transparent,
          foreground: theme.defaultForeground,
          highlight: theme.resolveDefaultHover().withValues(alpha: 0.3),
          borderSide: BorderSide(color: theme.border),
        );
      case RiseButtonVariant.ghost:
        return _RiseButtonColors(
          background: Colors.transparent,
          foreground: theme.defaultForeground,
          highlight: theme.resolveDefaultHover().withValues(alpha: 0.3),
        );
      case RiseButtonVariant.danger:
        return _RiseButtonColors(
          background: theme.danger,
          foreground: theme.dangerForeground,
          highlight: theme.resolveDangerHover(),
        );
      case RiseButtonVariant.dangerSoft:
        return _RiseButtonColors(
          background: theme.dangerSoft,
          foreground: theme.dangerSoftForeground,
          highlight: theme.resolveDangerSoftHover(),
        );
    }
  }
}

/// Tap target with Material ripple (feedback: scaleRipple).
class _RippleButtonBody extends StatelessWidget {
  const _RippleButtonBody({
    required this.child,
    required this.onPressed,
    required this.highlightColor,
    required this.splashColor,
    required this.onHighlightChanged,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Color highlightColor;
  final Color splashColor;
  final ValueChanged<bool> onHighlightChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onHighlightChanged: onHighlightChanged,
      highlightColor: highlightColor,
      splashColor: splashColor,
      child: child,
    );
  }
}

/// Draws a HeroUI-like highlight overlay on top of [child] while [pressed].
class _HighlightButtonBody extends StatelessWidget {
  const _HighlightButtonBody({
    required this.child,
    required this.pressed,
    required this.highlight,
    required this.enabled,
    required this.borderRadius,
  });

  final Widget child;
  final bool pressed;
  final Color highlight;
  final bool enabled;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity: pressed ? 1 : 0,
              duration: const Duration(milliseconds: 110),
              curve: Curves.easeOut,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: highlight,
                  borderRadius: borderRadius,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

BorderRadius _riseGroupButtonRadius(RiseButtonGroupSlotData slot, double r) {
  if (slot.only) return BorderRadius.circular(r);
  if (slot.orientation == RiseButtonGroupOrientation.horizontal) {
    if (slot.isFirst) {
      return BorderRadius.only(topLeft: Radius.circular(r), bottomLeft: Radius.circular(r));
    }
    if (slot.isLast) {
      return BorderRadius.only(topRight: Radius.circular(r), bottomRight: Radius.circular(r));
    }
    return BorderRadius.zero;
  }
  if (slot.isFirst) {
    return BorderRadius.only(topLeft: Radius.circular(r), topRight: Radius.circular(r));
  }
  if (slot.isLast) {
    return BorderRadius.only(bottomLeft: Radius.circular(r), bottomRight: Radius.circular(r));
  }
  return BorderRadius.zero;
}

Border _riseGroupOutlineBorder(RiseButtonGroupSlotData slot, Color borderColor) {
  const w = 1.0;
  final side = BorderSide(color: borderColor, width: w);
  if (slot.only) return Border.all(color: borderColor, width: w);
  if (slot.orientation == RiseButtonGroupOrientation.horizontal) {
    return Border(
      left: slot.isFirst ? side : BorderSide.none,
      right: slot.isLast ? side : BorderSide.none,
      top: side,
      bottom: side,
    );
  }
  return Border(
    top: slot.isFirst ? side : BorderSide.none,
    bottom: slot.isLast ? side : BorderSide.none,
    left: side,
    right: side,
  );
}
