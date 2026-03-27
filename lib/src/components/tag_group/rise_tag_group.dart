import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// How selection updates (HeroUI `selectionMode`).
enum RiseTagGroupSelectionMode {
  /// Tags are not selectable.
  none,

  /// At most one tag selected.
  single,

  /// Any number of tags selected.
  multiple,
}

/// Tag surface (HeroUI `variant`: default vs surface).
enum RiseTagVariant {
  default_,
  surface,
}

/// Tag dimensions (HeroUI `sm` / `md` / `lg`).
enum RiseTagSize {
  sm,
  md,
  lg,
}

/// Single tag pill — use inside [RiseTagGroup] or standalone.
///
/// Aligned with [HeroUI Tag](https://heroui.com/docs/react/components/tag-group) / `tag.css`.
class RiseTag extends StatelessWidget {
  const RiseTag({
    super.key,
    required this.child,
    this.selected = false,
    this.onTap,
    this.onRemove,
    this.isDisabled = false,
    this.size = RiseTagSize.md,
    this.variant = RiseTagVariant.default_,
    this.leading,
  });

  final Widget child;

  final bool selected;

  final VoidCallback? onTap;

  final VoidCallback? onRemove;

  final bool isDisabled;

  final RiseTagSize size;

  final RiseTagVariant variant;

  final Widget? leading;

  static EdgeInsets _padding(RiseTagSize s) {
    return switch (s) {
      RiseTagSize.sm => const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      RiseTagSize.md => const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      RiseTagSize.lg => const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    };
  }

  static double _fontSize(RiseTagSize s) {
    return switch (s) {
      RiseTagSize.sm => 12,
      RiseTagSize.md => 13,
      RiseTagSize.lg => 14,
    };
  }

  static double _iconSize(RiseTagSize s) {
    return switch (s) {
      RiseTagSize.sm => 14,
      RiseTagSize.md => 16,
      RiseTagSize.lg => 18,
    };
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final effectiveDisabled = isDisabled;

    final Color bg;
    final Color fg;
    final Color borderColor;
    switch (variant) {
      case RiseTagVariant.default_:
        if (selected) {
          bg = rise.accent.withValues(alpha: 0.12);
          fg = rise.accentSoftForeground;
          borderColor = rise.accent.withValues(alpha: 0.45);
        } else {
          bg = Colors.transparent;
          fg = rise.defaultForeground;
          borderColor = rise.border;
        }
      case RiseTagVariant.surface:
        if (selected) {
          bg = rise.accent.withValues(alpha: 0.16);
          fg = rise.accentSoftForeground;
          borderColor = rise.accent.withValues(alpha: 0.35);
        } else {
          bg = rise.muted;
          fg = rise.defaultForeground;
          borderColor = rise.border.withValues(alpha: 0.35);
        }
    }

    final fs = _fontSize(size);
    final iconSz = _iconSize(size);
    final pad = _padding(size);

    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: fs,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: effectiveDisabled ? fg.withValues(alpha: 0.45) : fg,
        ) ??
        TextStyle(
          fontSize: fs,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: effectiveDisabled ? fg.withValues(alpha: 0.45) : fg,
        );

    final body = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          IconTheme.merge(
            data: IconThemeData(size: iconSz, color: effectiveDisabled ? fg.withValues(alpha: 0.45) : fg),
            child: leading!,
          ),
          const SizedBox(width: 6),
        ],
        DefaultTextStyle.merge(
          style: textStyle,
          child: child,
        ),
      ],
    );

    Widget mainArea = Padding(padding: pad, child: body);
    if (onTap != null && !effectiveDisabled) {
      mainArea = InkWell(
        onTap: onTap,
        splashFactory: NoSplash.splashFactory,
        highlightColor: rise.defaultForeground.withValues(alpha: 0.06),
        child: mainArea,
      );
    }

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999),
      side: BorderSide(color: borderColor),
    );

    Widget? removeBtn;
    if (onRemove != null && !effectiveDisabled) {
      removeBtn = InkWell(
        onTap: onRemove,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
          child: Icon(Icons.close, size: iconSz, color: fg.withValues(alpha: 0.65)),
        ),
      );
    }

    Widget content = Material(
      color: bg,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          mainArea,
          ?removeBtn,
        ],
      ),
    );

    if (effectiveDisabled) {
      content = Opacity(opacity: rise.disabledOpacity, child: content);
    }

    return Semantics(
      button: true,
      selected: selected,
      enabled: !effectiveDisabled,
      child: content,
    );
  }
}

