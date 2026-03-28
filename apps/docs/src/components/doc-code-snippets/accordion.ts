/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_accordion.dart`. */

export const accordionFaqCode = `final muted = context.riseTheme.mutedForeground(0.65);

RiseAccordion(
  selectionMode: RiseAccordionSelectionMode.single,
  initialExpanded: const ['2'],
  children: [
    RiseAccordionItem.panel(
      value: '1',
      leading: Icon(Icons.shopping_bag_outlined, size: 16, color: muted),
      title: const Text('How do I place an order?'),
      content: const Text('…'),
    ),
    // …more RiseAccordionItem.panel
  ],
)`;

export const accordionSurfaceCode = `RiseAccordion(
  variant: RiseAccordionVariant.surface,
  horizontalPadding: 20,
  separatorMargin: const EdgeInsets.symmetric(horizontal: 12),
  selectionMode: RiseAccordionSelectionMode.single,
  children: [
    RiseAccordionItem.panel(
      value: 'a',
      title: const Text('Surface panel A'),
      content: const Text('…'),
    ),
  ],
)`;

export const accordionMultipleCode = `RiseAccordion(
  selectionMode: RiseAccordionSelectionMode.multiple,
  initialExpanded: const ['x', 'y'],
  children: [
    RiseAccordionItem.panel(value: 'x', title: const Text('X'), content: const Text('…')),
    RiseAccordionItem.panel(value: 'y', title: const Text('Y'), content: const Text('…')),
  ],
)`;

export const accordionCustomIndicatorCode = `RiseAccordionItem(
  value: 'plus',
  child: Column(
    children: [
      RiseAccordionTrigger(
        child: Row(
          children: [
            Expanded(child: Text('Title', style: titleStyle)),
            RiseAccordionIndicator(
              expandedTurns: 0.125,
              child: Icon(Icons.add, size: 16, color: muted),
            ),
          ],
        ),
      ),
      RiseAccordionContent(child: const Text('…')),
    ],
  ),
)`;

export const accordionDisabledRootCode = `RiseAccordion(
  isDisabled: true,
  children: [
    RiseAccordionItem.panel(value: 'd1', title: const Text('…'), content: const Text('…')),
  ],
)`;

export const accordionDisabledItemsCode = `RiseAccordion(
  children: [
    RiseAccordionItem.panel(value: 'a', title: const Text('Active'), content: const Text('…')),
    RiseAccordionItem.panel(
      value: 'b',
      isDisabled: true,
      title: const Text('Disabled'),
      content: const Text('…'),
    ),
  ],
)`;

export const accordionWithoutSeparatorCode = `RiseAccordion(
  hideSeparator: true,
  children: [
    RiseAccordionItem.panel(value: '1', title: const Text('One'), content: const Text('…')),
  ],
)`;

export const accordionCustomRenderCode = `RiseAccordionItem.render(
  value: 'r',
  builder: (context, data) {
    return Column(
      children: [
        RiseAccordionTrigger(
          child: Row(
            children: [
              Expanded(child: Text(data.isExpanded ? 'Open' : 'Closed')),
              const RiseAccordionIndicator(),
            ],
          ),
        ),
        RiseAccordionContent(child: const Text('…')),
      ],
    );
  },
)`;

export const accordionAnatomyCode = `RiseAccordion(
  children: [
    RiseAccordionItem(
      value: '1',
      child: Column(
        children: [
          RiseAccordionTrigger(child: …),
          RiseAccordionContent(child: …),
        ],
      ),
    ),
  ],
)

// Or use RiseAccordionItem.panel(…) for a shortcut.`;

export const accordionFaqLayoutCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text('Frequently Asked Questions', style: …),
    Text('Everything you need to know…', style: muted),
    // Section label (e.g. GENERAL)
    RiseAccordion(
      selectionMode: RiseAccordionSelectionMode.single,
      children: [
        RiseAccordionItem.panel(value: 'gen-1', title: …, content: …),
      ],
    ),
    // More sections + RiseAccordion blocks…
  ],
)`;

export const accordionCustomStylesCode = `RiseAccordionTrigger(
  child: Row(
    children: [
      Icon(Icons.notifications_outlined, size: 20, color: iconColor),
      SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Set Up Notifications', style: titleStyle),
            Text('Receive account activity updates', style: subtitleStyle),
          ],
        ),
      ),
      const RiseAccordionIndicator(),
    ],
  ),
)`;

export const accordionCustomIndicatorVariantsCode = `RiseAccordionItem(
  value: 'i1',
  child: Column(
    children: [
      RiseAccordionTrigger(
        child: Row(
          children: [
            Expanded(child: Text('Using Plus')),
            RiseAccordionIndicator(
              expandedTurns: 0.125,
              child: Icon(Icons.add, size: 16),
            ),
          ],
        ),
      ),
      RiseAccordionContent(child: Text('…')),
    ],
  ),
)`;

export const accordionStylingWrapperCode = `Container(
  decoration: BoxDecoration(
    color: context.riseTheme.muted.withValues(alpha: 0.65),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: context.riseTheme.border),
  ),
  padding: const EdgeInsets.all(4),
  child: RiseAccordion(
    children: [
      RiseAccordionItem.panel(value: '1', title: const Text('…'), content: const Text('…')),
    ],
  ),
)`;
