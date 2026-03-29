import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Spinner demos for docs iframe (`?embed=spinner-*`).
///
/// Mirrors HeroUI Storybook
/// [spinner.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/spinner/spinner.stories.tsx):
/// Default, Colors (`gap-8` + muted labels), Sizes (`gap-8` + Hero size labels).
class DocsEmbedSpinner {
  DocsEmbedSpinner._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _SpinnerUsageEmbed());

  static Widget colors(BuildContext context) => _wrap(const _SpinnerColorsEmbed());

  static Widget sizes(BuildContext context) => _wrap(const _SpinnerSizesEmbed());

  static Widget loadingFlag(BuildContext context) => _wrap(const _SpinnerLoadingFlagEmbed());
}

/// Default story — centered spinner, `current` color via [IconTheme] (Hero `Default` template).
class _SpinnerUsageEmbed extends StatelessWidget {
  const _SpinnerUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTheme.merge(
          data: IconThemeData(color: context.riseTheme.defaultForeground),
          child: const RiseSpinner(),
        ),
      ],
    );
  }
}

/// Colors story — same order as Hero: Accent, Current, Success, Warning, Danger (`gap-8`).
class _SpinnerColorsEmbed extends StatelessWidget {
  const _SpinnerColorsEmbed();

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(),
        );

    Widget labeled(String label, Widget spinner) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          spinner,
          const SizedBox(height: 8),
          Text(label, style: labelStyle),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        labeled('Accent', const RiseSpinner(color: RiseSpinnerColor.accent)),
        const SizedBox(width: 32),
        labeled(
          'Current',
          DefaultTextStyle(
            style: TextStyle(color: context.riseTheme.accent),
            child: const RiseSpinner(color: RiseSpinnerColor.current),
          ),
        ),
        const SizedBox(width: 32),
        labeled('Success', const RiseSpinner(color: RiseSpinnerColor.success)),
        const SizedBox(width: 32),
        labeled('Warning', const RiseSpinner(color: RiseSpinnerColor.warning)),
        const SizedBox(width: 32),
        labeled('Danger', const RiseSpinner(color: RiseSpinnerColor.danger)),
      ],
    );
  }
}

/// Sizes story — `gap-8`, labels Small … Extra Large (accent `current` via IconTheme).
class _SpinnerSizesEmbed extends StatelessWidget {
  const _SpinnerSizesEmbed();

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(),
        );

    Widget labeled(String label, RiseSpinnerSize size) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseSpinner(size: size, color: RiseSpinnerColor.accent),
          const SizedBox(height: 8),
          Text(label, style: labelStyle),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        labeled('Small', RiseSpinnerSize.sm),
        const SizedBox(width: 32),
        labeled('Medium', RiseSpinnerSize.md),
        const SizedBox(width: 32),
        labeled('Large', RiseSpinnerSize.lg),
        const SizedBox(width: 32),
        labeled('Extra Large', RiseSpinnerSize.xl),
      ],
    );
  }
}

class _SpinnerLoadingFlagEmbed extends StatelessWidget {
  const _SpinnerLoadingFlagEmbed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Below: empty when not loading',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: context.riseTheme.mutedForeground(),
              ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: context.riseTheme.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('No spinner →'),
              SizedBox(width: 8),
              RiseSpinner(isLoading: false),
              Text(' (gap only)'),
            ],
          ),
        ),
      ],
    );
  }
}
