import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Form / section label (HeroUI [Label](https://heroui.com/docs/native/components/label)).
class RiseLabel extends StatelessWidget {
  const RiseLabel({
    super.key,
    required this.child,
    this.style,
    this.textAlign,
    this.isRequired = false,
    this.isDisabled = false,
    this.isInvalid = false,
    this.requiredIndicator,
  });

  /// Convenience constructor for plain text.
  RiseLabel.text(
    String data, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    bool isRequired = false,
    bool isDisabled = false,
    bool isInvalid = false,
    Widget? requiredIndicator,
  }) : this(
         key: key,
         style: style,
         textAlign: textAlign,
         isRequired: isRequired,
         isDisabled: isDisabled,
         isInvalid: isInvalid,
         requiredIndicator: requiredIndicator,
         child: Text(data),
       );

  final TextStyle? style;

  final TextAlign? textAlign;

  final Widget child;

  final bool isRequired;

  final bool isDisabled;

  final bool isInvalid;

  final Widget? requiredIndicator;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final base = theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
          height: 1.35,
          color: isInvalid
              ? rise.danger
              : isDisabled
              ? rise.defaultForeground.withValues(alpha: 0.45)
              : rise.defaultForeground,
        ) ??
        TextStyle(
          fontWeight: FontWeight.w500,
          height: 1.35,
          color: isInvalid
              ? rise.danger
              : isDisabled
              ? rise.defaultForeground.withValues(alpha: 0.45)
              : rise.defaultForeground,
        );

    final indicator =
        requiredIndicator ??
        Text(
          '*',
          style: base.copyWith(color: rise.danger),
        );
    final content = isRequired
        ? Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: child),
              const SizedBox(width: 2),
              indicator,
            ],
          )
        : child;

    return DefaultTextStyle.merge(
      style: base.merge(style),
      textAlign: textAlign,
      child: content,
    );
  }
}
