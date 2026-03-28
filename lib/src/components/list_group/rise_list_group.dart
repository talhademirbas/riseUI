import 'package:flutter/material.dart';

import '../../theme/rise_theme.dart';
import '../separator/rise_separator.dart';
import '../surface/rise_surface.dart';

/// Default trailing chevron size — [DEFAULT_ICON_SIZE](https://github.com/heroui-inc/heroui-native/blob/main/src/components/list-group/list-group.constants.ts) (16).
const double kRiseListGroupSuffixIconSize = 16;

/// Horizontal inset for hairlines between rows — Hero `Separator className="mx-4"` (~16px).
const double kRiseListGroupDividerInset = 16;

/// Row gap (`gap-3`) — [list-group.styles.ts](https://github.com/heroui-inc/heroui-native/blob/main/src/components/list-group/list-group.styles.ts).
const double kRiseListGroupItemGap = 12;

/// Item padding (`p-4`).
const EdgeInsets kRiseListGroupItemPadding = EdgeInsets.all(16);

/// Vertical list on a [RiseSurface] shell (HeroUI [ListGroup](https://heroui.com/docs/native/components/list-group)).
///
/// Set [showDividers] to insert [RiseListGroupInsetSeparator] between each child.
/// For full Hero parity, use `showDividers: false` and place [RiseListGroupInsetSeparator]
/// (or [RiseSeparator]) between [RiseListGroupItem]s yourself.
class RiseListGroup extends StatelessWidget {
  const RiseListGroup({
    super.key,
    required this.children,
    this.variant = RiseSurfaceVariant.primary,
    this.borderRadius = 16,
    this.padding = EdgeInsets.zero,
    this.showDividers = false,
  });

  final List<Widget> children;

  /// Passed through to the underlying [RiseSurface] (`default` → [RiseSurfaceVariant.primary], etc.).
  final RiseSurfaceVariant variant;

  final double borderRadius;

  final EdgeInsetsGeometry padding;

  /// When true, inserts [RiseListGroupInsetSeparator] between successive children.
  final bool showDividers;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0 && showDividers) {
        items.add(const RiseListGroupInsetSeparator());
      }
      items.add(children[i]);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: RiseSurface(
        variant: variant,
        padding: padding,
        borderRadius: borderRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: items,
        ),
      ),
    );
  }
}

/// Inset horizontal rule between [RiseListGroupItem]s — aligns with Hero `Separator` `mx-4`.
class RiseListGroupInsetSeparator extends StatelessWidget {
  const RiseListGroupInsetSeparator({
    super.key,
    this.inset = kRiseListGroupDividerInset,
    this.tone = RiseSeparatorTone.default_,
    this.color,
  });

  final double inset;

  final RiseSeparatorTone tone;

  /// When set, used instead of [tone] (legacy divider color from previous [RiseListGroup]).
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (color != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: inset),
        child: Divider(height: 1, thickness: 1, color: color),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: inset),
      child: RiseSeparator(tone: tone),
    );
  }
}

/// Single tappable row (`flex-row items-center p-4 gap-3`).
class RiseListGroupItem extends StatelessWidget {
  const RiseListGroupItem({
    super.key,
    this.prefix,
    required this.content,
    this.suffix = const RiseListGroupItemSuffix(),
    this.onTap,
    this.enabled = true,
  });

  final Widget? prefix;

  /// Typically a [RiseListGroupItemContent] wrapping title / description.
  final Widget content;

  /// Pass `null` to omit trailing content (Hero default is chevron when using [RiseListGroupItemSuffix]).
  final Widget? suffix;

  final VoidCallback? onTap;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    Widget row = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (prefix != null) ...[
          prefix!,
          const SizedBox(width: kRiseListGroupItemGap),
        ],
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: content,
          ),
        ),
        if (suffix != null) ...[
          const SizedBox(width: kRiseListGroupItemGap),
          suffix!,
        ],
      ],
    );

    row = Padding(padding: kRiseListGroupItemPadding, child: row);

    row = Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: row,
      ),
    );

    if (!enabled) {
      row = Opacity(opacity: 0.45, child: row);
    }

    return IconTheme.merge(
      data: IconThemeData(color: rise.defaultForeground, size: 22),
      child: row,
    );
  }
}

/// Leading slot (icons are typically **22** in Hero examples).
class RiseListGroupItemPrefix extends StatelessWidget {
  const RiseListGroupItemPrefix({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

/// Flex-1 content wrapper — use a [Column] with [RiseListGroupItemTitle] / [RiseListGroupItemDescription].
class RiseListGroupItemContent extends StatelessWidget {
  const RiseListGroupItemContent({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

/// `text-base text-foreground font-medium`
class RiseListGroupItemTitle extends StatelessWidget {
  const RiseListGroupItemTitle(
    this.data, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
  });

  final String data;

  final TextStyle? style;

  final int? maxLines;

  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Text(
      data,
      maxLines: maxLines,
      overflow: overflow,
      style:
          style ??
          TextStyle(
            fontSize: 16,
            height: 24 / 16,
            fontWeight: FontWeight.w500,
            color: rise.defaultForeground,
          ),
    );
  }
}

/// `text-sm text-muted`
class RiseListGroupItemDescription extends StatelessWidget {
  const RiseListGroupItemDescription(
    this.data, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
  });

  final String data;

  final TextStyle? style;

  final int? maxLines;

  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Text(
      data,
      maxLines: maxLines,
      overflow: overflow,
      style:
          style ??
          TextStyle(
            fontSize: 14,
            height: 20 / 14,
            fontWeight: FontWeight.w400,
            color: rise.mutedForeground(0.65),
          ),
    );
  }
}

/// Trailing slot; default is `chevron_right` ([ListGroupIconProps](https://github.com/heroui-inc/heroui-native/blob/main/src/components/list-group/list-group.types.ts)).
class RiseListGroupItemSuffix extends StatelessWidget {
  const RiseListGroupItemSuffix({
    super.key,
    this.child,
    this.iconSize = kRiseListGroupSuffixIconSize,
    this.iconColor,
  });

  final Widget? child;

  final double iconSize;

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    if (child != null) {
      return child!;
    }
    return Icon(
      Icons.chevron_right,
      size: iconSize,
      color: iconColor ?? rise.mutedForeground(0.65),
    );
  }
}
