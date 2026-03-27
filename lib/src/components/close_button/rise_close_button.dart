import 'package:flutter/material.dart';

import '../button/rise_button.dart';
import '../../theme/rise_theme.dart';

/// Props for the default close icon ([Icons.close]) when [RiseCloseButton.child] is null.
///
/// Maps to HeroUI Native `CloseButtonIconProps` (`iconProps`).
@immutable
class RiseCloseButtonIconProps {
  const RiseCloseButtonIconProps({
    this.size = 20,
    this.color,
  });

  /// Icon size in logical pixels (HeroUI default **20** in API table).
  final double size;

  /// Icon color; when null, a muted foreground is derived from [RiseThemeData].
  final Color? color;
}

/// Icon button for dismissing dialogs, sheets, or banners.
///
/// Wraps [RiseButton] with HeroUI defaults: [RiseButtonVariant.tertiary],
/// [RiseButtonSize.sm], [RiseButton.isIconOnly] `true`. All other [RiseButton]
/// parameters can still be overridden.
///
/// See [HeroUI CloseButton (web)](https://heroui.com/docs/react/components/close-button) and
/// [Native](https://heroui.com/docs/native/components/close-button).
class RiseCloseButton extends StatelessWidget {
  const RiseCloseButton({
    super.key,
    required this.onPressed,
    this.iconProps = const RiseCloseButtonIconProps(),
    this.child,
    this.variant = RiseButtonVariant.tertiary,
    this.size = RiseButtonSize.sm,
    this.isIconOnly = true,
    this.feedback = RiseButtonFeedback.scaleHighlight,
    this.animation,
    this.isDisabled = false,
    this.autofocus = false,
    this.focusNode,
  });

  final VoidCallback? onPressed;

  /// Customization for the default close icon (ignored when [child] is non-null).
  final RiseCloseButtonIconProps iconProps;

  /// Replaces the default close icon. When null, [Icons.close] is used.
  final Widget? child;

  final RiseButtonVariant variant;

  final RiseButtonSize size;

  final bool isIconOnly;

  final RiseButtonFeedback feedback;

  final RiseButtonAnimation? animation;

  final bool isDisabled;

  final bool autofocus;

  final FocusNode? focusNode;

  Color _defaultIconColor(BuildContext context) {
    final theme = context.riseTheme;
    return theme.defaultForeground.withValues(alpha: 0.55);
  }

  @override
  Widget build(BuildContext context) {
    final Widget content = child ??
        Icon(
          Icons.close,
          size: iconProps.size,
          color: iconProps.color ?? _defaultIconColor(context),
        );

    return RiseButton(
      onPressed: onPressed,
      variant: variant,
      size: size,
      isIconOnly: isIconOnly,
      feedback: feedback,
      animation: animation,
      isDisabled: isDisabled,
      autofocus: autofocus,
      focusNode: focusNode,
      child: content,
    );
  }
}
