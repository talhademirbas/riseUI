import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// List group previews for docs iframe (`?embed=list-group-*`).
class DocsEmbedListGroup {
  DocsEmbedListGroup._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _ListGroupUsageEmbed());

  static Widget withIcons(BuildContext context) => _wrap(const _ListGroupWithIconsEmbed());

  static Widget titleOnly(BuildContext context) => _wrap(const _ListGroupTitleOnlyEmbed());

  static Widget surfaceVariants(BuildContext context) => _wrap(const _ListGroupSurfaceVariantsEmbed());

  static Widget customSuffix(BuildContext context) => _wrap(const _ListGroupCustomSuffixEmbed());

  static Widget suffixProps(BuildContext context) => _wrap(const _ListGroupSuffixPropsEmbed());

  static Widget fullLayout(BuildContext context) => _wrap(const _ListGroupFullLayoutEmbed());
}

class _ListGroupUsageEmbed extends StatelessWidget {
  const _ListGroupUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseListGroup(
      showDividers: false,
      children: [
        RiseListGroupItem(
          onTap: () {},
          content: RiseListGroupItemContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                RiseListGroupItemTitle('Personal Info'),
                SizedBox(height: 2),
                RiseListGroupItemDescription('Name, email, phone number'),
              ],
            ),
          ),
        ),
        const RiseListGroupInsetSeparator(),
        RiseListGroupItem(
          onTap: () {},
          content: RiseListGroupItemContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                RiseListGroupItemTitle('Payment Methods'),
                SizedBox(height: 2),
                RiseListGroupItemDescription('Visa ending in 4829'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ListGroupWithIconsEmbed extends StatelessWidget {
  const _ListGroupWithIconsEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return RiseListGroup(
      showDividers: false,
      children: [
        RiseListGroupItem(
          onTap: () {},
          prefix: RiseListGroupItemPrefix(
            child: Icon(Icons.person_outline, size: 22, color: rise.defaultForeground),
          ),
          content: RiseListGroupItemContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                RiseListGroupItemTitle('Profile'),
                SizedBox(height: 2),
                RiseListGroupItemDescription('Name, photo, bio'),
              ],
            ),
          ),
        ),
        const RiseListGroupInsetSeparator(),
        RiseListGroupItem(
          onTap: () {},
          prefix: RiseListGroupItemPrefix(
            child: Icon(Icons.lock_outline, size: 22, color: rise.defaultForeground),
          ),
          content: RiseListGroupItemContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                RiseListGroupItemTitle('Security'),
                SizedBox(height: 2),
                RiseListGroupItemDescription('Password, 2FA'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ListGroupTitleOnlyEmbed extends StatelessWidget {
  const _ListGroupTitleOnlyEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return RiseListGroup(
      showDividers: false,
      children: [
        RiseListGroupItem(
          onTap: () {},
          prefix: RiseListGroupItemPrefix(
            child: Icon(Icons.wifi, size: 22, color: rise.defaultForeground),
          ),
          content: const RiseListGroupItemContent(
            child: RiseListGroupItemTitle('Wi-Fi'),
          ),
        ),
        const RiseListGroupInsetSeparator(),
        RiseListGroupItem(
          onTap: () {},
          prefix: RiseListGroupItemPrefix(
            child: Icon(Icons.bluetooth, size: 22, color: rise.defaultForeground),
          ),
          content: const RiseListGroupItemContent(
            child: RiseListGroupItemTitle('Bluetooth'),
          ),
        ),
      ],
    );
  }
}

class _ListGroupSurfaceVariantsEmbed extends StatelessWidget {
  const _ListGroupSurfaceVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    Widget mini(RiseSurfaceVariant v) {
      return RiseListGroup(
        variant: v,
        borderRadius: 16,
        showDividers: false,
        children: [
          RiseListGroupItem(
            onTap: () {},
            content: RiseListGroupItemContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  RiseListGroupItemTitle('Appearance'),
                  SizedBox(height: 2),
                  RiseListGroupItemDescription('Theme, font size, display'),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        mini(RiseSurfaceVariant.primary),
        const SizedBox(height: 12),
        mini(RiseSurfaceVariant.secondary),
        const SizedBox(height: 12),
        mini(RiseSurfaceVariant.tertiary),
        const SizedBox(height: 12),
        mini(RiseSurfaceVariant.transparent),
      ],
    );
  }
}

class _ListGroupCustomSuffixEmbed extends StatelessWidget {
  const _ListGroupCustomSuffixEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return RiseListGroup(
      showDividers: false,
      children: [
        RiseListGroupItem(
          onTap: () {},
          content: RiseListGroupItemContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                RiseListGroupItemTitle('Language'),
                SizedBox(height: 2),
                RiseListGroupItemDescription('English'),
              ],
            ),
          ),
          suffix: RiseListGroupItemSuffix(
            child: Icon(Icons.arrow_forward, size: 18, color: rise.mutedForeground(0.65)),
          ),
        ),
        const RiseListGroupInsetSeparator(),
        RiseListGroupItem(
          onTap: () {},
          content: const RiseListGroupItemContent(
            child: RiseListGroupItemTitle('Notifications'),
          ),
          suffix: RiseListGroupItemSuffix(
            child: RiseChip(
              variant: RiseChipVariant.primary,
              color: RiseChipColor.danger,
              size: RiseChipSize.sm,
              child: Text('7', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, height: 1.2)),
            ),
          ),
        ),
      ],
    );
  }
}

