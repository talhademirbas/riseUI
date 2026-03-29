import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/rise_theme.dart';
import '../description/rise_description.dart';
import '../field_error/rise_field_error.dart';
import '../input/rise_input.dart';
import '../label/rise_label.dart';
import '../text_area/rise_text_area.dart';

/// Visual variant for the inner control (HeroUI `primary` / `secondary` on [TextFieldRoot](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/textfield/textfield.tsx)).
enum RiseTextFieldVariant {
  primary,
  secondary,
}

/// Form field shell: label, control, description, error — aligned with HeroUI
/// [TextField](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/textfield/textfield.tsx)
/// and [textfield.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/textfield.css)
/// (`flex flex-col gap-1`, hide description when invalid, full-width modifier).
///
/// The control is a [RiseInput] or [RiseTextArea] (matching Storybook `Input` / `TextArea` children).
/// For a bare input without label/description, use [RiseInput] or [RiseTextArea] directly.
///
/// Pass a custom [decoration] to use a raw [TextField] (legacy); [expands] also uses that path.
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

  static const double _kFieldGap = 4;

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

  /// Description slot ([textfield.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/textfield.css) — hidden when invalid).
  final String? helperText;

  final bool isInvalid;
  final bool isRequired;
  final RiseTextFieldVariant variant;
  final bool fullWidth;

  bool get _hasError => errorText != null || isInvalid;

  bool get _isMultiline =>
      expands || (maxLines != null && maxLines! > 1) || (minLines != null && minLines! > 1);

  RiseInputVariant get _inputVariant =>
      variant == RiseTextFieldVariant.primary ? RiseInputVariant.primary : RiseInputVariant.secondary;

  RiseTextAreaVariant get _areaVariant =>
      variant == RiseTextFieldVariant.primary ? RiseTextAreaVariant.primary : RiseTextAreaVariant.secondary;

  bool get _useLegacyShell =>
      decoration != null ||
      expands ||
      strutStyle != null ||
      textAlignVertical != null ||
      keyboardAppearance != null ||
      buildCounter != null ||
      scrollPhysics != null ||
      enableInteractiveSelection != null;

  InputDecoration _legacyDecoration(BuildContext context) {
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
    final resolvedLabel = labelText == null ? null : (isRequired ? '${labelText!} *' : labelText);
    return InputDecoration(
      isDense: true,
      labelText: resolvedLabel,
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

  Widget _buildLegacyTextField(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final field = TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: decoration ?? _legacyDecoration(context),
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.newline,
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

  Widget _buildComposedField(BuildContext context) {
    final ta = textAlign ?? TextAlign.start;

    if (_isMultiline) {
      return RiseTextArea(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType ?? TextInputType.multiline,
        textInputAction: textInputAction ?? TextInputAction.newline,
        style: style,
        rows: minLines,
        minLines: minLines ?? 3,
        maxLines: maxLines ?? 8,
        onChanged: onChanged,
        enabled: enabled,
        autofocus: autofocus,
        readOnly: readOnly,
        maxLength: maxLength,
        hintText: hintText,
        placeholder: placeholder,
        errorText: null,
        isInvalid: _hasError,
        variant: _areaVariant,
        fullWidth: fullWidth,
        obscureText: obscureText,
        textAlign: ta,
        inputFormatters: inputFormatters,
      );
    }

    return RiseInput(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.done,
      style: style,
      textAlign: ta,
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
      cursorColor: cursorColor,
      hintText: hintText,
      placeholder: placeholder,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      variant: _inputVariant,
      fullWidth: fullWidth,
      isInvalid: _hasError,
      inputFormatters: inputFormatters,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_useLegacyShell) {
      return _buildLegacyTextField(context);
    }

    final children = <Widget>[];

    if (labelText != null) {
      children.add(
        RiseLabel.text(
          labelText!,
          isRequired: isRequired,
          isDisabled: !enabled,
          isInvalid: _hasError,
        ),
      );
      children.add(const SizedBox(height: _kFieldGap));
    }

    children.add(_buildComposedField(context));

    if (helperText != null && !_hasError) {
      children.add(const SizedBox(height: _kFieldGap));
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: RiseDescription.text(helperText!),
        ),
      );
    }

    if (errorText != null) {
      children.add(const SizedBox(height: _kFieldGap));
      children.add(RiseFieldError.text(errorText!));
    }

    Widget column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );

    if (fullWidth) {
      column = SizedBox(width: double.infinity, child: column);
    }
    return column;
  }
}
