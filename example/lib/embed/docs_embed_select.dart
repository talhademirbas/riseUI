import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedSelect {
  DocsEmbedSelect._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _SelectUsageEmbed());
  static Widget withDescription(BuildContext context) => _wrap(const _SelectWithDescriptionEmbed());
  static Widget withDisabledOptions(BuildContext context) => _wrap(const _SelectWithDisabledOptionsEmbed());
  static Widget required(BuildContext context) => _wrap(const _SelectRequiredEmbed());
  static Widget fullWidth(BuildContext context) => _wrap(const _SelectFullWidthEmbed());
  static Widget variants(BuildContext context) => _wrap(const _SelectVariantsEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _SelectDisabledEmbed());
}

const _stateItems = [
  RiseSelectItem<String>(value: 'florida', label: 'Florida'),
  RiseSelectItem<String>(value: 'delaware', label: 'Delaware'),
  RiseSelectItem<String>(value: 'california', label: 'California'),
  RiseSelectItem<String>(value: 'texas', label: 'Texas'),
  RiseSelectItem<String>(value: 'new-york', label: 'New York'),
  RiseSelectItem<String>(value: 'washington', label: 'Washington'),
];

class _SelectUsageEmbed extends StatefulWidget {
  const _SelectUsageEmbed();

  @override
  State<_SelectUsageEmbed> createState() => _SelectUsageEmbedState();
}

class _SelectUsageEmbedState extends State<_SelectUsageEmbed> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return RiseSelect<String>(
      label: const Text('State'),
      placeholder: 'Select one',
      value: _value,
      items: _stateItems,
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _SelectWithDescriptionEmbed extends StatefulWidget {
  const _SelectWithDescriptionEmbed();

  @override
  State<_SelectWithDescriptionEmbed> createState() => _SelectWithDescriptionEmbedState();
}

class _SelectWithDescriptionEmbedState extends State<_SelectWithDescriptionEmbed> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return RiseSelect<String>(
      label: const Text('State'),
      description: const Text('Select your state of residence'),
      placeholder: 'Select one',
      value: _value,
      items: _stateItems,
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _SelectWithDisabledOptionsEmbed extends StatefulWidget {
  const _SelectWithDisabledOptionsEmbed();

  @override
  State<_SelectWithDisabledOptionsEmbed> createState() => _SelectWithDisabledOptionsEmbedState();
}

class _SelectWithDisabledOptionsEmbedState extends State<_SelectWithDisabledOptionsEmbed> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return RiseSelect<String>(
      label: const Text('Animal'),
      placeholder: 'Select an animal',
      value: _value,
      items: const [
        RiseSelectItem(value: 'dog', label: 'Dog'),
        RiseSelectItem(value: 'cat', label: 'Cat', isDisabled: true),
        RiseSelectItem(value: 'bird', label: 'Bird'),
        RiseSelectItem(value: 'kangaroo', label: 'Kangaroo', isDisabled: true),
      ],
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _SelectRequiredEmbed extends StatefulWidget {
  const _SelectRequiredEmbed();

  @override
  State<_SelectRequiredEmbed> createState() => _SelectRequiredEmbedState();
}

class _SelectRequiredEmbedState extends State<_SelectRequiredEmbed> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    final invalid = _value == null;
    return RiseSelect<String>(
      label: const Text('Country'),
      isRequired: true,
      isInvalid: invalid,
      placeholder: 'Select a country',
      errorMessage: invalid ? const Text('Please select a country') : null,
      value: _value,
      items: const [
        RiseSelectItem(value: 'us', label: 'United States'),
        RiseSelectItem(value: 'ca', label: 'Canada'),
        RiseSelectItem(value: 'mx', label: 'Mexico'),
      ],
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _SelectFullWidthEmbed extends StatefulWidget {
  const _SelectFullWidthEmbed();

  @override
  State<_SelectFullWidthEmbed> createState() => _SelectFullWidthEmbedState();
}

class _SelectFullWidthEmbedState extends State<_SelectFullWidthEmbed> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return RiseSelect<String>(
      label: const Text('Favorite animal'),
      fullWidth: true,
      placeholder: 'Select one',
      value: _value,
      items: const [
        RiseSelectItem(value: 'cat', label: 'Cat'),
        RiseSelectItem(value: 'dog', label: 'Dog'),
        RiseSelectItem(value: 'bird', label: 'Bird'),
      ],
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _SelectVariantsEmbed extends StatefulWidget {
  const _SelectVariantsEmbed();

  @override
  State<_SelectVariantsEmbed> createState() => _SelectVariantsEmbedState();
}

class _SelectVariantsEmbedState extends State<_SelectVariantsEmbed> {
  String? _primary;
  String? _secondary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseSelect<String>(
          label: const Text('Primary variant'),
          placeholder: 'Select one',
          value: _primary,
          items: const [
            RiseSelectItem(value: '1', label: 'Option 1'),
            RiseSelectItem(value: '2', label: 'Option 2'),
          ],
          onChanged: (v) => setState(() => _primary = v),
        ),
        const SizedBox(height: 10),
        RiseSelect<String>(
          label: const Text('Secondary variant'),
          variant: RiseSelectVariant.secondary,
          placeholder: 'Select one',
          value: _secondary,
          items: const [
            RiseSelectItem(value: '1', label: 'Option 1'),
            RiseSelectItem(value: '2', label: 'Option 2'),
          ],
          onChanged: (v) => setState(() => _secondary = v),
        ),
      ],
    );
  }
}

class _SelectDisabledEmbed extends StatelessWidget {
  const _SelectDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseSelect<String>(
      label: const Text('State'),
      placeholder: 'Select one',
      value: 'california',
      enabled: false,
      items: _stateItems,
      onChanged: (_) {},
    );
  }
}
