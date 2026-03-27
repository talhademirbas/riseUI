/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_tabs.dart`. */

export const tabsUsageCode = `RiseTabs(
  tabViewHeight: 140,
  tabs: const [
    Tab(text: 'Overview'),
    Tab(text: 'Analytics'),
    Tab(text: 'Reports'),
  ],
  children: const [
    Text('Overview panel'),
    Text('Analytics panel'),
    Text('Reports panel'),
  ],
)`;

export const tabsVerticalCode = `RiseTabs(
  orientation: RiseTabsOrientation.vertical,
  variant: RiseTabsVariant.primary,
  tabViewHeight: 200,
  tabs: const [
    Tab(text: 'Account'),
    Tab(text: 'Security'),
  ],
  children: const [Text('Account'), Text('Security')],
)`;

export const tabsDisabledCode = `RiseTabs(
  tabViewHeight: 140,
  tabEnabled: const [true, false, true],
  tabs: const [
    Tab(text: 'Active'),
    Tab(text: 'Disabled'),
    Tab(text: 'Available'),
  ],
  children: const [Text('A'), Text('B'), Text('C')],
)`;

export const tabsWithSeparatorCode = `RiseTabs(
  tabViewHeight: 140,
  tabs: [
    const Tab(text: 'Overview'),
    Tab(child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 1, height: 14, child: DecoratedBox(decoration: BoxDecoration(color: lineColor))),
        const SizedBox(width: 12),
        const Text('Analytics'),
      ],
    )),
  ],
  children: const [Text('…'), Text('…')],
)`;

export const tabsCustomStylesCode = `RiseTabs(
  variant: RiseTabsVariant.secondary,
  tabViewHeight: 140,
  isScrollable: true,
  tabAlignment: TabAlignment.center,
  labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
  tabs: const [
    Tab(text: 'Daily'),
    Tab(text: 'Weekly'),
    Tab(text: 'Monthly'),
  ],
  children: const [Text('…'), Text('…'), Text('…')],
)`;

export const tabsSecondaryCode = `RiseTabs(
  variant: RiseTabsVariant.secondary,
  tabViewHeight: 140,
  tabs: const [
    Tab(text: 'Overview'),
    Tab(text: 'Analytics'),
  ],
  children: const [Text('…'), Text('…')],
)`;

export const tabsSecondaryVerticalCode = `RiseTabs(
  variant: RiseTabsVariant.secondary,
  orientation: RiseTabsOrientation.vertical,
  tabViewHeight: 200,
  tabs: const [
    Tab(text: 'Account'),
    Tab(text: 'Billing'),
  ],
  children: const [Text('…'), Text('…')],
)`;

export const tabsScrollableCode = `RiseTabs(
  variant: RiseTabsVariant.secondary,
  isScrollable: true,
  tabViewHeight: 120,
  tabs: const [
    Tab(text: 'Overview'),
    Tab(text: 'Analytics'),
    Tab(text: 'Reports'),
    Tab(text: 'Team'),
  ],
  children: const [Text('…'), Text('…'), Text('…'), Text('…')],
)`;
