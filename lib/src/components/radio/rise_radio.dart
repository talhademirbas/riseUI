import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

enum RiseRadioGroupVariant { primary, secondary }

enum RiseRadioGroupOrientation { vertical, horizontal }

class RiseRadioOption<T extends Object?> {
  const RiseRadioOption({
    required this.value,
    required this.label,
    this.description,
    this.isDisabled = false,
  });

  final T value;
  final Widget label;
  final Widget? description;
  final bool isDisabled;
}

/// Group scope for [RiseRadio] (HeroUI [Radio](https://heroui.com/docs/native/components/radio)).
///
/// Wraps Flutter [RadioGroup] for semantics and keyboard behavior.
class RiseRadioGroup<T extends Object?> extends StatelessWidget {
  const RiseRadioGroup({
    super.key,
    required this.value,
    required this.onChanged,
    this.child,
    this.options,
    this.label,
    this.description,
    this.errorMessage,
    this.isDisabled = false,
    this.isRequired = false,
    this.isInvalid = false,
    this.variant = RiseRadioGroupVariant.primary,
    this.orientation = RiseRadioGroupOrientation.vertical,
    this.spacing = 12,
  }) : assert((child == null) != (options == null), 'Provide exactly one of child or options.');

  final T? value;

  final ValueChanged<T?> onChanged;

  final Widget? child;

  final List<RiseRadioOption<T>>? options;

  final Widget? label;

  final Widget? description;

  final Widget? errorMessage;

  final bool isDisabled;

  final bool isRequired;

  final bool isInvalid;

  final RiseRadioGroupVariant variant;

  final RiseRadioGroupOrientation orientation;

  final double spacing;

  Widget _buildOptions(BuildContext context) {
    final opts = options!;
    if (orientation == RiseRadioGroupOrientation.horizontal) {
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: [
          for (final o in opts)
            _RiseRadioOptionTile<T>(
              option: o,
              value: value,
              onChanged: onChanged,
              isDisabled: isDisabled,
              isInvalid: isInvalid,
              variant: variant,
            ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < opts.length; i++) ...[
          if (i > 0) SizedBox(height: spacing),
          _RiseRadioOptionTile<T>(
            option: opts[i],
            value: value,
            onChanged: onChanged,
            isDisabled: isDisabled,
            isInvalid: isInvalid,
            variant: variant,
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
        if (description != null) ...[
          const SizedBox(height: 4),
          DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: rise.mutedForeground()) ??
                TextStyle(color: rise.mutedForeground()),
            child: description!,
          ),
        ],
        if (label != null || description != null) const SizedBox(height: 8),
        RadioGroup<T>(
          groupValue: value,
          onChanged: isDisabled ? (_) {} : onChanged,
          child: child ?? _buildOptions(context),
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: 6),
          DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: rise.danger) ??
                TextStyle(color: rise.danger),
            child: errorMessage!,
          ),
        ],
      ],
    );
  }
}

class _RiseRadioOptionTile<T extends Object?> extends StatelessWidget {
  const _RiseRadioOptionTile({
    required this.option,
    required this.value,
    required this.onChanged,
    required this.isDisabled,
    required this.isInvalid,
    required this.variant,
  });

  final RiseRadioOption<T> option;
  final T? value;
  final ValueChanged<T?> onChanged;
  final bool isDisabled;
  final bool isInvalid;
  final RiseRadioGroupVariant variant;

  @override
  Widget build(BuildContext context) {
    final effectiveDisabled = isDisabled || option.isDisabled;
    return MergeSemantics(
      child: InkWell(
        onTap: effectiveDisabled ? null : () => onChanged(option.value),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                option.description == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              RiseRadio<T>(
                value: option.value,
                isDisabled: effectiveDisabled,
                isInvalid: isInvalid,
                variant: variant,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    option.label,
                    if (option.description != null) ...[
                      const SizedBox(height: 2),
                      option.description!,
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Single radio — must be under [RiseRadioGroup] of the same type [T].
class RiseRadio<T extends Object?> extends StatelessWidget {
  const RiseRadio({
    super.key,
    required this.value,
    this.isDisabled = false,
    this.isInvalid = false,
    this.variant = RiseRadioGroupVariant.primary,
  });

  final T value;
  final bool isDisabled;
  final bool isInvalid;
  final RiseRadioGroupVariant variant;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Radio<T>(
      value: value,
      enabled: !isDisabled,
      fillColor: WidgetStateProperty.resolveWith((states) {
        final unselected =
            variant == RiseRadioGroupVariant.secondary ? rise.muted : rise.background;
        if (isInvalid) {
          return states.contains(WidgetState.selected) ? rise.danger : rise.danger.withValues(alpha: 0.75);
        }
        if (states.contains(WidgetState.disabled)) {
          return rise.border.withValues(alpha: 0.45);
        }
        if (states.contains(WidgetState.selected)) {
          return rise.accent;
        }
        return unselected;
      }),
      side: BorderSide(color: isInvalid ? rise.danger : rise.border),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}
