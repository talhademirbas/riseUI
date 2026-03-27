/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_popover.dart`. */

export const popoverUsageCode = `RisePopover(
  controller: controller,
  overlay: const Text('Popover content'),
  child: RiseButton(
    label: 'Click me',
    variant: RiseButtonVariant.outline,
    onPressed: controller.show,
  ),
)`;

export const popoverWithArrowCode = `RisePopover(
  controller: controller,
  showArrow: true,
  offset: const Offset(0, 10),
  overlay: const Text('Arrow enabled'),
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
  overlay: const Text('Placement: right'),
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
      RiseButton(label: 'Close', onPressed: controller.hide),
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
