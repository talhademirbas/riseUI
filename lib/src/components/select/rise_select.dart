import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

enum RiseSelectVariant { primary, secondary }

/// Item for [RiseSelect].
@immutable
class RiseSelectItem<T> {
  const RiseSelectItem({
    required this.value,
    required this.label,
    this.isDisabled = false,
  });

  final T value;
  final String label;
  final bool isDisabled;
}

/// Dropdown with Rise field decoration (HeroUI [Select](https://heroui.com/docs/native/components/select)).
class RiseSelect<T> extends StatelessWidget {
  const RiseSelect({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.placeholder,
    this.label,
    this.description,
    this.errorMessage,
    this.enabled = true,
    this.isRequired = false,
    this.isInvalid = false,
    this.fullWidth = false,
    this.variant = RiseSelectVariant.primary,
    this.indicatorIcon,
  });

  final List<RiseSelectItem<T>> items;

  final T? value;

  final ValueChanged<T?> onChanged;

  final String? placeholder;

  final Widget? label;

  final Widget? description;

  final Widget? errorMessage;

  final bool enabled;

  final bool isRequired;

  final bool isInvalid;

  final bool fullWidth;

  final RiseSelectVariant variant;

  final Widget? indicatorIcon;

  InputDecoration _decoration(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final fill = variant == RiseSelectVariant.secondary
        ? rise.muted
        : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35);
    final borderColor = isInvalid ? rise.danger : rise.border;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: borderColor),
    );
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: fill,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: isInvalid ? rise.danger : rise.accent, width: 2),
      ),
      disabledBorder: border.copyWith(
        borderSide: BorderSide(color: rise.border.withValues(alpha: 0.45)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final field = InputDecorator(
      decoration: _decoration(context),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: placeholder != null ? Text(placeholder!) : null,
          items: items
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e.value,
                  enabled: !e.isDisabled,
                  child: Text(e.label),
                ),
              )
              .toList(),
          onChanged: enabled ? onChanged : null,
          dropdownColor: theme.colorScheme.surface,
          iconEnabledColor: rise.defaultForeground.withValues(alpha: 0.75),
          iconDisabledColor: rise.defaultForeground.withValues(alpha: 0.45),
          icon: indicatorIcon ?? const Icon(Icons.keyboard_arrow_down),
          style: theme.textTheme.bodyLarge?.copyWith(color: rise.defaultForeground),
          borderRadius: BorderRadius.circular(14),
          isExpanded: true,
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          DefaultTextStyle.merge(
            style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isInvalid ? rise.danger : rise.defaultForeground,
                ) ??
                TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isInvalid ? rise.danger : rise.defaultForeground,
                ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                label!,
                if (isRequired) ...[
                  const SizedBox(width: 2),
                  Text('*', style: TextStyle(color: rise.danger)),
                ],
              ],
            ),
          ),
        if (description != null && !isInvalid) ...[
          const SizedBox(height: 4),
          DefaultTextStyle.merge(
            style: theme.textTheme.bodySmall?.copyWith(color: rise.mutedForeground()) ??
                TextStyle(color: rise.mutedForeground()),
            child: description!,
          ),
        ],
        if (label != null || description != null) const SizedBox(height: 8),
        if (fullWidth) SizedBox(width: double.infinity, child: field) else field,
        if (errorMessage != null && isInvalid) ...[
          const SizedBox(height: 6),
          DefaultTextStyle.merge(
            style: theme.textTheme.bodySmall?.copyWith(color: rise.danger) ??
                TextStyle(color: rise.danger),
            child: errorMessage!,
          ),
        ],
      ],
    );
  }
}
