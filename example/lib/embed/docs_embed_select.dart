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
  static Widget required(BuildContext context) => _wrap(const _SelectRequiredFormEmbed());
  static Widget fullWidth(BuildContext context) => _wrap(const _SelectFullWidthEmbed());
  static Widget variants(BuildContext context) => _wrap(const _SelectVariantsEmbed());
  static Widget multipleSelect(BuildContext context) => _wrap(const _SelectMultipleEmbed());
  static Widget withSections(BuildContext context) => _wrap(const _SelectSectionsEmbed());
  static Widget customIndicator(BuildContext context) => _wrap(const _SelectCustomIndicatorEmbed());
  static Widget customValue(BuildContext context) => _wrap(const _SelectCustomValueEmbed());
  static Widget controlled(BuildContext context) => _wrap(const _SelectControlledEmbed());
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
        RiseSelectItem(value: 'elephant', label: 'Elephant', isDisabled: true),
        RiseSelectItem(value: 'tiger', label: 'Tiger'),
      ],
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _SelectRequiredFormEmbed extends StatefulWidget {
  const _SelectRequiredFormEmbed();

  @override
  State<_SelectRequiredFormEmbed> createState() => _SelectRequiredFormEmbedState();
}

class _SelectRequiredFormEmbedState extends State<_SelectRequiredFormEmbed> {
  String? _state;
  String? _country;
  bool _attemptedSubmit = false;

  void _submit() {
    setState(() => _attemptedSubmit = true);
    final stateInvalid = _state == null;
    final countryInvalid = _country == null;
    if (stateInvalid || countryInvalid) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form submitted successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final stateInvalid = _attemptedSubmit && _state == null;
    final countryInvalid = _attemptedSubmit && _country == null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseSelect<String>(
          label: const Text('State'),
          isRequired: true,
          isInvalid: stateInvalid,
          placeholder: 'Select one',
          value: _state,
          items: _stateItems,
          onChanged: (v) => setState(() => _state = v),
          errorMessage: stateInvalid ? const Text('Please select a state') : null,
        ),
        const SizedBox(height: 14),
        RiseSelect<String>(
          label: const Text('Country'),
          isRequired: true,
          isInvalid: countryInvalid,
          placeholder: 'Select a country',
          value: _country,
          items: const [
            RiseSelectItem(value: 'us', label: 'United States'),
            RiseSelectItem(value: 'ca', label: 'Canada'),
            RiseSelectItem(value: 'mx', label: 'Mexico'),
            RiseSelectItem(value: 'uk', label: 'United Kingdom'),
            RiseSelectItem(value: 'fr', label: 'France'),
            RiseSelectItem(value: 'de', label: 'Germany'),
          ],
          onChanged: (v) => setState(() => _country = v),
          errorMessage: countryInvalid ? const Text('Please select a country') : null,
        ),
        const SizedBox(height: 16),
        RiseButton(
          onPressed: _submit,
          variant: RiseButtonVariant.primary,
          child: const Text('Submit'),
        ),
        if (!_attemptedSubmit || (_state != null && _country != null)) ...[
          const SizedBox(height: 8),
          Text(
            'Pick both fields, then submit.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
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
      label: const Text('State'),
      fullWidth: true,
      placeholder: 'Select one',
      value: _value,
      items: _stateItems,
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
        const SizedBox(height: 12),
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

class _SelectMultipleEmbed extends StatefulWidget {
  const _SelectMultipleEmbed();

  @override
  State<_SelectMultipleEmbed> createState() => _SelectMultipleEmbedState();
}

class _SelectMultipleEmbedState extends State<_SelectMultipleEmbed> {
  final List<String> _selected = [];

  @override
  Widget build(BuildContext context) {
    return RiseSelect<String>.multi(
      label: const Text('Countries to visit'),
      placeholder: 'Select countries',
      selectedValues: _selected,
      onValuesChanged: (v) => setState(() {
        _selected
          ..clear()
          ..addAll(v);
      }),
      items: const [
        RiseSelectItem(value: 'ar', label: 'Argentina'),
        RiseSelectItem(value: 've', label: 'Venezuela'),
        RiseSelectItem(value: 'jp', label: 'Japan'),
        RiseSelectItem(value: 'fr', label: 'France'),
        RiseSelectItem(value: 'it', label: 'Italy'),
        RiseSelectItem(value: 'es', label: 'Spain'),
        RiseSelectItem(value: 'th', label: 'Thailand'),
        RiseSelectItem(value: 'nz', label: 'New Zealand'),
        RiseSelectItem(value: 'is', label: 'Iceland'),
      ],
    );
  }
}

class _SelectSectionsEmbed extends StatefulWidget {
  const _SelectSectionsEmbed();

  @override
  State<_SelectSectionsEmbed> createState() => _SelectSectionsEmbedState();
}

class _SelectSectionsEmbedState extends State<_SelectSectionsEmbed> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return RiseSelect<String>(
      label: const Text('Country'),
      placeholder: 'Select one',
      value: _value,
      items: const [
        RiseSelectItem(value: 'us', label: 'United States', sectionHeader: 'North America'),
        RiseSelectItem(value: 'ca', label: 'Canada'),
        RiseSelectItem(value: 'mx', label: 'Mexico'),
        RiseSelectItem(value: 'uk', label: 'United Kingdom', sectionHeader: 'Europe'),
        RiseSelectItem(value: 'fr', label: 'France'),
        RiseSelectItem(value: 'de', label: 'Germany'),
        RiseSelectItem(value: 'es', label: 'Spain'),
        RiseSelectItem(value: 'it', label: 'Italy'),
        RiseSelectItem(value: 'jp', label: 'Japan', sectionHeader: 'Asia'),
        RiseSelectItem(value: 'cn', label: 'China'),
        RiseSelectItem(value: 'in', label: 'India'),
        RiseSelectItem(value: 'kr', label: 'South Korea'),
      ],
      onChanged: (v) => setState(() => _value = v),
    );
  }
}

class _SelectCustomIndicatorEmbed extends StatefulWidget {
  const _SelectCustomIndicatorEmbed();

  @override
  State<_SelectCustomIndicatorEmbed> createState() => _SelectCustomIndicatorEmbedState();
}

class _SelectCustomIndicatorEmbedState extends State<_SelectCustomIndicatorEmbed> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return RiseSelect<String>(
      label: const Text('State'),
      placeholder: 'Select one',
      value: _value,
      items: _stateItems,
      onChanged: (v) => setState(() => _value = v),
      indicatorIcon: const Icon(Icons.unfold_more, size: 20),
    );
  }
}

