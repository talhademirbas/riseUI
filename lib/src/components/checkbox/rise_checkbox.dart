import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/rise_theme.dart';

/// Visual style (HeroUI `variant`: primary / secondary — [checkbox.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/checkbox.css)).
enum RiseCheckboxVariant {
  /// Default: `shadow-field` on control, standard field surface.
  primary,

  /// Lower emphasis: `shadow-none`, `--checkbox-control-bg` unselected fill.
  secondary,
}

/// Control size (HeroUI FullRounded / size stories).
enum RiseCheckboxSize {
  sm,
  md,
  lg,
  xl,
}

/// Selection control with optional label/description — aligned with
/// [HeroUI Checkbox](https://heroui.com/docs/react/components/checkbox),
/// [checkbox.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/checkbox/checkbox.tsx).
class RiseCheckbox extends StatelessWidget {
  const RiseCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.isDisabled = false,
    this.isInvalid = false,
    this.variant = RiseCheckboxVariant.primary,
    this.size = RiseCheckboxSize.md,
    this.label,
    this.description,
    this.semanticLabel,
    this.indicatorBuilder,
  });

  final bool? value;

  final ValueChanged<bool?>? onChanged;

  final bool tristate;

  final bool isDisabled;

  final bool isInvalid;

  final RiseCheckboxVariant variant;

  /// Scales the 16px base control (Hero FullRounded story).
  final RiseCheckboxSize size;

  final Widget? label;

  final Widget? description;

  final String? semanticLabel;

  /// Optional check / dash / custom glyph (HeroUI `Checkbox.Indicator` render props).
  final RiseCheckboxIndicatorBuilder? indicatorBuilder;

  static double _boxSide(RiseCheckboxSize s) {
    return switch (s) {
      RiseCheckboxSize.sm => 14,
      RiseCheckboxSize.md => 16,
      RiseCheckboxSize.lg => 18,
      RiseCheckboxSize.xl => 20,
    };
  }

  static double _iconSize(RiseCheckboxSize s) {
    return switch (s) {
      RiseCheckboxSize.sm => 10,
      RiseCheckboxSize.md => 12,
      RiseCheckboxSize.lg => 14,
      RiseCheckboxSize.xl => 16,
    };
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final effectiveOnChanged = isDisabled ? null : onChanged;
    final hasDescription = description != null;
    final box = _boxSide(size);
    final iconSz = _iconSize(size);

    Widget control = _RiseCheckboxControl(
      value: value,
      tristate: tristate,
      onChanged: effectiveOnChanged,
      isDisabled: isDisabled,
      isInvalid: isInvalid,
      variant: variant,
      side: box,
      iconSize: iconSz,
      indicatorBuilder: indicatorBuilder,
    );

    if (label == null && description == null) {
      if (semanticLabel != null) {
        control = Semantics(label: semanticLabel, child: control);
      }
      return control;
    }

    // Hero `checkbox__content`: flex-col gap-0; label `text-sm font-medium`.
    final labelStyle = theme.textTheme.labelLarge?.copyWith(
          fontSize: 14,
          height: 1.4,
          fontWeight: FontWeight.w500,
          color: rise.defaultForeground,
        ) ??
        TextStyle(
          fontSize: 14,
          height: 1.4,
          fontWeight: FontWeight.w500,
          color: rise.defaultForeground,
        );

    final descriptionStyle = theme.textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          color: isInvalid ? rise.danger : rise.mutedForeground(0.65),
          height: 1.4,
        ) ??
        TextStyle(
          fontSize: 14,
          color: isInvalid ? rise.danger : rise.mutedForeground(0.65),
          height: 1.4,
        );

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          DefaultTextStyle(
            style: labelStyle,
            child: label!,
          ),
        if (description != null)
          DefaultTextStyle(
            style: descriptionStyle,
            child: description!,
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

    // Hero `.checkbox`: flex gap-3; with description align start + mt-0.5 on control.
    final row = Row(
      crossAxisAlignment: hasDescription ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        if (hasDescription)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: control,
          )
        else
          control,
        const SizedBox(width: 12),
        Expanded(child: content),
      ],
    );

    Widget tree = MergeSemantics(
      child: Semantics(
        label: semanticLabel,
        child: row,
      ),
    );
    if (isDisabled) {
      tree = Opacity(opacity: rise.disabledOpacity, child: tree);
    }
    return tree;
  }
}

