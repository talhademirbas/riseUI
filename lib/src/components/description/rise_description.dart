import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Secondary helper text under a label (HeroUI [Description](https://heroui.com/docs/native/components/description)).
class RiseDescription extends StatelessWidget {
  const RiseDescription({
    super.key,
    required this.child,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final Widget child;

  final TextStyle? style;

  final TextAlign? textAlign;

  final int? maxLines;

  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final base = theme.textTheme.bodyMedium?.copyWith(
          color: rise.mutedForeground(0.65),
          height: 1.45,
        ) ??
        TextStyle(color: rise.mutedForeground(0.65), height: 1.45);

    return DefaultTextStyle.merge(
      style: base.merge(style),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
      child: child,
    );
  }
}
