import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

// —— HeroUI v3 Storybook sources (avatar.stories.tsx) —————————————————————

/// `img.heroui.chat` portraits — same query pattern as [HeroUI Avatar stories](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/avatar/avatar.stories.tsx).
const String kHerouiChatAvatarBase = 'https://img.heroui.chat/image/avatar?w=400&h=400&u=';

/// Sample portrait for docs snippets — same host as HeroUI stories (`u=3`).
const String kDocsAvatarSampleImageUrl = '${kHerouiChatAvatarBase}3';

/// DigitalOcean static samples — `avatar.stories.tsx` `circles` + Variants image row.
const String kHerouiAssetAvatars = 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/';

const List<String> kHerouiStoryUserUrls = [
  '$kHerouiChatAvatarBase${3}',
  '$kHerouiChatAvatarBase${4}',
  '$kHerouiChatAvatarBase${5}',
  '$kHerouiChatAvatarBase${8}',
];

/// Same order as Hero `VariantsTemplate` header: accent, default, success, warning, danger.
const List<RiseAvatarColor> kHeroAvatarColorColumnOrder = [
  RiseAvatarColor.accent,
  RiseAvatarColor.standard,
  RiseAvatarColor.success,
  RiseAvatarColor.warning,
  RiseAvatarColor.danger,
];

const List<String> kHeroVariantRowImageUrls = [
  '${kHerouiAssetAvatars}blue.jpg',
  '${kHerouiAssetAvatars}black.jpg',
  '${kHerouiAssetAvatars}green.jpg',
  '${kHerouiAssetAvatars}orange.jpg',
  '${kHerouiAssetAvatars}red.jpg',
];

String _heroColorName(RiseAvatarColor c) => switch (c) {
      RiseAvatarColor.accent => 'accent',
      RiseAvatarColor.standard => 'default',
      RiseAvatarColor.success => 'success',
      RiseAvatarColor.warning => 'warning',
      RiseAvatarColor.danger => 'danger',
    };

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
  static Widget withDelay(BuildContext context) => _wrap(const _AvatarWithDelayEmbed());
  static Widget sizes(BuildContext context) => _wrap(const _AvatarSizesEmbed());
  static Widget colors(BuildContext context) => _wrap(const _AvatarColorsEmbed());
  static Widget variants(BuildContext context) => _wrap(const _AvatarVariantsEmbed());
  static Widget fallback(BuildContext context) => _wrap(const _AvatarFallbackEmbed());
  static Widget group(BuildContext context) => _wrap(const _AvatarGroupEmbed());
  static Widget customStyles(BuildContext context) =>
      _wrap(const _AvatarCustomStylesEmbed());
}

/// Default story: three columns — text/icon fallbacks · chat portraits · asset circles ([avatar.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/avatar/avatar.stories.tsx) `Template`).
class _AvatarUsageEmbed extends StatelessWidget {
  const _AvatarUsageEmbed();

  static const _gap = 16.0;

  @override
  Widget build(BuildContext context) {
    Widget col(List<Widget> children) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: _spaced(children, _gap),
        );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          col([
            const RiseAvatar(name: 'PG'),
            const RiseAvatar(name: 'JR'),
            RiseAvatar(
              color: RiseAvatarColor.standard,
              child: Icon(Icons.person_outline, size: RiseAvatar.iconSizeFor(RiseAvatarSize.md)),
            ),
            RiseAvatar(
              color: RiseAvatarColor.standard,
              child: Icon(Icons.manage_accounts_outlined, size: RiseAvatar.iconSizeFor(RiseAvatarSize.md)),
            ),
          ]),
          SizedBox(width: _gap),
          col([
            RiseAvatar(
              image: NetworkImage(kHerouiStoryUserUrls[0]),
              name: 'John Doe',
            ),
            RiseAvatar(
              image: NetworkImage(kHerouiStoryUserUrls[1]),
              name: 'Junior Garcia',
            ),
            RiseAvatar(
              image: NetworkImage(kHerouiStoryUserUrls[2]),
              name: 'Junior Garcia',
            ),
            RiseAvatar(
              image: NetworkImage(kHerouiStoryUserUrls[3]),
              name: 'Paul',
            ),
          ]),
          SizedBox(width: _gap),
          col([
            RiseAvatar(
              image: NetworkImage('${kHerouiAssetAvatars}red.jpg'),
              name: 'R',
            ),
            RiseAvatar(
              image: NetworkImage('${kHerouiAssetAvatars}orange.jpg'),
              name: 'O',
            ),
            RiseAvatar(
              image: NetworkImage('${kHerouiAssetAvatars}green.jpg'),
              name: 'G',
            ),
            RiseAvatar(
              image: NetworkImage('${kHerouiAssetAvatars}white.jpg'),
              name: 'W',
            ),
            RiseAvatar(
              image: NetworkImage('${kHerouiAssetAvatars}black.jpg'),
              name: 'B',
            ),
          ]),
        ],
      ),
    );
  }
}

