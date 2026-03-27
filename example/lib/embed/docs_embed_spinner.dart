import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Spinner demos for docs iframe (`?embed=spinner-*`).
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

class _SpinnerColorsEmbed extends StatelessWidget {
  const _SpinnerColorsEmbed();

  @override
  Widget build(BuildContext context) {
    Widget labeled(String label, Widget spinner) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          spinner,
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: context.riseTheme.mutedForeground(),
                ),
          ),
        ],
      );
    }

    return Wrap(
      spacing: 28,
      runSpacing: 20,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      children: [
        labeled(
          'current',
          DefaultTextStyle(
            style: TextStyle(color: context.riseTheme.accent),
            child: const RiseSpinner(color: RiseSpinnerColor.current),
          ),
        ),
        labeled(
          'accent',
          const RiseSpinner(color: RiseSpinnerColor.accent),
        ),
        labeled(
          'success',
          const RiseSpinner(color: RiseSpinnerColor.success),
        ),
        labeled(
          'warning',
          const RiseSpinner(color: RiseSpinnerColor.warning),
        ),
        labeled(
          'danger',
          const RiseSpinner(color: RiseSpinnerColor.danger),
        ),
      ],
    );
  }
}

class _SpinnerSizesEmbed extends StatelessWidget {
  const _SpinnerSizesEmbed();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTheme.merge(
          data: IconThemeData(color: context.riseTheme.accent),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RiseSpinner(size: RiseSpinnerSize.sm),
              SizedBox(width: 20),
              RiseSpinner(size: RiseSpinnerSize.md),
              SizedBox(width: 20),
              RiseSpinner(size: RiseSpinnerSize.lg),
              SizedBox(width: 20),
              RiseSpinner(size: RiseSpinnerSize.xl),
            ],
          ),
        ),
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
