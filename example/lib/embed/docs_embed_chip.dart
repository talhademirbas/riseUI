import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Chip demos for docs iframe (`?embed=chip-*`) — aligned with
/// [HeroUI Chip](https://heroui.com/docs/react/components/chip).
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

  /// Default · Accent · Success · Warning · Danger (soft).
  static Widget usage(BuildContext context) {
    return _wrap(
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          const RiseChip(
            variant: RiseChipVariant.soft,
            color: RiseChipColor.default_,
            child: Text('Default'),
          ),
          const RiseChip(
            variant: RiseChipVariant.soft,
            color: RiseChipColor.accent,
            child: Text('Accent'),
          ),
          const RiseChip(
            variant: RiseChipVariant.soft,
            color: RiseChipColor.success,
            child: Text('Success'),
          ),
          const RiseChip(
            variant: RiseChipVariant.soft,
            color: RiseChipColor.warning,
            child: Text('Warning'),
          ),
          const RiseChip(
            variant: RiseChipVariant.soft,
            color: RiseChipColor.danger,
            child: Text('Danger'),
          ),
        ],
      ),
    );
  }

  /// One row per [RiseChipVariant], five semantic colors (md).
  static Widget variants(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );

    Widget variantBlock(String title, RiseChipVariant v) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: muted),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in _kColors)
                RiseChip(
                  variant: v,
                  color: c,
                  size: RiseChipSize.md,
                  child: const Text('Label'),
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      );
    }

    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          variantBlock('Primary', RiseChipVariant.primary),
          variantBlock('Secondary', RiseChipVariant.secondary),
          variantBlock('Tertiary', RiseChipVariant.tertiary),
          variantBlock('Soft', RiseChipVariant.soft),
        ],
      ),
    );
  }

  static Widget withIcons(BuildContext context) {
    return _wrap(
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          RiseChip(
            leading: const Icon(Icons.info_outline),
            color: RiseChipColor.default_,
            child: const Text('Information'),
          ),
          RiseChip(
            leading: const Icon(Icons.check_circle_outline),
            color: RiseChipColor.success,
            child: const Text('Completed'),
          ),
          RiseChip(
            leading: const Icon(Icons.schedule),
            color: RiseChipColor.warning,
            child: const Text('Pending'),
          ),
          RiseChip(
            leading: const Icon(Icons.close),
            color: RiseChipColor.danger,
            child: const Text('Failed'),
          ),
        ],
      ),
    );
  }

  static Widget statuses(BuildContext context) {
    final muted = context.riseTheme.mutedForeground(0.78);
    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              const RiseChip(
                leading: Icon(Icons.circle_outlined),
                child: Text('Default'),
              ),
              const RiseChip(
                leading: Icon(Icons.check_circle),
                variant: RiseChipVariant.primary,
                color: RiseChipColor.accent,
                child: Text('Active'),
              ),
              const RiseChip(
                leading: Icon(Icons.schedule),
                color: RiseChipColor.warning,
                child: Text('Pending'),
              ),
              RiseChip(
                leading: Icon(Icons.block, size: 16, color: muted),
                color: RiseChipColor.default_,
                child: Text(
                  'Inactive',
                  style: TextStyle(color: muted),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              const RiseChip(
                leading: Icon(Icons.auto_awesome_outlined),
                color: RiseChipColor.success,
                child: Text('New Feature'),
              ),
              const RiseChip(
                leading: Icon(Icons.inventory_2_outlined),
                color: RiseChipColor.accent,
                child: Text('Available'),
              ),
              const RiseChip(
                leading: Icon(Icons.science_outlined),
                color: RiseChipColor.warning,
                child: Text('Beta'),
              ),
              const RiseChip(
                leading: Icon(Icons.warning_amber_outlined),
                color: RiseChipColor.danger,
                child: Text('Deprecated'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
