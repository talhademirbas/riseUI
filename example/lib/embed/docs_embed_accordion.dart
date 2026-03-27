import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

/// Max width aligned with docs (`max-w-md`).
const double kDocsEmbedMaxWidth = 448;

/// Shared accordion demos for the example app and docs Flutter embeds (`?embed=…`).
class DocsEmbedAccordion {
  DocsEmbedAccordion._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static TextStyle _titleStyle(BuildContext context) {
    final rise = context.riseTheme;
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.43,
      color: rise.defaultForeground,
    );
  }

  static TextStyle _bodyStyle(BuildContext context) {
    final rise = context.riseTheme;
    return TextStyle(
      fontSize: 14,
      height: 1.43,
      color: rise.mutedForeground(0.8),
    );
  }

  /// HeroUI surface shell: [RiseAccordionDecorations.surface] + inset separators.
  static RiseAccordion _surfaceAccordion({
    required BuildContext context,
    required List<Widget> children,
    List<String>? initialExpanded,
    RiseAccordionSelectionMode selectionMode = RiseAccordionSelectionMode.single,
  }) {
    return RiseAccordion(
      decoration: RiseAccordionDecorations.surface(context),
      horizontalPadding: 20,
      separatorMargin: const EdgeInsets.symmetric(horizontal: 12),
      selectionMode: selectionMode,
      initialExpanded: initialExpanded,
      children: children,
    );
  }

  /// Default — full width, separators only (no outer chrome).
  static Widget faq(BuildContext context) {
    final muted = context.riseTheme.mutedForeground(0.65);
    return _wrap(
      RiseAccordion(
        selectionMode: RiseAccordionSelectionMode.single,
        initialExpanded: const ['2'],
        children: [
          RiseAccordionItem.panel(
            value: '1',
            leading: Icon(Icons.shopping_bag_outlined, size: 16, color: muted),
            title: const Text('How do I place an order?'),
            content: const Text(
              'Lorem ipsum dolor sit amet consectetur. Netus nunc mauris risus consequat.',
            ),
          ),
          RiseAccordionItem.panel(
            value: '2',
            leading: Icon(Icons.credit_card_outlined, size: 16, color: muted),
            title: const Text('What payment methods do you accept?'),
            content: const Text(
              'Lorem ipsum dolor sit amet consectetur. Libero placerat dignissim consectetur nisl.',
            ),
          ),
          RiseAccordionItem.panel(
            value: '3',
            leading: Icon(Icons.local_shipping_outlined, size: 16, color: muted),
            title: const Text('How much does shipping cost?'),
            content: const Text(
              'Lorem ipsum dolor sit amet consectetur. Netus nunc mauris risus consequat.',
            ),
          ),
        ],
      ),
    );
  }

  /// Surface variant — gray zinc fill + border + shadow ([RiseThemeData.muted], HeroUI `variant="surface"`).
  static Widget surface(BuildContext context) {
    return _wrap(
      _surfaceAccordion(
        context: context,
        initialExpanded: const ['b'],
        children: [
          RiseAccordionItem.panel(
            value: 'a',
            title: const Text('Surface panel A'),
            content: const Text(
              'Rounded surface shell; extra horizontal padding and inset dividers.',
            ),
          ),
          RiseAccordionItem.panel(
            value: 'b',
            title: const Text('Surface panel B'),
            content: const Text(
              'Use RiseAccordionDecorations.surface or your own BoxDecoration.',
            ),
          ),
        ],
      ),
    );
  }

  /// Multiple expanded.
  static Widget multiple(BuildContext context) {
    return _wrap(
      RiseAccordion(
        selectionMode: RiseAccordionSelectionMode.multiple,
        initialExpanded: const ['x', 'y'],
        children: [
          RiseAccordionItem.panel(
            value: 'x',
            title: const Text('Panel X'),
            content: const Text('Open'),
          ),
          RiseAccordionItem.panel(
            value: 'y',
            title: const Text('Panel Y'),
            content: const Text('Open both at once.'),
          ),
        ],
      ),
    );
  }

  /// Custom indicator (plus → 45° like HeroUI “custom indicator” demos).
  static Widget customIndicator(BuildContext context) {
    final muted = context.riseTheme.mutedForeground(0.65);
    return _wrap(
      RiseAccordion(
        selectionMode: RiseAccordionSelectionMode.single,
        children: [
          RiseAccordionItem(
            value: 'plus',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                RiseAccordionTrigger(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Custom plus indicator',
                          style: _titleStyle(context),
                        ),
                      ),
                      RiseAccordionIndicator(
                        expandedTurns: 0.125,
                        child: Icon(Icons.add, size: 16, color: muted),
                      ),
                    ],
                  ),
                ),
                RiseAccordionContent(
                  child: Text(
                    'Use RiseAccordionIndicator with a child and expandedTurns for non-chevron icons.',
                    style: _bodyStyle(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Entire accordion disabled.
  static Widget disabledRoot(BuildContext context) {
    return _wrap(
      RiseAccordion(
        isDisabled: true,
        children: [
          RiseAccordionItem.panel(
            value: 'd1',
            title: const Text('Disabled item 1'),
            content: const Text('Not interactive when the root is disabled.'),
          ),
          RiseAccordionItem.panel(
            value: 'd2',
            title: const Text('Disabled item 2'),
            content: const Text('…'),
          ),
        ],
      ),
    );
  }

  /// Per-item disabled.
  static Widget disabledItems(BuildContext context) {
    return _wrap(
      RiseAccordion(
        children: [
          RiseAccordionItem.panel(
            value: 'a',
            title: const Text('Active'),
            content: const Text('This row can expand.'),
          ),
          RiseAccordionItem.panel(
            value: 'b',
            isDisabled: true,
            title: const Text('Disabled item'),
            content: const Text('This content is not reachable.'),
          ),
        ],
      ),
    );
  }

  /// Without separators.
  static Widget withoutSeparator(BuildContext context) {
    return _wrap(
      RiseAccordion(
        hideSeparator: true,
        selectionMode: RiseAccordionSelectionMode.single,
        children: [
          RiseAccordionItem.panel(
            value: '1',
            title: const Text('One'),
            content: const Text('No hairline between items.'),
          ),
          RiseAccordionItem.panel(
            value: '2',
            title: const Text('Two'),
            content: const Text('…'),
          ),
        ],
      ),
    );
  }

  /// FAQ layout — page title, subtitle, then **per-category** section labels + [RiseAccordion] blocks
  /// (same structure as HeroUI `CustomTemplate` in `accordion.stories.tsx`).
  static Widget faqLayout(BuildContext context) {
    final theme = Theme.of(context);
    final rise = context.riseTheme;
    final muted = rise.mutedForeground(0.75);

    Widget sectionLabel(String text, {double top = 20}) {
      return Padding(
        padding: EdgeInsets.only(top: top, bottom: 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
              color: muted,
            ),
          ),
        ),
      );
    }

    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Frequently Asked Questions',
            style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: rise.defaultForeground,
                ) ??
                TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: rise.defaultForeground,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Everything you need to know about licensing and usage.',
            style: TextStyle(
              fontSize: 14,
              height: 1.43,
              color: muted,
            ),
          ),
          sectionLabel('General', top: 24),
          _surfaceAccordion(
            context: context,
            children: [
              RiseAccordionItem.panel(
                value: 'gen-1',
                title: const Text('How do I place an order?'),
                content: const Text(
                  'Browse our products, add items to your cart, and proceed to checkout. '
                  "You'll need to provide shipping and payment information to complete your purchase.",
                ),
              ),
              RiseAccordionItem.panel(
                value: 'gen-2',
                title: const Text('Can I modify or cancel my order?'),
                content: const Text(
                  "Yes, you can modify or cancel your order before it's shipped. "
                  "Once your order is processed, you can't make changes.",
                ),
              ),
            ],
          ),
          sectionLabel('Licensing'),
          _surfaceAccordion(
            context: context,
            children: [
              RiseAccordionItem.panel(
                value: 'lic-1',
                title: const Text('How do I purchase a license?'),
                content: const Text(
                  'You can purchase a license directly from our website. '
                  'Select the license type that fits your needs and proceed to checkout.',
                ),
              ),
              RiseAccordionItem.panel(
                value: 'lic-2',
                title: const Text('What is the difference between a standard and a pro license?'),
                content: const Text(
                  'A standard license is for personal use or small projects, while a pro license '
                  'includes commercial use rights and priority support.',
                ),
              ),
            ],
          ),
          sectionLabel('Support'),
          _surfaceAccordion(
            context: context,
            children: [
              RiseAccordionItem.panel(
                value: 'sup-1',
                title: const Text('How do I get support?'),
                content: const Text(
                  'You can reach our support team through the contact form on our website, '
                  'or email us directly at support@example.com.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Custom styles — rich triggers with **leading icon + title + subtitle** (HeroUI “Custom Styles” story).
  static Widget customStyles(BuildContext context) {
    final rise = context.riseTheme;
    final iconColor = rise.mutedForeground(0.55);
    final title = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.43,
      color: rise.defaultForeground,
    );
    final subtitle = TextStyle(
      fontSize: 12,
      height: 1.33,
      color: rise.mutedForeground(0.75),
    );
    final body = _bodyStyle(context);

    Widget richItem({
      required String value,
      required IconData leading,
      required String primary,
      required String secondary,
      required String expandedText,
    }) {
      return RiseAccordionItem(
        value: value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            RiseAccordionTrigger(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(leading, size: 20, color: iconColor),
                  SizedBox(width: RiseAccordionData.leadingToTitleGap),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(primary, style: title),
                        const SizedBox(height: 2),
                        Text(secondary, style: subtitle),
                      ],
                    ),
                  ),
                  const RiseAccordionIndicator(),
                ],
              ),
            ),
            RiseAccordionContent(
              child: Text(expandedText, style: body),
            ),
          ],
        ),
      );
    }

    return _wrap(
      RiseAccordion(
        selectionMode: RiseAccordionSelectionMode.single,
        children: [
          richItem(
            value: 'n1',
            leading: Icons.notifications_outlined,
            primary: 'Set Up Notifications',
            secondary: 'Receive account activity updates',
            expandedText:
                'Stay informed about your account activity with real-time notifications.',
          ),
          richItem(
            value: 'n2',
            leading: Icons.extension_outlined,
            primary: 'Set up Browser Extension',
            secondary: 'Connect your browser to your account',
            expandedText:
                'Enhance your browsing experience by installing our official browser extension.',
          ),
          richItem(
            value: 'n3',
            leading: Icons.auto_awesome_outlined,
            primary: 'Mint Collectible',
            secondary: 'Create your first collectible',
            expandedText:
                'Begin your journey into the world of digital collectibles by creating your first NFT.',
          ),
        ],
      ),
    );
  }

  /// Three indicator styles in one accordion (plus / alternate icons) — mirrors HeroUI “Custom Indicator” rows.
  static Widget customIndicatorVariants(BuildContext context) {
    final muted = context.riseTheme.mutedForeground(0.65);
    return _wrap(
      RiseAccordion(
        selectionMode: RiseAccordionSelectionMode.single,
        children: [
          RiseAccordionItem(
            value: 'i1',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                RiseAccordionTrigger(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Using Plus', style: _titleStyle(context)),
                      ),
                      RiseAccordionIndicator(
                        expandedTurns: 0.125,
                        child: Icon(Icons.add, size: 16, color: muted),
                      ),
                    ],
                  ),
                ),
                RiseAccordionContent(
                  child: Text(
                    'Plus rotates 45° when expanded.',
                    style: _bodyStyle(context),
                  ),
                ),
              ],
            ),
          ),
          RiseAccordionItem(
            value: 'i2',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                RiseAccordionTrigger(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Using Caret', style: _titleStyle(context)),
                      ),
                      RiseAccordionIndicator(
                        child: Icon(Icons.arrow_drop_down, size: 20, color: muted),
                      ),
                    ],
                  ),
                ),
                RiseAccordionContent(
                  child: Text(
                    'Any icon receives the rotation animation.',
                    style: _bodyStyle(context),
                  ),
                ),
              ],
            ),
          ),
          RiseAccordionItem(
            value: 'i3',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                RiseAccordionTrigger(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Using Arrow', style: _titleStyle(context)),
                      ),
                      RiseAccordionIndicator(
                        child: Icon(Icons.keyboard_arrow_down, size: 18, color: muted),
                      ),
                    ],
                  ),
                ),
                RiseAccordionContent(
                  child: Text(
                    'Pass a custom child into RiseAccordionIndicator.',
                    style: _bodyStyle(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Render function / builder API.
  static Widget customRender(BuildContext context) {
    return _wrap(
      RiseAccordion(
        selectionMode: RiseAccordionSelectionMode.single,
        children: [
          RiseAccordionItem.render(
            value: 'r',
            builder: (context, data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RiseAccordionTrigger(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            data.isExpanded ? 'Expanded' : 'Collapsed — tap',
                            style: _titleStyle(context),
                          ),
                        ),
                        const RiseAccordionIndicator(),
                      ],
                    ),
                  ),
                  RiseAccordionContent(
                    child: Text(
                      'RiseAccordionItem.render exposes isExpanded and value.',
                      style: _bodyStyle(context),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
