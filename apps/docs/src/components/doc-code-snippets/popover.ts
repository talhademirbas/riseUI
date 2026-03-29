/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_popover.dart`. */

export const popoverUsageCode = `RisePopover(
  controller: controller,
  overlay: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Popover heading', style: headingStyle),
      Text('This is the popover content'),
      TextButton(onPressed: controller.hide, child: const Text('Close')),
    ],
  ),
  child: RiseButton(
    label: 'Open popover',
    variant: RiseButtonVariant.outline,
    onPressed: controller.show,
  ),
)`;

export const popoverWithArrowCode = `RisePopover(
  controller: controller,
  showArrow: true,
  overlay: /* … */,
  child: RiseButton(
    label: 'With arrow',
    variant: RiseButtonVariant.outline,
    onPressed: controller.show,
  ),
)`;

export const popoverPlacementCode = `RisePopover(
  controller: controller,
  placement: RisePopoverPlacement.right,
  showArrow: true,
  overlay: /* … */,
  child: RiseButton(
    label: 'Right',
    variant: RiseButtonVariant.outline,
    onPressed: controller.show,
  ),
)`;

export const popoverInteractiveContentCode = `RisePopover(
  controller: controller,
  showArrow: true,
  maxWidth: 300,
  overlay: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Sarah Johnson'),
      Text('@sarahj'),
      Row(
        children: [
          Expanded(child: RiseButton(label: 'Message', onPressed: () {})),
          Expanded(
            child: RiseButton(
              label: 'Close',
              variant: RiseButtonVariant.outline,
              onPressed: controller.hide,
            ),
          ),
        ],
      ),
    ],
  ),
  child: RiseButton(
    label: 'Interactive content',
    variant: RiseButtonVariant.outline,
    onPressed: controller.show,
  ),
)`;

export const popoverCustomTriggerCode = `RisePopover(
  controller: controller,
  overlay: const Text('Any widget can trigger'),
  child: InkWell(
    onTap: controller.show,
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(Icons.more_horiz), Text('Open popover')],
    ),
  ),
)`;

export const popoverCardHelpCode = `RisePopover(
  controller: helpController,
  placement: RisePopoverPlacement.right,
  showArrow: true,
  maxWidth: 220,
  overlay: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Help Information'),
      Text('Short helptext next to the card title.'),
      TextButton(onPressed: helpController.hide, child: const Text('Close')),
    ],
  ),
  child: RiseButton(
    isIconOnly: true,
    variant: RiseButtonVariant.ghost,
    size: RiseButtonSize.sm,
    onPressed: helpController.show,
    child: const Icon(Icons.info_outline),
  ),
)`;
