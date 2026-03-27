import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Stable portrait for docs embeds (Lorem Picsum).
const String kDocsAvatarSampleImageUrl = 'https://picsum.photos/seed/rise-avatar/200';

class DocsEmbedAvatar {
  DocsEmbedAvatar._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _AvatarUsageEmbed());
  static Widget sizes(BuildContext context) => _wrap(const _AvatarSizesEmbed());
  static Widget colors(BuildContext context) => _wrap(const _AvatarColorsEmbed());
  static Widget variants(BuildContext context) => _wrap(const _AvatarVariantsEmbed());
  static Widget fallback(BuildContext context) => _wrap(const _AvatarFallbackEmbed());
  static Widget group(BuildContext context) => _wrap(const _AvatarGroupEmbed());
  static Widget customStyles(BuildContext context) =>
      _wrap(const _AvatarCustomStylesEmbed());
}

class _AvatarUsageEmbed extends StatelessWidget {
  const _AvatarUsageEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RiseAvatar(
          image: const NetworkImage(kDocsAvatarSampleImageUrl),
          name: 'Sam Rowe',
        ),
        const RiseAvatar(
          name: 'Alex Griffin',
          color: RiseAvatarColor.accent,
        ),
        RiseAvatar(
          child: ColoredBox(
            color: rise.accent.withValues(alpha: 0.2),
            child: Icon(Icons.person_outline, color: rise.accent),
          ),
        ),
      ],
    );
  }
}

class _AvatarSizesEmbed extends StatelessWidget {
  const _AvatarSizesEmbed();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RiseAvatar(
          image: NetworkImage(kDocsAvatarSampleImageUrl),
          name: 'S',
          size: RiseAvatarSize.sm,
        ),
        RiseAvatar(
          image: NetworkImage(kDocsAvatarSampleImageUrl),
          name: 'M',
          size: RiseAvatarSize.md,
        ),
        RiseAvatar(
          image: NetworkImage(kDocsAvatarSampleImageUrl),
          name: 'L',
          size: RiseAvatarSize.lg,
        ),
      ],
    );
  }
}

class _AvatarColorsEmbed extends StatelessWidget {
  const _AvatarColorsEmbed();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 12,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RiseAvatar(name: 'AG', color: RiseAvatarColor.standard),
        RiseAvatar(name: 'AG', color: RiseAvatarColor.accent),
        RiseAvatar(name: 'AG', color: RiseAvatarColor.success),
        RiseAvatar(name: 'AG', color: RiseAvatarColor.warning),
        RiseAvatar(name: 'AG', color: RiseAvatarColor.danger),
      ],
    );
  }
}

class _AvatarVariantsEmbed extends StatelessWidget {
  const _AvatarVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    const colors = RiseAvatarColor.values;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Solid',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final c in colors)
              RiseAvatar(
                name: 'AG',
                color: c,
                variant: RiseAvatarVariant.solid,
              ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Soft',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final c in colors)
              RiseAvatar(
                name: 'AG',
                color: c,
                variant: RiseAvatarVariant.soft,
              ),
          ],
        ),
      ],
    );
  }
}

class _AvatarFallbackEmbed extends StatelessWidget {
  const _AvatarFallbackEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseAvatar(
      image: NetworkImage('https://example.invalid/no-image.png'),
      name: 'Jamie Doe',
      color: RiseAvatarColor.accent,
    );
  }
}

class _AvatarGroupEmbed extends StatelessWidget {
  const _AvatarGroupEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseAvatarGroup(
      children: [
        RiseAvatar(
          image: const NetworkImage(kDocsAvatarSampleImageUrl),
          name: 'A',
        ),
        const RiseAvatar(name: 'Bo Chen', color: RiseAvatarColor.success),
        RiseAvatar(
          image: const NetworkImage('https://picsum.photos/seed/rise-avatar-b/200'),
          name: 'C',
        ),
        const RiseAvatar(name: 'Dana Lee', color: RiseAvatarColor.warning),
      ],
    );
  }
}

class _AvatarCustomStylesEmbed extends StatelessWidget {
  const _AvatarCustomStylesEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return RiseAvatar(
      color: RiseAvatarColor.accent,
      variant: RiseAvatarVariant.soft,
      child: Icon(Icons.auto_awesome, color: rise.accent),
    );
  }
}
