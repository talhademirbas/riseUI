import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Visual style (HeroUI `variant`: primary / secondary).
enum RiseCheckboxVariant {
  primary,
  secondary,
}

/// Themed checkbox with optional content slot — aligned with
/// [HeroUI Checkbox](https://heroui.com/docs/react/components/checkbox), [checkbox.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/checkbox/checkbox.tsx),
/// and `checkbox.css`.
class RiseCheckbox extends StatelessWidget {
  const RiseCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.isDisabled = false,
    this.isInvalid = false,
    this.variant = RiseCheckboxVariant.primary,
    this.label,
    this.description,
    this.semanticLabel,
  });

  final bool? value;

  final ValueChanged<bool?>? onChanged;

  final bool tristate;

  final bool isDisabled;

  final bool isInvalid;

  final RiseCheckboxVariant variant;

  final Widget? label;

  final Widget? description;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final effectiveOnChanged = isDisabled ? null : onChanged;
    final hasDescription = description != null;

    Widget control = CheckboxTheme(
      data: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return rise.border.withValues(alpha: 0.4);
          }
          if (states.contains(WidgetState.selected) && isInvalid) {
            return rise.danger;
          }
          if (states.contains(WidgetState.selected)) {
            return rise.accent;
          }
          return variant == RiseCheckboxVariant.secondary ? rise.muted : Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(
          isInvalid && (value == true || (tristate && value == null))
              ? rise.dangerForeground
              : rise.accentForeground,
        ),
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: rise.border.withValues(alpha: 0.4), width: 1.5);
          }
          if (isInvalid && !states.contains(WidgetState.selected)) {
            return BorderSide(color: rise.danger, width: 1.5);
          }
          return BorderSide(color: rise.border, width: 1.5);
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.transparent;
          }
          return (isInvalid ? rise.danger : rise.accent).withValues(alpha: 0.12);
        }),
      ),
      child: Checkbox(
        value: value,
        tristate: tristate,
        onChanged: effectiveOnChanged,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
    );

    if (label == null && description == null) {
      if (semanticLabel != null) {
        control = Semantics(label: semanticLabel, child: control);
      }
      return Theme(
        data: theme.copyWith(
          splashColor: rise.accent.withValues(alpha: 0.12),
          highlightColor: rise.accent.withValues(alpha: 0.08),
        ),
        child: control,
      );
    }

    final labelStyle = theme.textTheme.bodyLarge?.copyWith(
      color: rise.defaultForeground,
      fontWeight: FontWeight.w500,
    );
    final descriptionStyle = theme.textTheme.bodyMedium?.copyWith(
          color: isInvalid ? rise.danger : rise.mutedForeground(0.65),
          height: 1.4,
        ) ??
        TextStyle(
          color: isInvalid ? rise.danger : rise.mutedForeground(0.65),
          height: 1.4,
        );

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          DefaultTextStyle(
            style: labelStyle ?? const TextStyle(),
            child: label!,
          ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: DefaultTextStyle(
              style: descriptionStyle,
              child: description!,
            ),
          ),
      ],
    );

    final toggle = effectiveOnChanged;
    if (toggle != null) {
      content = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (tristate) {
            final next = value == false ? true : value == true ? null : false;
            toggle(next);
            return;
          }
          toggle(!(value ?? false));
        },
        child: content,
      );
    }

    final row = Row(
      crossAxisAlignment: hasDescription ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        if (hasDescription) Padding(padding: const EdgeInsets.only(top: 2), child: control) else control,
        const SizedBox(width: 10),
        Expanded(child: content),
      ],
    );

    return Theme(
      data: theme.copyWith(
        splashColor: rise.accent.withValues(alpha: 0.12),
        highlightColor: rise.accent.withValues(alpha: 0.08),
      ),
      child: MergeSemantics(
        child: Semantics(
          label: semanticLabel,
          child: row,
        ),
      ),
    );
  }
}
