import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Visual variant aligned with HeroUI TextArea (`primary` / `secondary`).
enum RiseTextAreaVariant {
  primary,
  secondary,
}

/// Multi-line text field (HeroUI [TextArea](https://heroui.com/docs/react/components/text-area)).
class RiseTextArea extends StatelessWidget {
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
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;

  /// When set, [minLines] defaults to this value unless [decoration] is provided.
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

  /// HeroUI-style placeholder (merged with [hintText], either may be used).
  final String? placeholder;

  final String? errorText;
  final bool isInvalid;
  final RiseTextAreaVariant variant;
  final bool fullWidth;

  InputDecoration _resolveDecoration(BuildContext context) {
    if (decoration != null) return decoration!;
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final fill = variant == RiseTextAreaVariant.primary
        ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35)
        : rise.muted;
    final hasError = errorText != null || isInvalid;
    final borderColor = hasError ? rise.danger : rise.border;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: borderColor),
    );
    return InputDecoration(
      alignLabelWithHint: true,
      labelText: labelText,
      hintText: hintText ?? placeholder,
      errorText: errorText,
      filled: true,
      fillColor: fill,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: hasError ? rise.danger : rise.accent, width: 2),
      ),
      disabledBorder: border.copyWith(
        borderSide: BorderSide(color: rise.border.withValues(alpha: 0.45)),
      ),
      errorBorder: border.copyWith(
        borderSide: BorderSide(color: rise.danger, width: 1.5),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: BorderSide(color: rise.danger, width: 2),
      ),
      counterText: maxLength != null ? '' : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final effectiveMin = rows ?? minLines;

    final field = TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: _resolveDecoration(context),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: style ?? theme.textTheme.bodyLarge?.copyWith(color: rise.defaultForeground),
      minLines: effectiveMin,
      maxLines: maxLines,
      onChanged: onChanged,
      enabled: enabled,
      autofocus: autofocus,
      readOnly: readOnly,
      maxLength: maxLength,
      cursorColor: rise.accent,
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: field);
    }
    return field;
  }
}
