import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/rise_theme.dart';

/// Visual variant aligned with HeroUI
/// [textarea.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/textarea.css)
/// (`.textarea--primary` / `.textarea--secondary`).
enum RiseTextAreaVariant {
  /// Default: `shadow-field`, `bg-field`.
  primary,

  /// `shadow-none`, `--color-default` fill (`--textarea-bg`).
  secondary,
}

/// Multi-line field aligned with HeroUI
/// [TextArea](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/textarea/textarea.tsx)
/// and [textarea.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/textarea.css).
///
/// Uses `rounded-field`, `px-3`/`py-2`, `text-sm`, `min-height` 38px shell, hover/focus/invalid/disabled
/// tokens, and optional `shadow-field` (primary) vs flat default fill (secondary).
class RiseTextArea extends StatefulWidget {
  const RiseTextArea({
    super.key,
    this.controller,
    this.focusNode,
    this.decoration,
    this.rows,
    this.minLines = 3,
    this.maxLines = 8,
    this.keyboardType = TextInputType.multiline,
    this.textInputAction = TextInputAction.newline,
    this.style,
    this.onChanged,
    this.enabled = true,
    this.autofocus = false,
    this.readOnly = false,
    this.maxLength,
    this.labelText,
    this.hintText,
    this.placeholder,
    this.errorText,
    this.isInvalid = false,
    this.variant = RiseTextAreaVariant.primary,
    this.fullWidth = false,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;

  /// Sets [minLines] when [decoration] is null (HeroUI `rows`).
  final int? rows;

  final int minLines;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextStyle? style;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool autofocus;
  final bool readOnly;
  final int? maxLength;
  final String? labelText;
  final String? hintText;

  /// Alias for [hintText] (HeroUI `placeholder`).
  final String? placeholder;

  final String? errorText;
  final bool isInvalid;
  final RiseTextAreaVariant variant;
  final bool fullWidth;

  final bool obscureText;

  final TextAlign textAlign;

  final List<TextInputFormatter>? inputFormatters;

  /// Minimum block height from [textarea.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/textarea.css) (`min-height: 38px`).
  static const double kMinHeight = 38;

  static const double _kRadius = 14;

  /// `px-3` / `py-2` from the stylesheet.
  static const EdgeInsets _kContentPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 8);

  @override
  State<RiseTextArea> createState() => _RiseTextAreaState();
}

class _RiseTextAreaState extends State<RiseTextArea> {
  late FocusNode _focusNode;
  bool _ownsFocusNode = false;
  bool _hovering = false;

  bool get _focused => _focusNode.hasFocus;

  bool get _hasError => widget.errorText != null || widget.isInvalid;

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
  void didUpdateWidget(RiseTextArea oldWidget) {
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
    return widget.variant == RiseTextAreaVariant.primary ? rise.surface : rise.muted;
  }

  Color _resolveFill(RiseThemeData rise, ThemeData theme) {
    final base = _baseFill(rise, theme);
    if (!widget.enabled) {
      return base.withValues(alpha: 0.65);
    }
    if (_hasError) {
      return Color.lerp(base, rise.dangerSoft, 0.4)!;
    }
    if (_focused) {
      return widget.variant == RiseTextAreaVariant.primary
          ? Color.lerp(base, rise.muted, 0.14)!
          : Color.lerp(base, rise.resolveDefaultHover(), 0.12)!;
    }
    if (_hovering && !_focused) {
      if (widget.variant == RiseTextAreaVariant.primary) {
        return Color.lerp(base, rise.muted, 0.22)!;
      }
      return Color.lerp(base, rise.resolveDefaultHover(), 0.28)!;
    }
    return base;
  }

  Color _borderColor(RiseThemeData rise) {
    if (!widget.enabled) {
      return rise.border.withValues(alpha: rise.disabledOpacity);
    }
    if (_hasError) {
      return rise.danger;
    }
    if (_focused) {
      return rise.accent;
    }
    return rise.border;
  }

  double _borderWidth() {
    if (!widget.enabled) return 1;
    if (_hasError) {
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

  InputDecoration _resolveDecoration(RiseThemeData rise, ThemeData theme) {
    final hint = widget.hintText ?? widget.placeholder;
    final borderColor = _borderColor(rise);
    final borderWidth = _borderWidth();
    final fill = _resolveFill(rise, theme);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(RiseTextArea._kRadius),
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    );
    return InputDecoration(
      isDense: true,
      alignLabelWithHint: true,
      labelText: widget.labelText,
      hintText: hint,
      hintStyle: _hintStyle(rise, theme),
      errorText: widget.errorText,
      filled: true,
      fillColor: fill,
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      disabledBorder: border.copyWith(
        borderSide: BorderSide(color: rise.border.withValues(alpha: 0.45)),
      ),
      errorBorder: border.copyWith(
        borderSide: BorderSide(color: rise.danger, width: 1.5),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: BorderSide(color: rise.danger, width: 2),
      ),
      constraints: const BoxConstraints(minHeight: RiseTextArea.kMinHeight),
      contentPadding: RiseTextArea._kContentPadding,
      counterText: widget.maxLength != null ? '' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final effectiveMin = widget.rows ?? widget.minLines;

    final decoration =
        widget.decoration ?? _resolveDecoration(rise, theme);

    Widget field = TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      decoration: decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: _fieldTextStyle(rise, theme),
      textAlign: widget.textAlign,
      minLines: effectiveMin,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      cursorColor: rise.accent,
      inputFormatters: widget.inputFormatters,
    );

    if (widget.decoration == null) {
      field = MouseRegion(
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: field,
      );

      if (widget.variant == RiseTextAreaVariant.primary) {
        field = Material(
          color: Colors.transparent,
          elevation: widget.enabled ? 1 : 0,
          shadowColor: Colors.black.withValues(alpha: 0.08),
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RiseTextArea._kRadius),
          ),
          child: field,
        );
      }

      field = Theme(
        data: theme.copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: field,
      );
    }

    if (widget.fullWidth) {
      return SizedBox(width: double.infinity, child: field);
    }
    return field;
  }
}