/// Builds a custom indicator; return null to use the default check / indeterminate dash.
typedef RiseCheckboxIndicatorBuilder =
    Widget? Function(BuildContext context, bool? value, bool indeterminate);

class _RiseCheckboxControl extends StatefulWidget {
  const _RiseCheckboxControl({
    required this.value,
    required this.tristate,
    required this.onChanged,
    required this.isDisabled,
    required this.isInvalid,
    required this.variant,
    required this.side,
    required this.iconSize,
    this.indicatorBuilder,
  });

  final bool? value;
  final bool tristate;
  final ValueChanged<bool?>? onChanged;
  final bool isDisabled;
  final bool isInvalid;
  final RiseCheckboxVariant variant;
  final double side;
  final double iconSize;
  final RiseCheckboxIndicatorBuilder? indicatorBuilder;

  @override
  State<_RiseCheckboxControl> createState() => _RiseCheckboxControlState();
}

class _RiseCheckboxControlState extends State<_RiseCheckboxControl> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTap() {
    final cb = widget.onChanged;
    if (cb == null) return;
    if (widget.tristate) {
      final v = widget.value;
      final next = v == false ? true : v == true ? null : false;
      cb(next);
      return;
    }
    cb(!(widget.value ?? false));
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final selected = widget.value == true;
    final indeterminate = widget.tristate && widget.value == null;
    final enabled = widget.onChanged != null;

    Color borderColor;
    Color? fillColor;
    List<BoxShadow> shadows;

    if (widget.variant == RiseCheckboxVariant.secondary) {
      shadows = [];
    } else {
      shadows = [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
      ];
    }

    if (!enabled) {
      borderColor = rise.border.withValues(alpha: 0.4);
      fillColor = rise.muted.withValues(alpha: 0.35);
    } else if (widget.isInvalid && !selected && !indeterminate) {
      borderColor = rise.danger;
      fillColor = widget.variant == RiseCheckboxVariant.secondary ? rise.muted : rise.surface;
    } else if (selected || indeterminate) {
      borderColor = Colors.transparent;
      fillColor = widget.isInvalid ? rise.danger : rise.accent;
    } else {
      borderColor = rise.border;
      fillColor = widget.variant == RiseCheckboxVariant.secondary ? rise.muted : rise.surface;
    }

    Color checkColor;
    if (!enabled) {
      checkColor = rise.defaultForeground.withValues(alpha: 0.35);
    } else if (widget.isInvalid && (selected || indeterminate)) {
      checkColor = rise.dangerForeground;
    } else {
      checkColor = rise.accentForeground;
    }

    Widget? indicator = widget.indicatorBuilder?.call(context, widget.value, indeterminate);
    if (indicator == null) {
      if (indeterminate) {
        indicator = Icon(Icons.remove, size: widget.iconSize + 1, color: checkColor);
      } else if (selected) {
        indicator = Icon(Icons.check, size: widget.iconSize + 1, color: checkColor);
      }
    }

    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (node, event) {
        if (!enabled) return KeyEventResult.ignored;
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.space) {
          _handleTap();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Semantics(
        checked: selected,
        mixed: indeterminate,
        enabled: enabled,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: enabled ? _handleTap : null,
            customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            splashColor: (widget.isInvalid ? rise.danger : rise.accent).withValues(alpha: 0.12),
            highlightColor: (widget.isInvalid ? rise.danger : rise.accent).withValues(alpha: 0.08),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: widget.side,
              height: widget.side,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: BorderRadius.circular(6),
                border: selected || indeterminate
                    ? null
                    : Border.all(color: borderColor, width: 1.5),
                boxShadow: shadows,
              ),
              child: indicator,
            ),
          ),
        ),
      ),
    );
  }
}
