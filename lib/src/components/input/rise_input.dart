import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Visual variant aligned with HeroUI Input (`primary` / `secondary`)
/// ([input.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input.css)).
enum RiseInputVariant {
  /// Default: field fill + `shadow-field`.
  primary,

  /// `shadow-none`, `--color-default` fill.
  secondary,
}

/// Primitive single-line input aligned with HeroUI
/// [Input](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/input/input.tsx)
/// (`InputPrimitive` + [inputVariants](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input.css)).
///
/// Styling mirrors `.input`: `rounded-field`, comfortable min height, `text-sm`, hover fill,
/// while **focus and invalid are shown on the border only** (background stays stable).
///
/// For labels, descriptions, and field-level validation chrome, use
/// [RiseTextField](https://heroui.com/docs/react/components/text-field).
class RiseInput extends StatefulWidget {
  const RiseInput({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.enabled = true,
    this.cursorColor,
    this.hintText,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.variant = RiseInputVariant.primary,
    this.fullWidth = false,
    this.isInvalid = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final Color? cursorColor;
  final String? hintText;

  /// Alias for [hintText] (HeroUI `placeholder`).
  final String? placeholder;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final RiseInputVariant variant;

  /// When true, expands to max width of parent ([HeroUI `fullWidth`](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input.css) `.input--full-width`).
  final bool fullWidth;

  /// Maps to `data-invalid` / `.input[data-invalid="true"]`.
  final bool isInvalid;

  static const double _kRadius = 14;

  /// Minimum height for the field container (Hero `py-2`+ comfortable tap target).
  static const double _kMinHeight = 48;

  static const EdgeInsets _kContentPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 12);

  @override
  State<RiseInput> createState() => _RiseInputState();
}

class _RiseInputState extends State<RiseInput> {
  late FocusNode _focusNode;
  bool _ownsFocusNode = false;
  bool _hovering = false;

  bool get _focused => _focusNode.hasFocus;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    } else {
      _focusNode = FocusNode();
      _ownsFocusNode = true;
    }
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(RiseInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      _focusNode.removeListener(_onFocusChange);
      if (_ownsFocusNode) {
        _focusNode.dispose();
      }
      _ownsFocusNode = widget.focusNode == null;
      _focusNode = widget.focusNode ?? FocusNode();
      _focusNode.addListener(_onFocusChange);
    }
  }

  void _onFocusChange() => setState(() {});

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (_ownsFocusNode) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  Color _baseFill(RiseThemeData rise, ThemeData theme) {
    return widget.variant == RiseInputVariant.primary
        ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35)
        : rise.muted;
  }

  Color _resolveFill(RiseThemeData rise, ThemeData theme) {
    final base = _baseFill(rise, theme);
    if (!widget.enabled) {
      return base.withValues(alpha: 0.65);
    }
    // Focus / invalid: border only (no fill shift — matches “pressed = outline” expectation).
    if (_hovering && !_focused) {
      if (widget.variant == RiseInputVariant.primary) {
        return Color.lerp(base, rise.muted, 0.22)!;
      }
      return Color.lerp(base, rise.resolveDefaultHover(), 0.28)!;
    }
    return base;
  }

  Color _borderColor(RiseThemeData rise) {
    if (!widget.enabled) {
      return rise.border.withValues(alpha: 0.45);
    }
    if (widget.isInvalid) {
      return rise.danger;
    }
    if (_focused) {
      return rise.accent;
    }
    if (_hovering && !_focused) {
      return Color.lerp(rise.border, rise.defaultForeground, 0.1)!;
    }
    return rise.border;
  }

  double _borderWidth() {
    if (!widget.enabled) return 1;
    if (widget.isInvalid) {
      return _focused ? 2 : 1.5;
    }
    if (_focused) return 2;
    return 1;
  }

  TextStyle _fieldTextStyle(RiseThemeData rise, ThemeData theme) {
    return widget.style ??
        theme.textTheme.bodyMedium?.copyWith(
          color: rise.defaultForeground,
          fontSize: 14,
          height: 20 / 14,
        ) ??
        TextStyle(color: rise.defaultForeground, fontSize: 14, height: 20 / 14);
  }

  TextStyle _hintStyle(RiseThemeData rise, ThemeData theme) {
    return theme.textTheme.bodyMedium?.copyWith(
          color: rise.mutedForeground(0.65),
          fontSize: 14,
          height: 20 / 14,
        ) ??
        TextStyle(color: rise.mutedForeground(0.65), fontSize: 14, height: 20 / 14);
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final hint = widget.hintText ?? widget.placeholder;
    final borderColor = _borderColor(rise);
    final borderWidth = _borderWidth();
    final fill = _resolveFill(rise, theme);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(RiseInput._kRadius),
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    );

    final field = TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: _fieldTextStyle(rise, theme),
      textAlign: widget.textAlign,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      enabled: widget.enabled,
      cursorColor: widget.cursorColor ?? rise.accent,
      decoration: InputDecoration(
        isDense: true,
        constraints: const BoxConstraints(minHeight: RiseInput._kMinHeight),
        hintText: hint,
        hintStyle: _hintStyle(rise, theme),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: fill,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        contentPadding: RiseInput._kContentPadding,
        counterText: widget.maxLength != null ? '' : null,
      ),
    );

    Widget wrapped = MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: field,
    );

    if (widget.variant == RiseInputVariant.primary) {
      wrapped = Material(
        color: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RiseInput._kRadius),
        ),
        child: wrapped,
      );
    }

    wrapped = Theme(
      data: theme.copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: wrapped,
    );

    if (widget.fullWidth) {
      return SizedBox(width: double.infinity, child: wrapped);
    }
    return wrapped;
  }
}