List<Widget> _spaced(List<Widget> children, double gap) {
  if (children.isEmpty) return [];
  return [
    for (var i = 0; i < children.length; i++) ...[
      if (i > 0) SizedBox(height: gap),
      children[i],
    ],
  ];
}

/// `WithDelay` — deferred image load (Hero uses Requestly; we simulate delay in-app).
class _AvatarWithDelayEmbed extends StatefulWidget {
  const _AvatarWithDelayEmbed();

  @override
  State<_AvatarWithDelayEmbed> createState() => _AvatarWithDelayEmbedState();
}

class _AvatarWithDelayEmbedState extends State<_AvatarWithDelayEmbed> {
  static const _delayMs = 300;
  bool _ready = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: _delayMs), () {
      if (mounted) setState(() => _ready = true);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return RiseAvatar(
        name: '…',
        color: RiseAvatarColor.standard,
      );
    }
    return RiseAvatar(
      image: NetworkImage('${kHerouiChatAvatarBase}3'),
      name: 'John',
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
          image: NetworkImage('${kHerouiChatAvatarBase}3'),
          name: 'SM',
          size: RiseAvatarSize.sm,
        ),
        RiseAvatar(
          image: NetworkImage('${kHerouiChatAvatarBase}4'),
          name: 'MD',
          size: RiseAvatarSize.md,
        ),
        RiseAvatar(
          image: NetworkImage('${kHerouiChatAvatarBase}5'),
          name: 'LG',
          size: RiseAvatarSize.lg,
        ),
      ],
    );
  }
}

/// `WithColors` — DF AC SC WR DG ([avatar.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/avatar/avatar.stories.tsx)).
class _AvatarColorsEmbed extends StatelessWidget {
  const _AvatarColorsEmbed();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RiseAvatar(name: 'DF', color: RiseAvatarColor.standard),
        RiseAvatar(name: 'AC', color: RiseAvatarColor.accent),
        RiseAvatar(name: 'SC', color: RiseAvatarColor.success),
        RiseAvatar(name: 'WR', color: RiseAvatarColor.warning),
        RiseAvatar(name: 'DG', color: RiseAvatarColor.danger),
      ],
    );
  }
}

/// `Variants` matrix — letter / letter soft / icon / icon soft / img ([avatar.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/avatar/avatar.stories.tsx)).
///
/// Uses [LayoutBuilder] + [Expanded] columns so rows never overflow narrow parents (no nested
/// horizontal [SingleChildScrollView] inside [ListView], which can break viewport layout).
class _AvatarVariantsEmbed extends StatelessWidget {
  const _AvatarVariantsEmbed();

