import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

enum RiseSearchFieldVariant { primary, secondary }

/// Text field with search icon (HeroUI [SearchField](https://heroui.com/docs/native/components/search-field)).
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

  @override
  State<RiseSearchField> createState() => _RiseSearchFieldState();
}

class _RiseSearchFieldState extends State<RiseSearchField> {
  late final TextEditingController _internalController;

  TextEditingController get _effectiveController => widget.controller ?? _internalController;

  @override
  void initState() {
    super.initState();
    _internalController = TextEditingController();
  }

  @override
  void dispose() {
    _internalController.dispose();
    super.dispose();
  }

  InputDecoration _decoration(BuildContext context, bool hasValue) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final fill = widget.variant == RiseSearchFieldVariant.secondary
        ? rise.muted
        : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35);
    final iconColor = rise.mutedForeground(0.55);
    final borderColor = widget.isInvalid ? rise.danger : rise.border;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: borderColor),
    );
    return InputDecoration(
      isDense: true,
      hintText: widget.hintText ?? 'Search...',
      prefixIcon: widget.searchIcon ?? Icon(Icons.search, color: iconColor),
      suffixIcon: hasValue
          ? IconButton(
              tooltip: 'Clear',
              onPressed: widget.enabled
                  ? () {
                      _effectiveController.clear();
                      widget.onChanged?.call('');
                      widget.onClear?.call();
                      setState(() {});
                    }
                  : null,
              icon: widget.clearIcon ?? Icon(Icons.close, size: 16, color: iconColor),
            )
          : null,
      filled: true,
      fillColor: fill,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: widget.isInvalid ? rise.danger : rise.accent, width: 2),
      ),
      disabledBorder: border.copyWith(
        borderSide: BorderSide(color: rise.border.withValues(alpha: 0.45)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final field = ValueListenableBuilder<TextEditingValue>(
      valueListenable: _effectiveController,
      builder: (context, value, _) {
        final hasValue = value.text.isNotEmpty;
        return TextField(
          controller: _effectiveController,
          focusNode: widget.focusNode,
          decoration: _decoration(context, hasValue),
          style: theme.textTheme.bodyLarge?.copyWith(color: rise.defaultForeground),
          textInputAction: TextInputAction.search,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          autofocus: widget.autofocus,
          enabled: widget.enabled,
          cursorColor: rise.accent,
        );
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          DefaultTextStyle.merge(
            style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: widget.isInvalid ? rise.danger : rise.defaultForeground,
                ) ??
                TextStyle(
                  fontWeight: FontWeight.w600,
                  color: widget.isInvalid ? rise.danger : rise.defaultForeground,
                ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.label!,
                if (widget.isRequired) ...[
                  const SizedBox(width: 2),
                  Text('*', style: TextStyle(color: rise.danger)),
                ],
              ],
            ),
          ),
        if (widget.description != null && !widget.isInvalid) ...[
          const SizedBox(height: 4),
          DefaultTextStyle.merge(
            style: theme.textTheme.bodySmall?.copyWith(color: rise.mutedForeground()) ??
                TextStyle(color: rise.mutedForeground()),
            child: widget.description!,
          ),
        ],
        if (widget.label != null || widget.description != null) const SizedBox(height: 8),
        if (widget.fullWidth) SizedBox(width: double.infinity, child: field) else field,
        if (widget.errorMessage != null && widget.isInvalid) ...[
          const SizedBox(height: 6),
          DefaultTextStyle.merge(
            style: theme.textTheme.bodySmall?.copyWith(color: rise.danger) ??
                TextStyle(color: rise.danger),
            child: widget.errorMessage!,
          ),
        ],
      ],
    );
  }
}
