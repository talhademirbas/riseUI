import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/rise_theme.dart';

/// Visual variant for field fill (HeroUI Input / TextArea inside [TextField](https://heroui.com/docs/react/components/text-field)).
enum RiseTextFieldVariant {
  primary,
  secondary,
}

/// Composition-friendly single- or multi-line field with label, helper, and error
/// (HeroUI [TextField](https://heroui.com/docs/react/components/text-field) + [textfield.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/textfield.css)).
///
/// For a primitive input without label/description, prefer [RiseInput]. For multiline-only
/// API mirroring HeroUI `TextArea`, prefer [RiseTextArea].
class RiseTextField extends StatelessWidget {
  const RiseTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20),
    this.enableInteractiveSelection,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.labelText,
    this.hintText,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.helperText,
    this.isInvalid = false,
    this.isRequired = false,
    this.variant = RiseTextFieldVariant.primary,
    this.fullWidth = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final String? labelText;
  final String? hintText;

  /// Alias for [hintText] (HeroUI `placeholder`).
  final String? placeholder;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;

  /// Helper under the field (hidden when Material shows [errorText], matching HeroUI invalid + description).
  final String? helperText;

  final bool isInvalid;
  final bool isRequired;
  final RiseTextFieldVariant variant;
  final bool fullWidth;

  bool get _hasError => errorText != null || isInvalid;

  String? _resolvedLabelText() {
    if (labelText == null) return null;
    return isRequired ? '${labelText!} *' : labelText;
  }

  InputDecoration _resolveDecoration(BuildContext context) {
    if (decoration != null) return decoration!;
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final fill = variant == RiseTextFieldVariant.primary
        ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35)
        : rise.muted;
    final borderColor = _hasError ? rise.danger : rise.border;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: borderColor),
    );
    final hint = hintText ?? placeholder;
    return InputDecoration(
      isDense: true,
      labelText: _resolvedLabelText(),
      hintText: hint,
      errorText: errorText,
      helperText: helperText,
      helperStyle: helperText != null
          ? theme.textTheme.bodySmall?.copyWith(color: rise.mutedForeground(0.65))
          : null,
      errorStyle: theme.textTheme.bodySmall?.copyWith(color: rise.danger),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: fill,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: _hasError ? rise.danger : rise.accent, width: 2),
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

    final field = TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: _resolveDecoration(context),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: style ?? theme.textTheme.bodyLarge?.copyWith(color: rise.defaultForeground),
      strutStyle: strutStyle,
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus,
      readOnly: readOnly,
      showCursor: showCursor,
      obscureText: obscureText,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      enabled: enabled,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorColor: cursorColor ?? rise.accent,
      keyboardAppearance: keyboardAppearance,
      scrollPadding: scrollPadding,
      enableInteractiveSelection: enableInteractiveSelection,
      buildCounter: buildCounter,
      scrollPhysics: scrollPhysics,
      autofillHints: autofillHints,
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: field);
    }
    return field;
  }
}
