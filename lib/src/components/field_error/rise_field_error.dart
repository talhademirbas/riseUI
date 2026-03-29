import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';

/// Validation / error line under a field (HeroUI [FieldError](https://heroui.com/docs/native/components/field-error),
/// [field-error.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/field-error/field-error.tsx),
/// [field-error.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/field-error.css)).
///
/// When [visible] is false, the line collapses with opacity/height-style motion (Hero `h-0 opacity-0` →
/// `h-auto opacity-100`). Typography: `text-xs text-danger`, horizontal padding `px-1`.
class RiseFieldError extends StatelessWidget {
  const RiseFieldError({
    super.key,
    required this.child,
    this.visible = true,
    this.style,
    this.textAlign,
    this.semanticLabel,
  });

  /// Plain text convenience.
  RiseFieldError.text(
    String data, {
    Key? key,
    bool visible = true,
    TextStyle? style,
    TextAlign? textAlign,
    String? semanticLabel,
  }) : this(
          key: key,
          visible: visible,
          style: style,
          textAlign: textAlign,
          semanticLabel: semanticLabel,
          child: Text(data),
        );

  final Widget child;

  /// When false, collapses with animation (Hero `data-[visible=true]`).
  final bool visible;

  final TextStyle? style;

  final TextAlign? textAlign;

  /// Announced by screen readers when [visible] (defaults to plain text if [child] is [Text]).
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    // Hero `.field-error`: text-xs, text-danger, px-1, wrap-break-word
    final base = theme.textTheme.bodySmall?.copyWith(
          fontSize: 12,
          height: 1.5,
          color: rise.danger,
          fontWeight: FontWeight.w500,
        ) ??
        TextStyle(
          fontSize: 12,
          height: 1.5,
          color: rise.danger,
          fontWeight: FontWeight.w500,
        );

    Widget body = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: DefaultTextStyle.merge(
        style: base.merge(style),
        textAlign: textAlign,
        softWrap: true,
        child: child,
      ),
    );

    if (visible) {
      final label = semanticLabel ?? _plainText(child);
      if (label != null) {
        body = Semantics(
          liveRegion: true,
          label: label,
          child: body,
        );
      }
    } else {
      body = ExcludeSemantics(child: body);
    }

    final reduceMotion = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    // Hero: opacity ~150ms, height ~350ms — one duration; motion-reduce → no transition.
    final duration = reduceMotion ? Duration.zero : const Duration(milliseconds: 300);

    return AnimatedCrossFade(
      firstChild: const SizedBox(width: double.infinity),
      secondChild: Align(alignment: Alignment.centerLeft, child: body),
      crossFadeState: visible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: duration,
      sizeCurve: Curves.easeOutCubic,
      firstCurve: Curves.easeOutCubic,
      secondCurve: Curves.easeOutCubic,
    );
  }

  static String? _plainText(Widget widget) {
    if (widget is Text && widget.data != null) return widget.data;
    return null;
  }
}
