import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';
import '../description/rise_description.dart';
import '../field_error/rise_field_error.dart';
import '../label/rise_label.dart';

/// Visual variant ([radio-group.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/radio-group.css) `radio-group--primary` / `--secondary`).
enum RiseRadioGroupVariant {
  /// `shadow-field` on the control ([radio.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/radio.css) default).
  primary,

  /// `shadow-none`, `--color-default` control fill (`radio-group--secondary`).
  secondary,
}

enum RiseRadioGroupOrientation {
  /// `[data-orientation="vertical"]` — `mt-4` spacing between radios.
  vertical,

  /// `[data-orientation="horizontal"]` — `flex-wrap gap-4`.
  horizontal,
}

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

/// Single-choice group (HeroUI [RadioGroup](https://heroui.com/docs/react/components/radio-group)).
///
/// Styling follows [radio-group.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/radio-group.css)
/// and [radio.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/radio.css)
/// (`radio`, `radio__control`, `radio__indicator`, variants, invalid/disabled).
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
    this.spacing = _kDefaultSpacing,
  }) : assert((child == null) != (options == null), 'Provide exactly one of child or options.');

  static const double _kDefaultSpacing = 16;

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

  /// Between adjacent radios: vertical `mt-4` (16); horizontal `gap-4` (16).
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          RiseLabel(
            isRequired: isRequired,
            isInvalid: isInvalid,
            isDisabled: isDisabled,
            child: label!,
          ),
        if (description != null) ...[
          SizedBox(height: label != null ? 4 : 0),
          RiseDescription(child: description!),
        ],
        if (label != null || description != null) const SizedBox(height: 16),
        RadioGroup<T>(
          groupValue: value,
          onChanged: isDisabled ? (_) {} : onChanged,
          child: child ?? _buildOptions(context),
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: 6),
          RiseFieldError(
            visible: isInvalid,
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: effectiveDisabled ? null : () => onChanged(option.value),
          borderRadius: BorderRadius.circular(12),
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  option.description == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: RiseRadio<T>(
                    value: option.value,
                    isDisabled: effectiveDisabled,
                    isInvalid: isInvalid,
                    variant: variant,
                  ),
                ),
                SizedBox(width: spacingFromGap3),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultTextStyle.merge(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w500,
                              color: context.riseTheme.defaultForeground,
                            ) ??
                            TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w500,
                              color: context.riseTheme.defaultForeground,
                            ),
                        child: option.label,
                      ),
                      if (option.description != null) ...[
                        const SizedBox(height: 2),
                        DefaultTextStyle.merge(
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 12,
                                height: 16 / 12,
                                color: context.riseTheme.mutedForeground(0.85),
                              ) ??
                              TextStyle(
                                fontSize: 12,
                                height: 16 / 12,
                                color: context.riseTheme.mutedForeground(0.85),
                              ),
                          child: option.description!,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Tailwind `gap-3` → 12px.
  static const double spacingFromGap3 = 12;
}

/// One radio control — must sit under [RadioGroup] of the same [T] (from [RiseRadioGroup] or custom).
///
/// Uses [RawRadio] with Hero-sized 16px control, `radio__control` / `radio__indicator` behavior.
class RiseRadio<T extends Object?> extends StatefulWidget {
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

  static const double _kSize = 16;

  @override
  State<RiseRadio<T>> createState() => _RiseRadioState<T>();
}

class _RiseRadioState<T extends Object?> extends State<RiseRadio<T>> {
  late final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<BoxShadow>? _primaryShadows(bool primary, Brightness brightness) {
    if (!primary || brightness == Brightness.dark) return null;
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        offset: const Offset(0, 1),
        blurRadius: 2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final registry = RadioGroup.maybeOf<T>(context);

    return RawRadio<T>(
      value: widget.value,
      enabled: !widget.isDisabled,
      toggleable: false,
      autofocus: false,
      focusNode: _focusNode,
      groupRegistry: registry,
      mouseCursor: WidgetStateMouseCursor.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
      ),
      builder: (ctx, state) {
        final selected = state.value == true;
        final hovered = state.states.contains(WidgetState.hovered);
        final focused = state.states.contains(WidgetState.focused);
        final pressed = state.downPosition != null;
        final primary = widget.variant == RiseRadioGroupVariant.primary;

        Color borderColor;
        Color fillColor;
        if (widget.isInvalid) {
          borderColor = rise.danger;
          fillColor = selected ? rise.danger : (primary ? rise.surface : rise.surfaceSecondary);
        } else if (selected) {
          borderColor = Colors.transparent;
          fillColor = pressed ? rise.resolveAccentHover() : rise.accent;
        } else {
          borderColor = rise.border;
          if (hovered) {
            borderColor = Color.lerp(rise.border, rise.defaultForeground, 0.1)!;
          }
          fillColor = primary ? rise.surface : rise.surfaceSecondary;
          if (hovered && primary) {
            fillColor = Color.lerp(fillColor, rise.muted, 0.18)!;
          } else if (hovered && !primary) {
            fillColor = Color.lerp(fillColor, rise.resolveDefaultHover(), 0.22)!;
          }
        }

        var borderW = 1.0;
        if (focused) {
          borderW = 2;
          if (!widget.isInvalid && !selected) {
            borderColor = rise.accent;
          }
        }

        final dotDiameter = RiseRadio._kSize * (selected && pressed ? 0.5 : 0.375);

        Widget control = AnimatedScale(
          scale: pressed ? 0.95 : 1,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            width: RiseRadio._kSize,
            height: RiseRadio._kSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: fillColor,
              border: Border.all(color: borderColor, width: borderW),
              boxShadow: _primaryShadows(primary, theme.brightness),
            ),
            child: Center(
              child: AnimatedBuilder(
                animation: state.position,
                builder: (context, _) {
                  if (!selected) return const SizedBox.shrink();
                  final t = state.position.value;
                  final d = dotDiameter * t;
                  return Container(
                    width: d,
                    height: d,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isInvalid ? rise.dangerForeground : rise.accentForeground,
                    ),
                  );
                },
              ),
            ),
          ),
        );

        if (widget.isDisabled) {
          control = Opacity(opacity: rise.disabledOpacity, child: control);
        }

        return control;
      },
    );
  }
}
