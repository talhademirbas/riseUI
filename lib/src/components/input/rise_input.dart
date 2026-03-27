import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Visual variant aligned with HeroUI Input (`primary` / `secondary`).
enum RiseInputVariant {
  primary,
  secondary,
}

/// Primitive single-line input aligned with HeroUI
/// [Input](https://heroui.com/docs/react/components/input).
///
/// For labels, descriptions, and field-level validation chrome, use
/// [RiseTextField](https://heroui.com/docs/react/components/text-field).
class RiseInput extends StatelessWidget {
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
    this.prefixIcon,
    this.suffixIcon,
    this.variant = RiseInputVariant.primary,
    this.fullWidth = false,
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
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final RiseInputVariant variant;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final borderColor = rise.border;
    final fill = variant == RiseInputVariant.primary
        ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35)
        : rise.muted;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: borderColor),
    );

    final input = TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: style ?? theme.textTheme.bodyLarge?.copyWith(color: rise.defaultForeground),
      textAlign: textAlign,
      autofocus: autofocus,
      readOnly: readOnly,
      showCursor: showCursor,
      obscureText: obscureText,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      maxLength: maxLength,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      enabled: enabled,
      cursorColor: cursorColor ?? rise.accent,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fill,
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: rise.accent, width: 2),
        ),
        disabledBorder: border.copyWith(
          borderSide: BorderSide(color: rise.border.withValues(alpha: 0.45)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: input);
    }
    return input;
  }
}
