import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Surface demos for docs iframe (`?embed=surface-*`).
class DocsEmbedSurface {
  DocsEmbedSurface._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _SurfaceUsageEmbed());

  static Widget withForm(BuildContext context) => _wrap(const _SurfaceWithFormEmbed());
}

class _SurfaceUsageEmbed extends StatelessWidget {
  const _SurfaceUsageEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;

    Widget panel(String title, String body, RiseSurfaceVariant v) {
      return RiseSurface(
        variant: v,
        padding: const EdgeInsets.all(20),
        borderRadius: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: rise.defaultForeground,
              ),
            ),
            const SizedBox(height: 8),
            Text(body, style: TextStyle(fontSize: 14, height: 20 / 14, color: rise.mutedForeground())),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        panel(
          'Default',
          'This is a default surface variant. It uses bg-surface styling.',
          RiseSurfaceVariant.primary,
        ),
        const SizedBox(height: 12),
        panel(
          'Secondary',
          'This is a secondary surface variant. It uses bg-surface-secondary styling.',
          RiseSurfaceVariant.secondary,
        ),
        const SizedBox(height: 12),
        panel(
          'Tertiary',
          'This is a tertiary surface variant. It uses bg-surface-tertiary styling.',
          RiseSurfaceVariant.tertiary,
        ),
        const SizedBox(height: 12),
        panel(
          'Transparent',
          'This is a transparent surface variant. It has no background, suitable for overlays '
          'and cards with custom backgrounds.',
          RiseSurfaceVariant.transparent,
        ),
      ],
    );
  }
}

class _SurfaceWithFormEmbed extends StatelessWidget {
  const _SurfaceWithFormEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseSurface(
      variant: RiseSurfaceVariant.primary,
      padding: const EdgeInsets.all(20),
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: const [
          RiseTextField(
            labelText: 'Input with secondary variant',
            hintText: 'Placeholder',
            variant: RiseTextFieldVariant.secondary,
            fullWidth: true,
          ),
          SizedBox(height: 16),
          RiseTextField(
            labelText: 'Another field',
            hintText: 'TextArea with secondary variant',
            variant: RiseTextFieldVariant.secondary,
            maxLines: 3,
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
