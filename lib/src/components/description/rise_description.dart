import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Secondary helper text for labels and fields (HeroUI [Description](https://heroui.com/docs/native/components/description),
/// [description.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/description/description.tsx),
/// [description.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/description.css)).
///
/// Applies `text-xs text-muted text-wrap` styling — 12px, muted foreground, normal line wrap.
class RiseDescription extends StatelessWidget {
  const RiseDescription({
    super.key,
    required this.child,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  /// Plain text convenience (HeroUI default usage).
  RiseDescription.text(
    String data, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) : this(
          key: key,
          style: style,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          child: Text(data),
        );

  final Widget child;

  final TextStyle? style;

  final TextAlign? textAlign;

  final int? maxLines;

  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    // Hero `.description`: text-xs (~12px), text-muted, wrap / break-words
    final base = theme.textTheme.bodySmall?.copyWith(
          fontSize: 12,
          height: 1.5,
          fontWeight: FontWeight.w400,
          color: rise.mutedForeground(0.65),
        ) ??
        TextStyle(
          fontSize: 12,
          height: 1.5,
          fontWeight: FontWeight.w400,
          color: rise.mutedForeground(0.65),
        );

    return DefaultTextStyle.merge(
      style: base.merge(style),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
      softWrap: true,
      child: child,
    );
  }
}