class _EmbedUser {
  const _EmbedUser({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.fallback,
  });

  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String fallback;
}

class _SelectCustomValueEmbed extends StatefulWidget {
  const _SelectCustomValueEmbed();

  @override
  State<_SelectCustomValueEmbed> createState() => _SelectCustomValueEmbedState();
}

class _SelectCustomValueEmbedState extends State<_SelectCustomValueEmbed> {
  static const _users = [
    _EmbedUser(
      id: '1',
      name: 'Bob',
      email: 'bob@example.com',
      avatarUrl: 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg',
      fallback: 'B',
    ),
    _EmbedUser(
      id: '2',
      name: 'Fred',
      email: 'fred@example.com',
      avatarUrl: 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg',
      fallback: 'F',
    ),
    _EmbedUser(
      id: '3',
      name: 'Martha',
      email: 'martha@example.com',
      avatarUrl: 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg',
      fallback: 'M',
    ),
  ];

  String? _userId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RiseSelect<String>(
      label: const Text('User'),
      placeholder: 'Select a user',
      value: _userId,
      items: [
        for (final u in _users)
          RiseSelectItem<String>(value: u.id, label: u.name),
      ],
      onChanged: (v) => setState(() => _userId = v),
      triggerValueBuilder: (ctx, {required defaultChild, required isPlaceholder}) {
        if (isPlaceholder || _userId == null) return defaultChild;
        final u = _users.firstWhere((e) => e.id == _userId, orElse: () => _users.first);
        final rise = ctx.riseTheme;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RiseAvatar(
              image: NetworkImage(u.avatarUrl),
              name: u.fallback,
              size: RiseAvatarSize.sm,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    u.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    u.email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: rise.mutedForeground(0.75),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SelectControlledEmbed extends StatefulWidget {
  const _SelectControlledEmbed();

  @override
  State<_SelectControlledEmbed> createState() => _SelectControlledEmbedState();
}

class _SelectControlledEmbedState extends State<_SelectControlledEmbed> {
  static const _states = [
    (id: 'california', name: 'California'),
    (id: 'texas', name: 'Texas'),
    (id: 'florida', name: 'Florida'),
    (id: 'new-york', name: 'New York'),
    (id: 'illinois', name: 'Illinois'),
    (id: 'pennsylvania', name: 'Pennsylvania'),
  ];

  String _stateId = 'california';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final matches = _states.where((s) => s.id == _stateId);
    final summary = matches.isEmpty ? 'None' : matches.first.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseSelect<String>(
          label: const Text('State (controlled)'),
          placeholder: 'Select one',
          value: _stateId,
          items: [for (final s in _states) RiseSelectItem(value: s.id, label: s.name)],
          onChanged: (v) => setState(() => _stateId = v ?? _stateId),
        ),
        const SizedBox(height: 8),
        Text(
          'Selected: $summary',
          style: theme.textTheme.bodySmall,
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
