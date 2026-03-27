import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

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
      overlay: _PopoverCard(
        title: 'Popover',
        body: 'Displays rich content in an anchored overlay.',
        onClose: _controller.hide,
      ),
      child: RiseButton(
        label: 'Click me',
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
      offset: const Offset(0, 10),
      overlay: _PopoverCard(
        title: 'With Arrow',
        body: 'Arrow points toward the trigger anchor.',
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
      overlay: _PopoverCard(
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
    return RisePopover(
      controller: _controller,
      showArrow: true,
      maxWidth: 300,
      overlay: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Sarah Johnson', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text('@sarahj', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 12),
            const Text('Interactive actions can live inside this popover.'),
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
      overlay: _PopoverCard(
        title: 'Custom trigger',
        body: 'Any widget can trigger the popover.',
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

class _PopoverCard extends StatelessWidget {
  const _PopoverCard({required this.title, required this.body, required this.onClose});

  final String title;
  final String body;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(body),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onClose,
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}
