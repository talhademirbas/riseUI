import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedTabs {
  DocsEmbedTabs._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _TabsUsageEmbed());
  static Widget vertical(BuildContext context) => _wrap(const _TabsVerticalEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _TabsDisabledEmbed());
  static Widget withSeparator(BuildContext context) => _wrap(const _TabsWithSeparatorEmbed());
  static Widget customStyles(BuildContext context) => _wrap(const _TabsCustomStylesEmbed());
  static Widget secondary(BuildContext context) => _wrap(const _TabsSecondaryEmbed());
  static Widget secondaryVertical(BuildContext context) => _wrap(const _TabsSecondaryVerticalEmbed());
  static Widget scrollable(BuildContext context) => _wrap(const _TabsScrollableEmbed());
}

class _TabsUsageEmbed extends StatelessWidget {
  const _TabsUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseTabs(
      tabViewHeight: 140,
      tabs: const [
        Tab(text: 'Overview'),
        Tab(text: 'Analytics'),
        Tab(text: 'Reports'),
      ],
      children: const [
        _PanelText('View your project overview and recent activity.'),
        _PanelText('Analytics and metrics for your workspace.'),
        _PanelText('Export and scheduled reports.'),
      ],
    );
  }
}

class _TabsVerticalEmbed extends StatelessWidget {
  const _TabsVerticalEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseTabs(
      orientation: RiseTabsOrientation.vertical,
      variant: RiseTabsVariant.primary,
      tabViewHeight: 200,
      tabs: const [
        Tab(text: 'Account'),
        Tab(text: 'Security'),
        Tab(text: 'Notifications'),
        Tab(text: 'Billing'),
      ],
      children: const [
        _PanelTitleBody(
          title: 'Account settings',
          body: 'Manage your account information and preferences.',
        ),
        _PanelText('Security options and sessions.'),
        _PanelText('Notification channels and quiet hours.'),
        _PanelText('Plans, invoices, and payment methods.'),
      ],
    );
  }
}

class _TabsDisabledEmbed extends StatelessWidget {
  const _TabsDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseTabs(
      tabViewHeight: 140,
      tabEnabled: const [true, false, true],
      tabs: const [
        Tab(text: 'Active'),
        Tab(text: 'Disabled'),
        Tab(text: 'Available'),
      ],
      children: const [
        _PanelText('This tab is active and can be selected.'),
        _PanelText('Unreachable panel.'),
        _PanelText('Another available tab.'),
      ],
    );
  }
}

class _TabsWithSeparatorEmbed extends StatelessWidget {
  const _TabsWithSeparatorEmbed();

  @override
  Widget build(BuildContext context) {
    final line = Theme.of(context).colorScheme.outline.withValues(alpha: 0.35);
    return RiseTabs(
      tabViewHeight: 140,
      tabs: [
        const Tab(text: 'Overview'),
        Tab(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 1,
                height: 14,
                child: DecoratedBox(decoration: BoxDecoration(color: line)),
              ),
              const SizedBox(width: 12),
              const Text('Analytics'),
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 1,
                height: 14,
                child: DecoratedBox(decoration: BoxDecoration(color: line)),
              ),
              const SizedBox(width: 12),
              const Text('Reports'),
            ],
          ),
        ),
      ],
      children: const [
        _PanelText('View your project overview and recent activity.'),
        _PanelText('Analytics content.'),
        _PanelText('Reports content.'),
      ],
    );
  }
}

class _TabsCustomStylesEmbed extends StatelessWidget {
  const _TabsCustomStylesEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseTabs(
      variant: RiseTabsVariant.secondary,
      tabViewHeight: 140,
      isScrollable: true,
      tabAlignment: TabAlignment.center,
      labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
      tabs: const [
        Tab(text: 'Daily'),
        Tab(text: 'Weekly'),
        Tab(text: 'Bi-weekly'),
        Tab(text: 'Monthly'),
      ],
      children: const [
        _PanelText('Daily digest and snapshots.'),
        _PanelText('Weekly summary charts.'),
        _PanelText('Bi-weekly review cadence.'),
        _PanelText('Monthly executive rollup.'),
      ],
    );
  }
}

class _TabsSecondaryEmbed extends StatelessWidget {
  const _TabsSecondaryEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseTabs(
      variant: RiseTabsVariant.secondary,
      tabViewHeight: 140,
      tabs: const [
        Tab(text: 'Overview'),
        Tab(text: 'Analytics'),
        Tab(text: 'Reports'),
      ],
      children: const [
        _PanelText('View your project overview and recent activity.'),
        _PanelText('Analytics content.'),
        _PanelText('Reports content.'),
      ],
    );
  }
}

class _TabsSecondaryVerticalEmbed extends StatelessWidget {
  const _TabsSecondaryVerticalEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseTabs(
      variant: RiseTabsVariant.secondary,
      orientation: RiseTabsOrientation.vertical,
      tabViewHeight: 200,
      tabs: const [
        Tab(text: 'Account'),
        Tab(text: 'Security'),
        Tab(text: 'Notifications'),
        Tab(text: 'Billing'),
      ],
      children: const [
        _PanelTitleBody(
          title: 'Account settings',
          body: 'Manage your account information and preferences.',
        ),
        _PanelText('Security options.'),
        _PanelText('Notification settings.'),
        _PanelText('Billing and plans.'),
      ],
    );
  }
}

class _TabsScrollableEmbed extends StatelessWidget {
  const _TabsScrollableEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseTabs(
      variant: RiseTabsVariant.secondary,
      isScrollable: true,
      tabViewHeight: 120,
      tabs: const [
        Tab(text: 'Overview'),
        Tab(text: 'Analytics'),
        Tab(text: 'Reports'),
        Tab(text: 'Team'),
        Tab(text: 'Billing'),
        Tab(text: 'Integrations'),
      ],
      children: const [
        _PanelText('Overview'),
        _PanelText('Analytics'),
        _PanelText('Reports'),
        _PanelText('Team'),
        _PanelText('Billing'),
        _PanelText('Integrations'),
      ],
    );
  }
}

class _PanelText extends StatelessWidget {
  const _PanelText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}

class _PanelTitleBody extends StatelessWidget {
  const _PanelTitleBody({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(body, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