class _ListGroupSuffixPropsEmbed extends StatelessWidget {
  const _ListGroupSuffixPropsEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return RiseListGroup(
      showDividers: false,
      children: [
        RiseListGroupItem(
          onTap: () {},
          content: RiseListGroupItemContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                RiseListGroupItemTitle('Storage'),
                SizedBox(height: 2),
                RiseListGroupItemDescription('12.4 GB of 50 GB used'),
              ],
            ),
          ),
          suffix: RiseListGroupItemSuffix(
            iconSize: 18,
            iconColor: rise.mutedForeground(0.55),
          ),
        ),
      ],
    );
  }
}

class _ListGroupFullLayoutEmbed extends StatelessWidget {
  const _ListGroupFullLayoutEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final labelStyle = TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
      color: rise.mutedForeground(0.75),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text('Account', style: labelStyle),
        ),
        RiseListGroup(
          showDividers: false,
          children: [
            RiseListGroupItem(
              onTap: () {},
              prefix: RiseListGroupItemPrefix(
                child: Icon(Icons.person_outline, size: 22, color: rise.defaultForeground),
              ),
              content: RiseListGroupItemContent(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    RiseListGroupItemTitle('Personal Info'),
                    SizedBox(height: 2),
                    RiseListGroupItemDescription('Name, email, phone number'),
                  ],
                ),
              ),
            ),
            const RiseListGroupInsetSeparator(),
            RiseListGroupItem(
              onTap: () {},
              prefix: RiseListGroupItemPrefix(
                child: Icon(Icons.credit_card_outlined, size: 22, color: rise.defaultForeground),
              ),
              content: RiseListGroupItemContent(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    RiseListGroupItemTitle('Payment Methods'),
                    SizedBox(height: 2),
                    RiseListGroupItemDescription('Visa ending in 4829'),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text('Preferences', style: labelStyle),
        ),
        RiseListGroup(
          showDividers: false,
          children: [
            RiseListGroupItem(
              onTap: () {},
              prefix: RiseListGroupItemPrefix(
                child: Icon(Icons.palette_outlined, size: 22, color: rise.defaultForeground),
              ),
              content: RiseListGroupItemContent(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    RiseListGroupItemTitle('Appearance'),
                    SizedBox(height: 2),
                    RiseListGroupItemDescription('Theme, font size, display'),
                  ],
                ),
              ),
            ),
            const RiseListGroupInsetSeparator(),
            RiseListGroupItem(
              onTap: () {},
              prefix: RiseListGroupItemPrefix(
                child: Icon(Icons.notifications_outlined, size: 22, color: rise.defaultForeground),
              ),
              content: RiseListGroupItemContent(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    RiseListGroupItemTitle('Notifications'),
                    SizedBox(height: 2),
                    RiseListGroupItemDescription('Alerts, sounds, badges'),
                  ],
                ),
              ),
              suffix: RiseListGroupItemSuffix(
                iconSize: 18,
                iconColor: rise.mutedForeground(0.55),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
