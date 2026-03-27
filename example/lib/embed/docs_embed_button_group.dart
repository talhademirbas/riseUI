import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Button group demos for docs iframe (`?embed=button-group-*`).
class DocsEmbedButtonGroup {
  DocsEmbedButtonGroup._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static void _noop() {}

  /// Second / third segments with leading separator (HeroUI pattern).
  static Widget _segmentAfterFirst(String label) {
    return RiseButton(
      onPressed: _noop,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RiseButtonGroupSeparator(),
          Text(label),
        ],
      ),
    );
  }

  static Widget usage(BuildContext context) {
    return _wrap(
      RiseButtonGroup(
        variant: RiseButtonVariant.primary,
        children: [
          RiseButton(label: 'First', onPressed: _noop),
          _segmentAfterFirst('Second'),
          _segmentAfterFirst('Third'),
        ],
      ),
    );
  }

  static Widget variants(BuildContext context) {
    Widget row(RiseButtonVariant v, String title) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: context.riseTheme.mutedForeground(0.8),
                  ),
            ),
            const SizedBox(height: 8),
            RiseButtonGroup(
              variant: v,
              children: [
                RiseButton(label: 'First', onPressed: _noop),
                _segmentAfterFirst('Second'),
                _segmentAfterFirst('Third'),
              ],
            ),
          ],
        ),
      );
    }

    return _wrap(
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            row(RiseButtonVariant.primary, 'Primary'),
            row(RiseButtonVariant.secondary, 'Secondary'),
            row(RiseButtonVariant.tertiary, 'Tertiary'),
            row(RiseButtonVariant.outline, 'Outline'),
            row(RiseButtonVariant.ghost, 'Ghost'),
            row(RiseButtonVariant.danger, 'Danger'),
          ],
        ),
      ),
    );
  }

  static Widget sizes(BuildContext context) {
    Widget block(String title, RiseButtonSize sz) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: context.riseTheme.mutedForeground(0.8),
                  ),
            ),
            const SizedBox(height: 8),
            RiseButtonGroup(
              size: sz,
              variant: RiseButtonVariant.primary,
              children: [
                RiseButton(label: 'First', onPressed: _noop),
                _segmentAfterFirst('Second'),
                _segmentAfterFirst('Third'),
              ],
            ),
          ],
        ),
      );
    }

    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          block('Small', RiseButtonSize.sm),
          block('Medium (default)', RiseButtonSize.md),
          block('Large', RiseButtonSize.lg),
        ],
      ),
    );
  }

  static Widget orientation(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.8),
        );
    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Horizontal', style: muted),
          const SizedBox(height: 8),
          RiseButtonGroup(
            orientation: RiseButtonGroupOrientation.horizontal,
            variant: RiseButtonVariant.outline,
            children: [
              RiseButton(
                isIconOnly: true,
                onPressed: _noop,
                child: const Icon(Icons.format_align_left),
              ),
              RiseButton(
                isIconOnly: true,
                onPressed: _noop,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const RiseButtonGroupSeparator(),
                    const Icon(Icons.format_align_center),
                  ],
                ),
              ),
              RiseButton(
                isIconOnly: true,
                onPressed: _noop,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const RiseButtonGroupSeparator(),
                    const Icon(Icons.format_align_right),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('Vertical', style: muted),
          const SizedBox(height: 8),
          RiseButtonGroup(
            orientation: RiseButtonGroupOrientation.vertical,
            variant: RiseButtonVariant.outline,
            children: [
              RiseButton(label: 'Top', onPressed: _noop),
              RiseButton(
                onPressed: _noop,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const RiseButtonGroupSeparator(),
                    const Text('Middle'),
                  ],
                ),
              ),
              RiseButton(
                onPressed: _noop,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const RiseButtonGroupSeparator(),
                    const Text('Bottom'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget withIcons(BuildContext context) {
    return _wrap(
      RiseButtonGroup(
        variant: RiseButtonVariant.outline,
        children: [
          RiseButton(
            isIconOnly: true,
            onPressed: _noop,
            child: const Icon(Icons.search),
          ),
          RiseButton(
            isIconOnly: true,
            onPressed: _noop,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const RiseButtonGroupSeparator(),
                const Icon(Icons.add),
              ],
            ),
          ),
          RiseButton(
            isIconOnly: true,
            onPressed: _noop,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const RiseButtonGroupSeparator(),
                const Icon(Icons.delete_outline),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget fullWidth(BuildContext context) {
    return _wrap(
      RiseButtonGroup(
        fullWidth: true,
        variant: RiseButtonVariant.outline,
        children: [
          RiseButton(
            isIconOnly: true,
            onPressed: _noop,
            child: const Icon(Icons.format_align_left),
          ),
          RiseButton(
            isIconOnly: true,
            onPressed: _noop,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const RiseButtonGroupSeparator(),
                const Icon(Icons.format_align_center),
              ],
            ),
          ),
          RiseButton(
            isIconOnly: true,
            onPressed: _noop,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const RiseButtonGroupSeparator(),
                const Icon(Icons.format_align_right),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget disabled(BuildContext context) {
    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RiseButtonGroup(
            isDisabled: true,
            variant: RiseButtonVariant.primary,
            children: [
              RiseButton(label: 'First', onPressed: _noop),
              _segmentAfterFirst('Second'),
              _segmentAfterFirst('Third'),
            ],
          ),
          const SizedBox(height: 20),
          RiseButtonGroup(
            isDisabled: true,
            variant: RiseButtonVariant.secondary,
            children: [
              RiseButton(label: 'First', onPressed: _noop),
              _segmentAfterFirst('Second'),
              RiseButton(
                allowEnabledWhenGroupDisabled: true,
                onPressed: _noop,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const RiseButtonGroupSeparator(),
                    const Text('Third (enabled)'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget withoutSeparator(BuildContext context) {
    return _wrap(
      RiseButtonGroup(
        variant: RiseButtonVariant.outline,
        children: [
          RiseButton(label: 'First', onPressed: _noop),
          RiseButton(label: 'Second', onPressed: _noop),
          RiseButton(label: 'Third', onPressed: _noop),
        ],
      ),
    );
  }
}
