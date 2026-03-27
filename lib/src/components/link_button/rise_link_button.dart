import 'package:flutter/material.dart';

import '../button/rise_button.dart';

/// Inline text-style control (HeroUI [LinkButton](https://heroui.com/docs/native/components/link-button)):
/// ghost styling, no press highlight/scale, minimal padding — for “Terms”, “Privacy”, etc.
class RiseLinkButton extends StatelessWidget {
  const RiseLinkButton({
    super.key,
    required this.onPressed,
    this.child,
    this.label,
    this.size = RiseButtonSize.sm,
    this.isDisabled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
  }) : assert(child != null || label != null, 'Provide child or label');

  final VoidCallback? onPressed;

  final Widget? child;

  final String? label;

  final RiseButtonSize size;

  final bool isDisabled;

  /// Outer tap padding (HeroUI `h-auto p-0`–like; adjust per layout).
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final disabled = isDisabled || onPressed == null;
    final radius = switch (size) {
      RiseButtonSize.sm => 8.0,
      RiseButtonSize.md => 10.0,
      RiseButtonSize.lg => 12.0,
    };

    return RiseButtonScope(
      variant: RiseButtonVariant.ghost,
      size: size,
      isDisabled: disabled,
      borderRadius: radius,
      child: MergeSemantics(
        child: Semantics(
          button: true,
          enabled: !disabled,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: disabled ? null : onPressed,
              borderRadius: BorderRadius.circular(radius),
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              child: Padding(
                padding: padding,
                child: child ??
                    RiseButtonLabel(
                      label!,
                      textAlign: TextAlign.center,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
