import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Close button demos for docs iframe (`?embed=close-button-*`) — aligned with
/// [HeroUI CloseButton](https://heroui.com/docs/react/components/close-button).
class DocsEmbedCloseButton {
  DocsEmbedCloseButton._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static void _noop() {}

  static Widget usage(BuildContext context) {
    return _wrap(
      RiseCloseButton(onPressed: _noop),
    );
  }

  static Widget withCustomIcon(BuildContext context) {
    final rise = context.riseTheme;
    return _wrap(
      Wrap(
        spacing: 16,
        runSpacing: 16,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          RiseCloseButton(
            onPressed: _noop,
            child: Icon(Icons.close, size: 20, color: rise.defaultForeground.withValues(alpha: 0.55)),
          ),
          RiseCloseButton(
            onPressed: _noop,
            child: Icon(Icons.highlight_off_outlined, size: 20, color: rise.defaultForeground.withValues(alpha: 0.55)),
          ),
        ],
      ),
    );
  }

  static Widget interactive(BuildContext context) {
    return _wrap(const _CloseButtonInteractiveEmbed());
  }
}

class _CloseButtonInteractiveEmbed extends StatefulWidget {
  const _CloseButtonInteractiveEmbed();

  @override
  State<_CloseButtonInteractiveEmbed> createState() => _CloseButtonInteractiveEmbedState();
}

class _CloseButtonInteractiveEmbedState extends State<_CloseButtonInteractiveEmbed> {
  int _clicks = 0;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Clicked: $_clicks times', style: style),
        const SizedBox(height: 16),
        RiseCloseButton(
          onPressed: () => setState(() => _clicks++),
        ),
      ],
    );
  }
}
