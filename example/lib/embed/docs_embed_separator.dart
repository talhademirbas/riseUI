import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Separator demos for docs iframe (`?embed=separator-*`) — aligned with
/// [Separator](https://heroui.com/docs/react/components/separator),
/// [separator.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/separator/separator.tsx),
/// and [separator.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/separator.css).
class DocsEmbedSeparator {
  DocsEmbedSeparator._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _SeparatorUsageEmbed());

  static Widget vertical(BuildContext context) => _wrap(const _SeparatorVerticalEmbed());

  static Widget withContent(BuildContext context) => _wrap(const _SeparatorWithContentEmbed());

  static Widget variants(BuildContext context) => _wrap(const _SeparatorVariantsEmbed());

  static Widget withSurface(BuildContext context) => _wrap(const _SeparatorWithSurfaceEmbed());
}

class _SeparatorUsageEmbed extends StatelessWidget {
  const _SeparatorUsageEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'HeroUI v3 Components',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: rise.defaultForeground,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Beautiful, fast and modern React UI library.',
          style: TextStyle(color: rise.mutedForeground(), fontSize: 14, height: 20 / 14),
        ),
        const SizedBox(height: 16),
        const RiseSeparator(),
        const SizedBox(height: 16),
        Row(
          children: [
            Text('Blog', style: TextStyle(color: rise.accent, fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(width: 16),
            SizedBox(
              height: 24,
              child: const RiseSeparator(orientation: RiseSeparatorOrientation.vertical),
            ),
            const SizedBox(width: 16),
            Text('Docs', style: TextStyle(color: rise.accent, fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(width: 16),
            SizedBox(
              height: 24,
              child: const RiseSeparator(orientation: RiseSeparatorOrientation.vertical),
            ),
            const SizedBox(width: 16),
            Text('Source', style: TextStyle(color: rise.accent, fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}

class _SeparatorVerticalEmbed extends StatelessWidget {
  const _SeparatorVerticalEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Text('Left', style: TextStyle(color: rise.defaultForeground)),
          const SizedBox(width: 16),
          const RiseSeparator(orientation: RiseSeparatorOrientation.vertical),
          const SizedBox(width: 16),
          Text('Right', style: TextStyle(color: rise.defaultForeground)),
        ],
      ),
    );
  }
}

class _SeparatorWithContentEmbed extends StatelessWidget {
  const _SeparatorWithContentEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;

    Widget step(IconData icon, String title, String subtitle) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 36, color: rise.accent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: rise.defaultForeground),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, height: 20 / 14, color: rise.mutedForeground()),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        step(
          Icons.notifications_outlined,
          'Set Up Notifications',
          'Receive account activity updates',
        ),
        const SizedBox(height: 16),
        const RiseSeparator(),
        const SizedBox(height: 16),
        step(
          Icons.extension_outlined,
          'Set up Browser Extension',
          'Connect your browser to your account',
        ),
        const SizedBox(height: 16),
        RiseLabeledSeparator(child: const Text('OR')),
        const SizedBox(height: 16),
        step(
          Icons.auto_awesome_outlined,
          'Mint Collectible',
          'Create your first collectible',
        ),
      ],
    );
  }
}

class _SeparatorVariantsEmbed extends StatelessWidget {
  const _SeparatorVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    Widget row(String caption, RiseSeparatorTone tone) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(caption, style: TextStyle(fontSize: 12, color: context.riseTheme.mutedForeground())),
          const SizedBox(height: 8),
          RiseSeparator(tone: tone),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        row('Default (separator--default)', RiseSeparatorTone.default_),
        const SizedBox(height: 16),
        row('Secondary', RiseSeparatorTone.secondary),
        const SizedBox(height: 16),
        row('Tertiary', RiseSeparatorTone.tertiary),
      ],
    );
  }
}

class _SeparatorWithSurfaceEmbed extends StatelessWidget {
  const _SeparatorWithSurfaceEmbed();

  @override
  Widget build(BuildContext context) {
    Widget panel(String title, RiseSurfaceVariant surface) {
      return RiseSurface(
        variant: surface,
        padding: const EdgeInsets.all(16),
        borderRadius: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: context.riseTheme.defaultForeground)),
            const SizedBox(height: 8),
            const RiseSeparator(),
            const SizedBox(height: 8),
            Text('Surface content', style: TextStyle(color: context.riseTheme.mutedForeground(), fontSize: 14)),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        panel('Default surface', RiseSurfaceVariant.default_),
        const SizedBox(height: 12),
        panel('Secondary surface', RiseSurfaceVariant.secondary),
        const SizedBox(height: 12),
        panel('Tertiary surface', RiseSurfaceVariant.tertiary),
      ],
    );
  }
}
