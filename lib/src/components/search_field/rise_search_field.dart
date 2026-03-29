import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';
import '../input/rise_input.dart';
import '../description/rise_description.dart';
import '../field_error/rise_field_error.dart';
import '../label/rise_label.dart';

enum RiseSearchFieldVariant {
  /// Default: `shadow-field`, `--surface` group fill ([search-field.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/search-field.css) `.search-field__group`).
  primary,

  /// `shadow-none`, `--color-default` group shell (`.search-field--secondary`).
  secondary,
}

/// Search input with leading icon and clear control (HeroUI [SearchField](https://github.com/heroui-inc/heroui/tree/v3/packages/react/src/components/search-field),
/// [search-field.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/search-field.css)).
///
/// Group uses **[RiseInput.kMinHeight]** (48px) like [RiseInput] for a consistent tap target; CSS `h-9` is overridden for Rise parity.
/// **14px** radius (`rounded-field`), icon `size-4` + `ml-3`, clear **`size-5`** control with **12px** icon, `text-sm` field text.
class RiseSearchField extends StatefulWidget {
  const RiseSearchField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.description,
    this.errorMessage,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.autofocus = false,
    this.enabled = true,
    this.isRequired = false,
    this.isInvalid = false,
    this.fullWidth = false,
    this.variant = RiseSearchFieldVariant.primary,
    this.searchIcon,
    this.clearIcon,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? label;
  final Widget? description;
  final Widget? errorMessage;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final bool autofocus;
  final bool enabled;
  final bool isRequired;
  final bool isInvalid;
  final bool fullWidth;
  final RiseSearchFieldVariant variant;
  final Widget? searchIcon;
  final Widget? clearIcon;

  /// Same as [RiseInput.kMinHeight] (48).
  static const double kMinHeight = RiseInput.kMinHeight;

  /// `rounded-field` (matches [RiseInput]).
  static const double kRadius = 14;

  @override
  State<RiseSearchField> createState() => _RiseSearchFieldState();
}

class _RiseSearchFieldState extends State<RiseSearchField> {
  late final TextEditingController _ownedController;
  late final FocusNode _internalFocusNode;
  bool _ownsController = false;
  bool _ownsFocusNode = false;
  bool _hovering = false;

  TextEditingController get _effectiveController => widget.controller ?? _ownedController;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _internalFocusNode;

