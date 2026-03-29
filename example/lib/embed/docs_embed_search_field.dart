import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedSearchField {
  DocsEmbedSearchField._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _SearchFieldUsageEmbed());
  static Widget withDescription(BuildContext context) => _wrap(const _SearchFieldWithDescriptionEmbed());
  static Widget required(BuildContext context) => _wrap(const _SearchFieldRequiredEmbed());
  static Widget validation(BuildContext context) => _wrap(const _SearchFieldValidationEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _SearchFieldDisabledEmbed());
  static Widget controlled(BuildContext context) => _wrap(const _SearchFieldControlledEmbed());
  static Widget fullWidth(BuildContext context) => _wrap(const _SearchFieldFullWidthEmbed());
  static Widget variants(BuildContext context) => _wrap(const _SearchFieldVariantsEmbed());
}

class _SearchFieldUsageEmbed extends StatelessWidget {
  const _SearchFieldUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseSearchField(
      label: Text('Search'),
      hintText: 'Search...',
    );
  }
}

class _SearchFieldWithDescriptionEmbed extends StatelessWidget {
  const _SearchFieldWithDescriptionEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseSearchField(
      label: Text('Search products'),
      description: Text('Enter keywords to search for products'),
      hintText: 'Shoes, bags, watches...',
    );
  }
}

class _SearchFieldRequiredEmbed extends StatelessWidget {
  const _SearchFieldRequiredEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseSearchField(
      label: Text('Search query'),
      isRequired: true,
      description: Text('Minimum 3 characters required'),
    );
  }
}

class _SearchFieldValidationEmbed extends StatefulWidget {
  const _SearchFieldValidationEmbed();

  @override
  State<_SearchFieldValidationEmbed> createState() => _SearchFieldValidationEmbedState();
}

class _SearchFieldValidationEmbedState extends State<_SearchFieldValidationEmbed> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    final invalid = _value.isNotEmpty && _value.length < 3;
    return RiseSearchField(
      label: const Text('Search'),
      isInvalid: invalid,
      errorMessage: invalid ? const Text('Search query must be at least 3 characters') : null,
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _SearchFieldDisabledEmbed extends StatelessWidget {
  const _SearchFieldDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseSearchField(
      label: Text('Search'),
      description: Text('This search field is disabled'),
      enabled: false,
      hintText: 'Disabled',
    );
  }
}

class _SearchFieldControlledEmbed extends StatefulWidget {
  const _SearchFieldControlledEmbed();

  @override
  State<_SearchFieldControlledEmbed> createState() => _SearchFieldControlledEmbedState();
}

class _SearchFieldControlledEmbedState extends State<_SearchFieldControlledEmbed> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseSearchField(
          label: const Text('Search'),
          controller: _controller,
          onChanged: (_) => setState(() {}),
          onClear: () => setState(() {}),
        ),
        const SizedBox(height: 8),
        Text('Current value: ${_controller.text.isEmpty ? '(empty)' : _controller.text}'),
      ],
    );
  }
}

class _SearchFieldFullWidthEmbed extends StatelessWidget {
  const _SearchFieldFullWidthEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseSearchField(
      label: Text('Search'),
      fullWidth: true,
      hintText: 'Full width search...',
    );
  }
}

class _SearchFieldVariantsEmbed extends StatelessWidget {
  const _SearchFieldVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Primary variant',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: rise.mutedForeground(0.75),
          ),
        ),
        const SizedBox(height: 8),
        const RiseSearchField(
          hintText: 'Search...',
          variant: RiseSearchFieldVariant.primary,
        ),
        const SizedBox(height: 20),
        Text(
          'Secondary variant',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: rise.mutedForeground(0.75),
          ),
        ),
        const SizedBox(height: 8),
        const RiseSearchField(
          hintText: 'Search...',
          variant: RiseSearchFieldVariant.secondary,
        ),
      ],
    );
  }
}