/// Focusable list of tags with selection, keyboard-friendly styling, and optional removal.
///
/// See [HeroUI TagGroup (web)](https://heroui.com/docs/react/components/tag-group) and
/// [tag-group.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/tag-group.css).
class RiseTagGroup<T extends Object> extends StatelessWidget {
  const RiseTagGroup({
    super.key,
    required this.values,
    required this.labelBuilder,
    required this.selected,
    required this.onChanged,
    this.selectionMode = RiseTagGroupSelectionMode.multiple,
    this.size = RiseTagSize.md,
    this.variant = RiseTagVariant.default_,
    this.spacing = 6,
    this.runSpacing = 6,
    this.disabledKeys,
    this.isDisabled = false,
    this.onRemove,
    this.leadingBuilder,
    this.label,
    this.description,
    this.errorMessage,
  });

  final List<T> values;

  final String Function(T value) labelBuilder;

  final Set<T> selected;

  final ValueChanged<Set<T>> onChanged;

  final RiseTagGroupSelectionMode selectionMode;

  final RiseTagSize size;

  final RiseTagVariant variant;

  /// Gap between tags (HeroUI `gap-1.5` ≈ 6).
  final double spacing;

  final double runSpacing;

  final Set<T>? disabledKeys;

  final bool isDisabled;

  /// When set, each tag shows a remove affordance (HeroUI `onRemove` / `Tag.RemoveButton`).
  final ValueChanged<T>? onRemove;

  final Widget? Function(T value)? leadingBuilder;

  final String? label;

  final String? description;

  final String? errorMessage;

  bool _isKeyDisabled(T v) {
    if (isDisabled) return true;
    return disabledKeys?.contains(v) ?? false;
  }

  void _handleTap(T v) {
    if (selectionMode == RiseTagGroupSelectionMode.none) return;
    if (_isKeyDisabled(v)) return;

    final next = Set<T>.from(selected);
    switch (selectionMode) {
      case RiseTagGroupSelectionMode.none:
        break;
      case RiseTagGroupSelectionMode.single:
        if (next.contains(v)) {
          next.remove(v);
        } else {
          next
            ..clear()
            ..add(v);
        }
      case RiseTagGroupSelectionMode.multiple:
        if (next.contains(v)) {
          next.remove(v);
        } else {
          next.add(v);
        }
    }
    onChanged(next);
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);

    final list = Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: values.map((v) {
        final isOn = selected.contains(v);
        final disabled = _isKeyDisabled(v);
        final lead = leadingBuilder?.call(v);

        return RiseTag(
          selected: isOn,
          size: size,
          variant: variant,
          isDisabled: disabled,
          leading: lead,
          onTap: selectionMode == RiseTagGroupSelectionMode.none || disabled
              ? null
              : () => _handleTap(v),
          onRemove: onRemove == null || disabled
              ? null
              : () => onRemove!(v),
          child: Text(labelBuilder(v)),
        );
      }).toList(),
    );

    final children = <Widget>[
      if (label != null) ...[
        Text(
          label!,
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
      ],
      if (description != null) ...[
        Text(
          description!,
          style: theme.textTheme.bodySmall?.copyWith(
            color: rise.mutedForeground(0.85),
          ),
        ),
        const SizedBox(height: 8),
      ],
      list,
      if (errorMessage != null) ...[
        const SizedBox(height: 8),
        Text(
          errorMessage!,
          style: theme.textTheme.bodySmall?.copyWith(color: rise.danger),
        ),
      ],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
