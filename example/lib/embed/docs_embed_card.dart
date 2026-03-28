import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Card demos for docs iframe (`?embed=card-*`) — aligned with
/// [Card](https://heroui.com/docs/react/components/card) and
/// [card.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/card.css).
class DocsEmbedCard {
  DocsEmbedCard._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _CardUsageEmbed());

  static Widget variants(BuildContext context) => _wrap(const _CardVariantsEmbed());

  static Widget horizontal(BuildContext context) => _wrap(const _CardHorizontalEmbed());

  static Widget withAvatar(BuildContext context) => _wrap(const _CardWithAvatarEmbed());

  static Widget withImages(BuildContext context) => _wrap(const _CardWithImagesEmbed());

  static Widget withForm(BuildContext context) => _wrap(const _CardWithFormEmbed());
}

class _CardUsageEmbed extends StatelessWidget {
  const _CardUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseCardHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const RiseCardTitle(child: Text('Become an Acme Creator!')),
                const SizedBox(height: 4),
                RiseCardDescription(
                  child: Text(
                    'Visit the Acme Creator Hub to sign up today and start earning credits from '
                    'your fans and followers.',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: RiseCard.sectionGap),
          RiseCardContent(
            child: Text(
              'Creator Hub spots are limited. Apply early to lock in founding benefits.',
              style: TextStyle(color: context.riseTheme.defaultForeground, fontSize: 14, height: 20 / 14),
            ),
          ),
          const SizedBox(height: RiseCard.sectionGap),
          RiseCardFooter(
            child: RiseButton(
              variant: RiseButtonVariant.primary,
              onPressed: () {},
              label: 'Creator Hub',
            ),
          ),
        ],
      ),
    );
  }
}

class _CardVariantsEmbed extends StatelessWidget {
  const _CardVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;

    Widget tile(String label, String blurb, RiseCardVariant v) {
      return RiseCard(
        variant: v,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: rise.defaultForeground,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              blurb,
              style: TextStyle(
                color: rise.mutedForeground(0.85),
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        tile(
          'Transparent',
          'Minimal prominence with transparent background — nested or low emphasis.',
          RiseCardVariant.transparent,
        ),
        const SizedBox(height: RiseCard.sectionGap),
        tile(
          'Default',
          'Standard card appearance (bg-surface) — default for most use cases.',
          RiseCardVariant.default_,
        ),
        const SizedBox(height: RiseCard.sectionGap),
        tile(
          'Secondary',
          'Medium prominence (bg-surface-secondary).',
          RiseCardVariant.secondary,
        ),
        const SizedBox(height: RiseCard.sectionGap),
        tile(
          'Tertiary',
          'Higher prominence (bg-surface-tertiary) — featured content.',
          RiseCardVariant.tertiary,
        ),
      ],
    );
  }
}

class _CardHorizontalEmbed extends StatelessWidget {
  const _CardHorizontalEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return RiseCard(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final narrow = constraints.maxWidth < 400;
          final media = ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: narrow ? double.infinity : 96,
              height: narrow ? 120 : 96,
              color: rise.muted,
              alignment: Alignment.center,
              child: Icon(Icons.image_outlined, color: rise.mutedForeground()),
            ),
          );
          final copy = Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const RiseCardTitle(child: Text('Become an ACME Creator!')),
              const SizedBox(height: 4),
              RiseCardDescription(
                child: const Text(
                  'Lorem ipsum dolor sit amet consectetur. Sed arcu donec id aliquam dolor sed '
                  'amet faucibus etiam.',
                ),
              ),
              const SizedBox(height: RiseCard.sectionGap),
              Text(
                'Only 10 spots · Submission ends Oct 10.',
                style: TextStyle(fontSize: 12, color: rise.mutedForeground(0.85)),
              ),
              const SizedBox(height: RiseCard.sectionGap),
              RiseCardFooter(
                child: RiseButton(
                  variant: RiseButtonVariant.primary,
                  onPressed: () {},
                  label: 'Apply now',
                ),
              ),
            ],
          );
          if (narrow) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                media,
                const SizedBox(height: 16),
                copy,
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              media,
              const SizedBox(width: 16),
              Expanded(child: copy),
            ],
          );
        },
      ),
    );
  }
}

class _CardWithAvatarEmbed extends StatelessWidget {
  const _CardWithAvatarEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final muted = rise.mutedForeground(0.75);