  static double _labelWidth(double available) =>
      (available * 0.22).clamp(52.0, 100.0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subtle = theme.textTheme.labelSmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        var w = constraints.maxWidth;
        if (!w.isFinite || w <= 0) {
          w = MediaQuery.sizeOf(context).width;
        }
        final labelW = _labelWidth(w);

        Widget headerRow() {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: labelW),
              for (final c in kHeroAvatarColorColumnOrder)
                Expanded(
                  child: Center(
                    child: Text(
                      _heroColorName(c),
                      style: subtle,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
            ],
          );
        }

        Widget dataRow(String label, List<Widget> cells) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: labelW,
                child: Text(
                  label,
                  style: theme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              for (var i = 0; i < cells.length; i++) Expanded(child: Center(child: cells[i])),
            ],
          );
        }

        List<Widget> letterCells({required bool soft}) => [
              for (var i = 0; i < kHeroAvatarColorColumnOrder.length; i++)
                RiseAvatar(
                  name: 'AG',
                  color: kHeroAvatarColorColumnOrder[i],
                  variant: soft ? RiseAvatarVariant.soft : RiseAvatarVariant.solid,
                ),
            ];

        List<Widget> iconCells({required bool soft}) => [
              for (var i = 0; i < kHeroAvatarColorColumnOrder.length; i++)
                RiseAvatar(
                  color: kHeroAvatarColorColumnOrder[i],
                  variant: soft ? RiseAvatarVariant.soft : RiseAvatarVariant.solid,
                  child: Icon(Icons.person_outline, size: RiseAvatar.iconSizeFor(RiseAvatarSize.md)),
                ),
            ];

        List<Widget> imgCells() => [
              for (var i = 0; i < kHeroAvatarColorColumnOrder.length; i++)
                RiseAvatar(
                  color: kHeroAvatarColorColumnOrder[i],
                  image: NetworkImage(kHeroVariantRowImageUrls[i]),
                  name: _heroColorName(kHeroAvatarColorColumnOrder[i]).substring(0, 1).toUpperCase(),
                ),
            ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            headerRow(),
            const SizedBox(height: 8),
            RiseSeparator(tone: RiseSeparatorTone.default_),
            const SizedBox(height: 12),
            dataRow('letter', letterCells(soft: false)),
            const SizedBox(height: 12),
            dataRow('letter soft', letterCells(soft: true)),
            const SizedBox(height: 12),
            dataRow('icon', iconCells(soft: false)),
            const SizedBox(height: 12),
            dataRow('icon soft', iconCells(soft: true)),
            const SizedBox(height: 12),
            dataRow('img', imgCells()),
          ],
        );
      },
    );
  }
}

/// `Fallback` story: text · icon · delayed broken URL · gradient ([avatar.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/avatar/avatar.stories.tsx)).
class _AvatarFallbackEmbed extends StatelessWidget {
  const _AvatarFallbackEmbed();

  @override
  Widget build(BuildContext context) {
    final d = RiseAvatar.diameter(RiseAvatarSize.md);
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const RiseAvatar(name: 'JD'),
        RiseAvatar(
          child: Icon(Icons.person_outline, size: RiseAvatar.iconSizeFor(RiseAvatarSize.md)),
        ),
        RiseAvatar(
          image: const NetworkImage('https://invalid-url-to-show-fallback.com/image.jpg'),
          name: 'NA',
          color: RiseAvatarColor.standard,
        ),
        RiseAvatar(
          color: RiseAvatarColor.standard,
          child: SizedBox(
            width: d,
            height: d,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFEC4899), Color(0xFFA855F7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'GB',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// `Group` — two `-space-x-2` rows + `+5` pill ([avatar.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/avatar/avatar.stories.tsx)).
class _AvatarGroupEmbed extends StatelessWidget {
  const _AvatarGroupEmbed();

  static final List<(String, String)> _storyUsers = [
    ('${kHerouiChatAvatarBase}3', 'J'),
    ('${kHerouiChatAvatarBase}5', 'K'),
    ('${kHerouiChatAvatarBase}20', 'E'),
    ('${kHerouiChatAvatarBase}23', 'M'),
    ('${kHerouiChatAvatarBase}16', 'O'),
  ];

  static final List<(String, String)> _circles = [
    ('${kHerouiAssetAvatars}red.jpg', 'R'),
    ('${kHerouiAssetAvatars}orange.jpg', 'O'),
    ('${kHerouiAssetAvatars}green.jpg', 'G'),
    ('${kHerouiAssetAvatars}white.jpg', 'W'),
    ('${kHerouiAssetAvatars}black.jpg', 'B'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        RiseAvatarGroup(
          children: [
            for (final (url, initial) in _storyUsers)
              RiseAvatar(
                image: NetworkImage(url),
                name: initial,
              ),
            const RiseAvatar(
              name: '+5',
              color: RiseAvatarColor.standard,
            ),
          ],
        ),
        const SizedBox(height: 16),
        RiseAvatarGroup(
          children: [
            for (final (url, initial) in _circles)
              RiseAvatar(
                image: NetworkImage(url),
                name: initial,
              ),
            const RiseAvatar(
              name: '+5',
              color: RiseAvatarColor.standard,
            ),
          ],
        ),
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
