import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Popover demos for docs iframe (`?embed=popover-*`).
///
/// Layouts mirror HeroUI Storybook
/// [popover.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/popover/popover.stories.tsx).
class DocsEmbedPopover {
  DocsEmbedPopover._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _PopoverUsageEmbed());
  static Widget withArrow(BuildContext context) => _wrap(const _PopoverWithArrowEmbed());
  static Widget placement(BuildContext context) => _wrap(const _PopoverPlacementEmbed());
  static Widget interactiveContent(BuildContext context) =>
      _wrap(const _PopoverInteractiveEmbed());
  static Widget customTrigger(BuildContext context) => _wrap(const _PopoverCustomTriggerEmbed());
  static Widget cardHelp(BuildContext context) => _wrap(const _PopoverCardHelpEmbed());
}

class _PopoverUsageEmbed extends StatefulWidget {
  const _PopoverUsageEmbed();

  @override
  State<_PopoverUsageEmbed> createState() => _PopoverUsageEmbedState();
}

class _PopoverUsageEmbedState extends State<_PopoverUsageEmbed> {
  final _controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return RisePopover(
      controller: _controller,
      overlay: _PopoverDialogBody(
        title: 'Popover heading',
        body: 'This is the popover content',
        onClose: _controller.hide,
      ),
      child: RiseButton(
        label: 'Open popover',
        variant: RiseButtonVariant.outline,
        onPressed: _controller.show,
      ),
    );
  }
}

class _PopoverWithArrowEmbed extends StatefulWidget {
  const _PopoverWithArrowEmbed();

  @override
  State<_PopoverWithArrowEmbed> createState() => _PopoverWithArrowEmbedState();
}

class _PopoverWithArrowEmbedState extends State<_PopoverWithArrowEmbed> {
  final _controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return RisePopover(
      controller: _controller,
      showArrow: true,
      overlay: _PopoverDialogBody(
        title: 'Popover heading',
        body: 'This is the popover content',
        onClose: _controller.hide,
      ),
      child: RiseButton(
        label: 'With arrow',
        variant: RiseButtonVariant.outline,
        onPressed: _controller.show,
      ),
    );
  }
}

class _PopoverPlacementEmbed extends StatelessWidget {
  const _PopoverPlacementEmbed();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _PlacementButton(label: 'Top', placement: RisePopoverPlacement.top),
        _PlacementButton(label: 'Right', placement: RisePopoverPlacement.right),
        _PlacementButton(label: 'Bottom', placement: RisePopoverPlacement.bottom),
        _PlacementButton(label: 'Left', placement: RisePopoverPlacement.left),
      ],
    );
  }
}

class _PlacementButton extends StatefulWidget {
  const _PlacementButton({required this.label, required this.placement});

  final String label;
  final RisePopoverPlacement placement;

  @override
  State<_PlacementButton> createState() => _PlacementButtonState();
}

class _PlacementButtonState extends State<_PlacementButton> {
  final _controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return RisePopover(
      controller: _controller,
      placement: widget.placement,
      showArrow: true,
      overlay: _PopoverDialogBody(
        title: widget.label,
        body: 'Placement: ${widget.placement.name}',
        onClose: _controller.hide,
      ),
      child: RiseButton(
        label: widget.label,
        variant: RiseButtonVariant.outline,
        onPressed: _controller.show,
      ),
    );
  }
}

class _PopoverInteractiveEmbed extends StatefulWidget {
  const _PopoverInteractiveEmbed();

  @override
  State<_PopoverInteractiveEmbed> createState() => _PopoverInteractiveEmbedState();
}

class _PopoverInteractiveEmbedState extends State<_PopoverInteractiveEmbed> {
  final _controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return RisePopover(
      controller: _controller,
      showArrow: true,
      maxWidth: 300,
      overlay: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sarah Johnson',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 20 / 14,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            '@sarahj',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  height: 16 / 12,
                  color: rise.mutedForeground(),
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Interactive actions can live inside this popover.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 20 / 14),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: RiseButton(
                  label: 'Message',
                  size: RiseButtonSize.sm,
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RiseButton(
                  label: 'Close',
                  size: RiseButtonSize.sm,
                  variant: RiseButtonVariant.outline,
                  onPressed: _controller.hide,
                ),
              ),
            ],
          ),
        ],
      ),
      child: RiseButton(
        label: 'Interactive content',
        variant: RiseButtonVariant.outline,
        onPressed: _controller.show,
      ),
    );
  }
}

class _PopoverCustomTriggerEmbed extends StatefulWidget {
  const _PopoverCustomTriggerEmbed();

  @override
  State<_PopoverCustomTriggerEmbed> createState() => _PopoverCustomTriggerEmbedState();
}

class _PopoverCustomTriggerEmbedState extends State<_PopoverCustomTriggerEmbed> {
  final _controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return RisePopover(
      controller: _controller,
      overlay: _PopoverDialogBody(
        title: 'Custom trigger',
        body: 'Any widget can anchor this popover.',
        onClose: _controller.hide,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: _controller.show,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: context.riseTheme.border.withValues(alpha: 0.65)),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.more_horiz, size: 18),
              SizedBox(width: 6),
              Text('Open popover'),
            ],
          ),
        ),
      ),
    );
  }
}

/// CardWithHelptext story — help icon beside title, popover to the right with arrow.
class _PopoverCardHelpEmbed extends StatefulWidget {
  const _PopoverCardHelpEmbed();

  @override
  State<_PopoverCardHelpEmbed> createState() => _PopoverCardHelpEmbedState();
}

class _PopoverCardHelpEmbedState extends State<_PopoverCardHelpEmbed> {
  final _controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return SizedBox(
      width: 400,
      child: RiseCard(
        variant: RiseCardVariant.default_,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            RiseCardHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(child: RiseCardTitle(child: Text('Card Title'))),
                      RisePopover(
                        controller: _controller,
                        placement: RisePopoverPlacement.right,
                        showArrow: true,
                        maxWidth: 220,
                        minWidth: 160,
                        overlay: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Help Information',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 20 / 14,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'This is a helptext popover on top of the card surface. It '
                              'provides extra context about the title.',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 14,
                                    height: 20 / 14,
                                    color: rise.mutedForeground(),
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: _controller.hide,
                                child: const Text('Close'),
                              ),
                            ),
                          ],
                        ),
                        child: RiseButton(
                          isIconOnly: true,
                          variant: RiseButtonVariant.ghost,
                          size: RiseButtonSize.sm,
                          onPressed: _controller.show,
                          child: Icon(Icons.info_outline, size: 18, color: rise.mutedForeground()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: RiseCard.sectionGap),
                  RiseCardDescription(
                    child: Text(
                      'This card shows a popover next to the title for inline help.',
                      style: TextStyle(color: rise.mutedForeground()),
                    ),
                  ),
                ],
              ),
            ),
            RiseCardContent(
              child: Text(
                'The help control stays beside the title so the layout stays clean.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 20 / 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Body matching `Popover.Dialog` + `Popover.Heading` (`.popover__heading` `font-medium`).
class _PopoverDialogBody extends StatelessWidget {
  const _PopoverDialogBody({
    required this.title,
    required this.body,
    required this.onClose,
  });

  final String title;
  final String body;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 20 / 14,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 20 / 14),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: onClose,
            child: const Text('Close'),
          ),
        ),
      ],
    );
  }
}