    Widget communityCard({
      required String communityName,
      required String members,
      required String author,
      required String avatarName,
      required String byline,
    }) {
      return RiseCard(
        variant: RiseCardVariant.default_,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RiseAvatar(
                  name: avatarName,
                  size: RiseAvatarSize.lg,
                  color: RiseAvatarColor.standard,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RiseCardTitle(child: Text(communityName)),
                      const SizedBox(height: 4),
                      RiseCardDescription(child: Text(members)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: RiseCard.sectionGap),
            Row(
              children: [
                RiseAvatar(
                  name: author,
                  size: RiseAvatarSize.sm,
                  color: RiseAvatarColor.accent,
                  variant: RiseAvatarVariant.soft,
                ),
                const SizedBox(width: 8),
                Text(
                  byline,
                  style: TextStyle(fontSize: 14, height: 20 / 14, color: muted),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: communityCard(
            communityName: 'Indie Hackers',
            members: '148 members',
            author: 'Martha',
            avatarName: 'Indie Hackers community',
            byline: 'By Martha',
          ),
        ),
        SizedBox(
          width: 200,
          child: communityCard(
            communityName: 'AI Builders',
            members: '362 members',
            author: 'John',
            avatarName: 'AI Builders community',
            byline: 'By John',
          ),
        ),
      ],
    );
  }
}

class _CardWithImagesEmbed extends StatelessWidget {
  const _CardWithImagesEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;

    Widget imageBlock({double? height}) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: height ?? 88,
          width: double.infinity,
          color: rise.muted,
          alignment: Alignment.center,
          child: Icon(Icons.image_outlined, color: rise.mutedForeground(0.7)),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        RiseCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              imageBlock(height: 120),
              const SizedBox(height: RiseCard.sectionGap),
              const RiseCardTitle(child: Text('Become an ACME Creator!')),
              const SizedBox(height: 4),
              RiseCardDescription(
                child: const Text(
                  'Lorem ipsum dolor sit amet consectetur. Sed arcu donec id aliquam dolor sed '
                  'amet faucibus etiam.',
                ),
              ),
              const SizedBox(height: RiseCard.sectionGap),
              Text(
                'Only 10 spots · Submission ends Oct 10.',
                style: TextStyle(fontSize: 12, color: rise.mutedForeground(0.85)),
              ),
              const SizedBox(height: RiseCard.sectionGap),
              RiseCardFooter(
                child: RiseButton(
                  variant: RiseButtonVariant.primary,
                  onPressed: () {},
                  label: 'Apply now',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RiseCard(
                variant: RiseCardVariant.secondary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RiseChip(
                      variant: RiseChipVariant.secondary,
                      size: RiseChipSize.sm,
                      child: const Text('PAYMENT'),
                    ),
                    const SizedBox(height: 8),
                    const RiseCardTitle(child: Text('You can now withdraw on crypto')),
                    const SizedBox(height: 4),
                    RiseCardDescription(
                      child: const Text('Add your wallet in settings to withdraw'),
                    ),
                    const SizedBox(height: RiseCard.sectionGap),
                    RiseButton(
                      variant: RiseButtonVariant.secondary,
                      onPressed: () {},
                      label: 'Go to settings',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: RiseCard(
                variant: RiseCardVariant.secondary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        RiseAvatar(name: 'JK', size: RiseAvatarSize.md),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const RiseCardTitle(child: Text('Indie Hackers')),
                              RiseCardDescription(child: const Text('148 members')),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: RiseCard.sectionGap),
                    Row(
                      children: [
                        RiseAvatar(name: 'John', size: RiseAvatarSize.sm),
                        const SizedBox(width: 8),
                        Text(
                          'By John',
                          style: TextStyle(fontSize: 14, color: rise.mutedForeground(0.75)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CardWithFormEmbed extends StatefulWidget {
  const _CardWithFormEmbed();

  @override
  State<_CardWithFormEmbed> createState() => _CardWithFormEmbedState();
}

class _CardWithFormEmbedState extends State<_CardWithFormEmbed> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseCardHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const RiseCardTitle(child: Text('Login')),
                const SizedBox(height: 4),
                RiseCardDescription(
                  child: const Text('Enter your credentials to access your account.'),
                ),
              ],
            ),
          ),
          const SizedBox(height: RiseCard.sectionGap),
          RiseCardContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RiseTextField(
                  controller: _email,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  fullWidth: true,
                ),
                const SizedBox(height: 12),
                RiseTextField(
                  controller: _password,
                  labelText: 'Password',
                  obscureText: true,
                  fullWidth: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: RiseCard.sectionGap),
          RiseCardFooter(
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                RiseButton(
                  variant: RiseButtonVariant.primary,
                  onPressed: () {},
                  label: 'Sign in',
                ),
                RiseButton(
                  variant: RiseButtonVariant.ghost,
                  onPressed: () {},
                  label: 'Forgot password?',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
