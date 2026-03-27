import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

const String _kLorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar risus non risus '
    'hendrerit venenatis. Pellentesque sit amet hendrerit risus, sed porttitor quam.';

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
  static Widget horizontal(BuildContext context) =>
      _wrap(const _ScrollShadowHorizontalEmbed());
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: itemCount,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text('$_kLorem (${i + 1})', style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}

class _ScrollShadowUsageEmbed extends StatelessWidget {
  const _ScrollShadowUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: RiseScrollShadow(
        child: const _LoremParagraphsList(),
      ),
    );
  }
}

class _ScrollShadowHorizontalEmbed extends StatelessWidget {
  const _ScrollShadowHorizontalEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return SizedBox(
      height: 132,
      child: RiseScrollShadow(
        axis: Axis.horizontal,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          itemCount: 8,
          itemBuilder: (context, i) => Container(
            width: 200,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: rise.muted,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: rise.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Card ${i + 1}', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                Text('Today, 6:30 PM', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ScrollShadowHideScrollbarEmbed extends StatelessWidget {
  const _ScrollShadowHideScrollbarEmbed();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: RiseScrollShadow(
        hideScrollBar: true,
        child: const _LoremParagraphsList(),
      ),
    );
  }
}

class _ScrollShadowCustomSizeEmbed extends StatelessWidget {
  const _ScrollShadowCustomSizeEmbed();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: RiseScrollShadow(
        size: 72,
        child: const _LoremParagraphsList(),
      ),
    );
  }
}

class _ScrollShadowVisibilityStateEmbed extends StatefulWidget {
  const _ScrollShadowVisibilityStateEmbed();

  @override
  State<_ScrollShadowVisibilityStateEmbed> createState() => _ScrollShadowVisibilityStateEmbedState();
}

class _ScrollShadowVisibilityStateEmbedState extends State<_ScrollShadowVisibilityStateEmbed> {
  RiseScrollShadowVisibility _reported = RiseScrollShadowVisibility.none;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Last reported: ${_reported.name}',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 220,
          child: RiseScrollShadow(
            onVisibilityChange: (v) => setState(() => _reported = v),
            child: const _LoremParagraphsList(),
          ),
        ),
      ],
    );
  }
}

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
            height: 180,
            child: RiseScrollShadow(
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