  bool get _focusWithin => _effectiveFocusNode.hasFocus;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _ownedController = TextEditingController();
      _ownsController = true;
    } else {
      _ownedController = widget.controller!;
    }
    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
      _ownsFocusNode = true;
    } else {
      _internalFocusNode = widget.focusNode!;
    }
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_onFocusChanged);
    if (_ownsController) {
      _ownedController.dispose();
    }
    if (_ownsFocusNode) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  Color _baseFill(RiseThemeData rise) {
    return widget.variant == RiseSearchFieldVariant.primary ? rise.surface : rise.surfaceSecondary;
  }

  Color _resolveFill(RiseThemeData rise, ThemeData theme) {
    final base = _baseFill(rise);
    if (!widget.enabled) {
      return base.withValues(alpha: 0.65);
    }
    if (widget.isInvalid) {
      return Color.lerp(base, rise.muted, 0.12)!;
    }
    if (_hovering && !_focusWithin) {
      if (widget.variant == RiseSearchFieldVariant.primary) {
        return Color.lerp(base, rise.muted, 0.22)!;
      }
      return Color.lerp(base, rise.resolveDefaultHover(), 0.28)!;
    }
    if (_focusWithin && widget.variant == RiseSearchFieldVariant.secondary) {
      return rise.surfaceSecondary;
    }
    return base;
  }

  Color _borderColor(RiseThemeData rise) {
    if (!widget.enabled) {
      return rise.border.withValues(alpha: rise.disabledOpacity);
    }
    if (widget.isInvalid) {
      return rise.danger;
    }
    if (_focusWithin) {
      return rise.accent;
    }
    return rise.border;
  }

  double _borderWidth(RiseThemeData rise) {
    if (!widget.enabled) return 1;
    if (widget.isInvalid) {
      return _focusWithin ? 2 : 1.5;
    }
    if (_focusWithin) return 2;
    return 1;
  }

  List<BoxShadow>? _primaryShadows(RiseThemeData rise, Brightness brightness) {
    if (widget.variant != RiseSearchFieldVariant.primary) return null;
    if (!widget.enabled) return null;
    if (brightness == Brightness.dark) return null;
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        offset: const Offset(0, 1),
        blurRadius: 2,
      ),
    ];
  }

  void _clear() {
    if (!widget.enabled) return;
    _effectiveController.clear();
    widget.onChanged?.call('');
    widget.onClear?.call();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final hint = widget.hintText ?? 'Search...';
    final iconColor = rise.mutedForeground(0.55);

    Widget group = MouseRegion(
      onEnter: (_) {
        if (!widget.enabled) return;
        setState(() => _hovering = true);
      },
      onExit: (_) => setState(() => _hovering = false),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: _effectiveController,
        builder: (context, value, _) {
          final hasText = value.text.isNotEmpty;
          final fill = _resolveFill(rise, theme);
          final borderSide = BorderSide(color: _borderColor(rise), width: _borderWidth(rise));

          Widget field = TextField(
            controller: _effectiveController,
            focusNode: _effectiveFocusNode,
            autofocus: widget.autofocus,
            enabled: widget.enabled,
            textInputAction: TextInputAction.search,
            style: theme.textTheme.bodyMedium?.copyWith(
                  color: rise.defaultForeground,
                  fontSize: 14,
                  height: 20 / 14,
                ) ??
                TextStyle(
                  color: rise.defaultForeground,
                  fontSize: 14,
                  height: 20 / 14,
                ),
            cursorColor: rise.accent,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              filled: false,
              hintText: hint,
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: rise.mutedForeground(0.65),
                    fontSize: 14,
                    height: 20 / 14,
                  ) ??
                  TextStyle(
                    color: rise.mutedForeground(0.65),
                    fontSize: 14,
                    height: 20 / 14,
                  ),
              contentPadding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            ),
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
          );

          field = Theme(
            data: theme.copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
            ),
            child: field,
          );

          final searchGlyph = widget.searchIcon ??
              Icon(
                Icons.search,
                size: 16,
                color: iconColor,
              );

          final clearSlot = SizedBox(
            width: 28,
            child: Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: hasText && widget.enabled ? 1 : 0,
                duration: const Duration(milliseconds: 150),
                child: IgnorePointer(
                  ignoring: !hasText || !widget.enabled,
                  child: Theme(
                    data: theme.copyWith(splashFactory: NoSplash.splashFactory),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      tooltip: 'Clear',
                      onPressed: _clear,
                      icon: widget.clearIcon ??
                          Icon(
                            Icons.close,
                            size: 12,
                            color: iconColor,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          );

          Widget shell = ConstrainedBox(
            constraints: const BoxConstraints(minHeight: RiseInput.kMinHeight),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: fill,
                borderRadius: BorderRadius.circular(RiseSearchField.kRadius),
                border: Border.fromBorderSide(borderSide),
                boxShadow: _primaryShadows(rise, theme.brightness),
              ),
              child: Material(
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: searchGlyph,
                    ),
                    Expanded(child: field),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: clearSlot,
                    ),
                  ],
                ),
              ),
            ),
          );

          return shell;
        },
      ),
    );

    if (widget.fullWidth) {
      group = SizedBox(width: double.infinity, child: group);
    }

    final children = <Widget>[];

    if (widget.label != null) {
      children.add(
        RiseLabel(
          isRequired: widget.isRequired,
          isInvalid: widget.isInvalid,
          isDisabled: !widget.enabled,
          child: widget.label!,
        ),
      );
    }

    if (widget.description != null && !widget.isInvalid) {
      if (widget.label != null) {
        children.add(const SizedBox(height: 4));
      }
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: RiseDescription(child: widget.description!),
        ),
      );
    }

    if (widget.label != null || (widget.description != null && !widget.isInvalid)) {
      children.add(const SizedBox(height: 4));
    }

    children.add(group);

    if (widget.errorMessage != null && widget.isInvalid) {
      children.add(const SizedBox(height: 6));
      children.add(RiseFieldError(child: widget.errorMessage!));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
