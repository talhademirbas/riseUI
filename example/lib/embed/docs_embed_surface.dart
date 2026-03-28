import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Surface demos for docs iframe (`?embed=surface-*`) — aligned with
/// [Surface](https://heroui.com/docs/react/components/surface),
/// [surface.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/surface/surface.tsx),
/// and [surface.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/surface.css).
///
/// Base Hero surface is shadowless; [showShadow] is omitted here. Composite widgets (e.g. [RiseCard])
/// opt into `--surface-shadow` where needed.
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

    /// Same structure as Hero Storybook [Variants](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/surface/surface.stories.tsx): title, “Surface Content”, Email field.
    Widget panel(String heading, String body, RiseSurfaceVariant v) {
      return RiseSurface(
        variant: v,
        padding: const EdgeInsets.all(20),
        borderRadius: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              heading,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: rise.defaultForeground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Surface Content',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: rise.defaultForeground),
            ),
            const SizedBox(height: 4),
            Text(
              body,
              style: TextStyle(fontSize: 14, height: 20 / 14, color: rise.mutedForeground()),
            ),
            const SizedBox(height: 12),
            const RiseTextField(
              labelText: 'Email',
              hintText: 'you@example.com',
              variant: RiseTextFieldVariant.secondary,
              fullWidth: true,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        panel(
          'Transparent',
          'No background — use for overlays or custom chrome.',
          RiseSurfaceVariant.transparent,
        ),
        const SizedBox(height: 12),
        panel(
          'Default',
          'This is a default surface variant. It uses bg-surface styling.',
          RiseSurfaceVariant.default_,
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
      ],
    );
  }
}

class _SurfaceWithFormEmbed extends StatelessWidget {
  const _SurfaceWithFormEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseSurface(
      variant: RiseSurfaceVariant.default_,
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
