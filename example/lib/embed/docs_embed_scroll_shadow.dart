import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Same copy as [HeroUI `LoremContent`](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/scroll-shadow/scroll-shadow.stories.tsx).
const String _kLoremParagraph =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar risus non risus '
    'hendrerit venenatis. Pellentesque sit amet hendrerit risus, sed porttitor quam. Morbi '
    'accumsan cursus enim, sed ultricies sapien.';

/// [LoremCards](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/scroll-shadow/scroll-shadow.stories.tsx) image URLs.
const List<String> _kHeroDocCardImages = [
  'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/robot1.jpeg',
  'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/avocado.jpeg',
  'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/docs/oranges.jpeg',
];

class DocsEmbedScrollShadow {
  DocsEmbedScrollShadow._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _ScrollShadowUsageEmbed());
  static Widget variants(BuildContext context) => _wrap(const _ScrollShadowVariantsEmbed());
  static Widget orientation(BuildContext context) => _wrap(const _ScrollShadowOrientationEmbed());
  static Widget hideScrollbar(BuildContext context) =>
      _wrap(const _ScrollShadowHideScrollbarEmbed());
  static Widget customSize(BuildContext context) =>
      _wrap(const _ScrollShadowCustomSizeEmbed());
  static Widget visibilityState(BuildContext context) =>
      _wrap(const _ScrollShadowVisibilityStateEmbed());
  static Widget withCard(BuildContext context) => _wrap(const _ScrollShadowWithCardEmbed());
}

class _LoremParagraphsList extends StatelessWidget {
  const _LoremParagraphsList({this.itemCount = 10});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: itemCount,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(_kLoremParagraph, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}

/// `Default` — `max-h-[240px] p-4` in Hero ([scroll-shadow.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/scroll-shadow/scroll-shadow.stories.tsx)).
class _ScrollShadowUsageEmbed extends StatelessWidget {
  const _ScrollShadowUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 240,
      child: RiseScrollShadow(
        child: _LoremParagraphsList(),
      ),
    );
  }
}

/// `Variants` — Fade + Blur sections (Storybook labels; CSS is fade-only, blur is soft edge overlays).
class _ScrollShadowVariantsEmbed extends StatelessWidget {
  const _ScrollShadowVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    final h = Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Fade (opacity effect)', style: h),
        const SizedBox(height: 8),
        const SizedBox(
          height: 240,
          child: RiseScrollShadow(
            effect: RiseScrollShadowEffect.fade,
            child: _LoremParagraphsList(),
          ),
        ),
        const SizedBox(height: 24),
        Text('Blur (blur effect)', style: h),
        const SizedBox(height: 8),
        const SizedBox(
          height: 240,
          child: RiseScrollShadow(
            effect: RiseScrollShadowEffect.blur,
            child: _LoremParagraphsList(),
          ),
        ),
      ],
    );
  }
}

/// `Orientation` — vertical card + horizontal image strip.
class _ScrollShadowOrientationEmbed extends StatelessWidget {
  const _ScrollShadowOrientationEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final h = Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Vertical', style: h),
        const SizedBox(height: 8),
        RiseSurface(
          variant: RiseSurfaceVariant.secondary,
          padding: EdgeInsets.zero,
          borderRadius: 16,
          child: const SizedBox(
            height: 240,
            child: RiseScrollShadow(
              child: _LoremParagraphsList(),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Horizontal', style: h),
        const SizedBox(height: 8),
        RiseSurface(
          variant: RiseSurfaceVariant.secondary,
          padding: const EdgeInsets.all(16),
          borderRadius: 16,
          child: SizedBox(
            height: 112,
            child: RiseScrollShadow(
              axis: Axis.horizontal,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, idx) {
                  final src = _kHeroDocCardImages[idx % _kHeroDocCardImages.length];
                  return SizedBox(
                    width: 220,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              src,
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bridging the Future',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Today, 6:30 PM',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: rise.mutedForeground(0.8),
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScrollShadowHideScrollbarEmbed extends StatelessWidget {
  const _ScrollShadowHideScrollbarEmbed();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 240,
      child: RiseScrollShadow(
        hideScrollBar: true,
        child: _LoremParagraphsList(),
      ),
    );
  }
}

/// `CustomSize` — 20px · 40px · 80px shadow extent ([scroll-shadow.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/scroll-shadow/scroll-shadow.stories.tsx)).
class _ScrollShadowCustomSizeEmbed extends StatelessWidget {
  const _ScrollShadowCustomSizeEmbed();

  @override
  Widget build(BuildContext context) {
    final h = Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600);

    Widget block(String title, double size) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: h),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: RiseScrollShadow(
              size: size,
              child: const _LoremParagraphsList(),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        block('Small shadow (20px)', 20),
        const SizedBox(height: 20),
        block('Default shadow (40px)', 40),
        const SizedBox(height: 20),
        block('Large shadow (80px)', 80),
      ],
    );
  }
}

class _ScrollShadowVisibilityStateEmbed extends StatefulWidget {
  const _ScrollShadowVisibilityStateEmbed();

  @override
  State<_ScrollShadowVisibilityStateEmbed> createState() =>
      _ScrollShadowVisibilityStateEmbedState();
}

class _ScrollShadowVisibilityStateEmbedState extends State<_ScrollShadowVisibilityStateEmbed> {
  RiseScrollShadowVisibility _vertical = RiseScrollShadowVisibility.none;
  RiseScrollShadowVisibility _horizontal = RiseScrollShadowVisibility.none;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final panel = BoxDecoration(
      color: rise.muted,
      borderRadius: BorderRadius.circular(12),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: panel,
          child: Text(
            'Vertical shadow state: ${_vertical.name}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 240,
          child: RiseScrollShadow(
            axis: Axis.vertical,
            onVisibilityChange: (v) => setState(() => _vertical = v),
            child: const _LoremParagraphsList(),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: panel,
          child: Text(
            'Horizontal shadow state: ${_horizontal.name}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 112,
          child: RiseScrollShadow(
            axis: Axis.horizontal,
            onVisibilityChange: (v) => setState(() => _horizontal = v),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, idx) {
                final src = _kHeroDocCardImages[idx % _kHeroDocCardImages.length];
                return SizedBox(
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(src, width: 56, height: 56, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Card ${idx + 1}',
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// `WithCard` — `h-[300]` scroll region, `size={80}` ([scroll-shadow.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/scroll-shadow/scroll-shadow.stories.tsx)).
class _ScrollShadowWithCardEmbed extends StatelessWidget {
  const _ScrollShadowWithCardEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseSurface(
      variant: RiseSurfaceVariant.secondary,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Terms and conditions',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            'Please review before proceeding',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.riseTheme.mutedForeground(),
                ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 300,
            child: RiseScrollShadow(
              size: 80,
              child: const _LoremParagraphsList(itemCount: 12),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Cancel')),
              const SizedBox(width: 8),
              FilledButton(onPressed: () {}, child: const Text('Accept')),
            ],
          ),
        ],
      ),
    );
  }
}
