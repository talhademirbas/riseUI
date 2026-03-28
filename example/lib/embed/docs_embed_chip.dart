import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Chip demos — [chip.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/chip/chip.stories.tsx),
/// [chip.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/chip.css).
class DocsEmbedChip {
  DocsEmbedChip._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static const List<RiseChipColor> _kColors = [
    RiseChipColor.default_,
    RiseChipColor.accent,
    RiseChipColor.success,
    RiseChipColor.warning,
    RiseChipColor.danger,
  ];

  /// `Default` — Storybook `defaultArgs`: `color: accent`, `variant: secondary`, label "Label".
  static Widget usage(BuildContext context) {
    return _wrap(
      const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseChip(
            color: RiseChipColor.accent,
            variant: RiseChipVariant.secondary,
            child: Text('Label'),
          ),
        ],
      ),
    );
  }

  /// `Sizes` — sm · md · lg (same color/variant as default story).
  static Widget sizes(BuildContext context) {
    return _wrap(
      const Wrap(
        spacing: 12,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          RiseChip(
            color: RiseChipColor.accent,
            variant: RiseChipVariant.secondary,
            size: RiseChipSize.sm,
            child: Text('Small'),
          ),
          RiseChip(
            color: RiseChipColor.accent,
            variant: RiseChipVariant.secondary,
            size: RiseChipSize.md,
            child: Text('Medium'),
          ),
          RiseChip(
            color: RiseChipColor.accent,
            variant: RiseChipVariant.secondary,
            size: RiseChipSize.lg,
            child: Text('Large'),
          ),
        ],
      ),
    );
  }

  /// `WithIcon` — leading + label + trailing (circle-outline icons like Hero `gravity-ui:circle-dashed`).
  static Widget withIcons(BuildContext context) {
    return _wrap(
      const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseChip(
            color: RiseChipColor.accent,
            variant: RiseChipVariant.secondary,
            leading: Icon(Icons.circle_outlined, size: 14),
            trailing: Icon(Icons.circle_outlined, size: 14),
            child: Text('Label'),
          ),
        ],
      ),
    );
  }

  /// `Statuses` — one row per variant; dot + label; semantic colors (Information / Completed / Pending / Failed).
  static Widget statuses(BuildContext context) {
    Widget dot() => const Icon(Icons.circle, size: 6);

    Widget row(RiseChipVariant v) {
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          RiseChip(
            variant: v,
            color: RiseChipColor.default_,
            leading: dot(),
            child: const Text('Information'),
          ),
          RiseChip(
            variant: v,
            color: RiseChipColor.success,
            leading: dot(),
            child: const Text('Completed'),
          ),
          RiseChip(
            variant: v,
            color: RiseChipColor.warning,
            leading: dot(),
            child: const Text('Pending'),
          ),
          RiseChip(
            variant: v,
            color: RiseChipColor.danger,
            leading: dot(),
            child: const Text('Failed'),
          ),
        ],
      );
    }

    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );

    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('primary', style: muted),
          const SizedBox(height: 8),
          row(RiseChipVariant.primary),
          const SizedBox(height: 16),
          Text('secondary', style: muted),
          const SizedBox(height: 8),
          row(RiseChipVariant.secondary),
          const SizedBox(height: 16),
          Text('tertiary', style: muted),
          const SizedBox(height: 8),
          row(RiseChipVariant.tertiary),
          const SizedBox(height: 16),
          Text('soft', style: muted),
          const SizedBox(height: 8),
          row(RiseChipVariant.soft),
        ],
      ),
    );
  }

  /// `Variants` — sizes lg/md/sm × variant rows × colors (uses [Wrap] to stay narrow-safe).
  static Widget variants(BuildContext context) {
    final theme = Theme.of(context);
    final subtle = theme.textTheme.labelSmall?.copyWith(
      color: context.riseTheme.mutedForeground(0.75),
    );
    final heading = theme.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w600,
      color: context.riseTheme.mutedForeground(0.85),
    );

    double iconSz(RiseChipSize s) => switch (s) {
          RiseChipSize.sm => 12,
          RiseChipSize.md => 14,
          RiseChipSize.lg => 16,
        };

    Widget iconPair(RiseChipSize s) => Icon(Icons.circle_outlined, size: iconSz(s));

    Widget cell(RiseChipColor c, RiseChipVariant v, RiseChipSize s) {
      return RiseChip(
        color: c,
        variant: v,
        size: s,
        leading: iconPair(s),
        trailing: iconPair(s),
        child: const Text('Label'),
      );
    }

    Widget variantBlock(RiseChipSize size, List<RiseChipVariant> variantOrder) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            switch (size) {
              RiseChipSize.lg => 'lg',
              RiseChipSize.md => 'md',
              RiseChipSize.sm => 'sm',
            },
            style: heading,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              SizedBox(width: 72, child: Text('', style: subtle)),
              for (final c in _kColors)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    switch (c) {
                      RiseChipColor.default_ => 'default',
                      RiseChipColor.accent => 'accent',
                      RiseChipColor.success => 'success',
                      RiseChipColor.warning => 'warning',
                      RiseChipColor.danger => 'danger',
                    },
                    style: subtle,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          RiseSeparator(tone: RiseSeparatorTone.default_),
          const SizedBox(height: 12),
          for (final v in variantOrder) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 72,
                    child: Text(
                      switch (v) {
                        RiseChipVariant.primary => 'primary',
                        RiseChipVariant.secondary => 'secondary',
                        RiseChipVariant.tertiary => 'tertiary',
                        RiseChipVariant.soft => 'soft',
                      },
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.start,
                      children: [
                        for (final c in _kColors) cell(c, v, size),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      );
    }

    const order = [
      RiseChipVariant.primary,
      RiseChipVariant.secondary,
      RiseChipVariant.tertiary,
      RiseChipVariant.soft,
    ];

    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          variantBlock(RiseChipSize.lg, order),
          const SizedBox(height: 24),
          RiseSeparator(tone: RiseSeparatorTone.default_),
          const SizedBox(height: 24),
          variantBlock(RiseChipSize.md, order),
          const SizedBox(height: 24),
          RiseSeparator(tone: RiseSeparatorTone.default_),
          const SizedBox(height: 24),
          variantBlock(RiseChipSize.sm, order),
        ],
      ),
    );
  }
}
