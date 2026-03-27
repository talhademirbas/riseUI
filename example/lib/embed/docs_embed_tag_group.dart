import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Tag group demos for docs iframe (`?embed=tag-group-*`).
class DocsEmbedTagGroup {
  DocsEmbedTagGroup._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) {
    return _wrap(const _TagUsageEmbed());
  }

  static Widget sizes(BuildContext context) {
    return _wrap(const _TagSizesEmbed());
  }

  static Widget variants(BuildContext context) {
    return _wrap(const _TagVariantsEmbed());
  }

  static Widget disabled(BuildContext context) {
    return _wrap(const _TagDisabledEmbed());
  }

  static Widget selectionModes(BuildContext context) {
    return _wrap(const _TagSelectionModesEmbed());
  }

  static Widget withIcons(BuildContext context) {
    return _wrap(const _TagWithIconsEmbed());
  }

  static Widget withRemove(BuildContext context) {
    return _wrap(const _TagWithRemoveEmbed());
  }

  static Widget withError(BuildContext context) {
    return _wrap(const _TagWithErrorEmbed());
  }
}

class _TagUsageEmbed extends StatefulWidget {
  const _TagUsageEmbed();

  @override
  State<_TagUsageEmbed> createState() => _TagUsageEmbedState();
}

class _TagUsageEmbedState extends State<_TagUsageEmbed> {
  final Set<String> _selected = {'news'};

  @override
  Widget build(BuildContext context) {
    return RiseTagGroup<String>(
      values: const ['news', 'travel', 'gaming', 'shopping'],
      labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
      selected: _selected,
      onChanged: (s) => setState(() {
        _selected
          ..clear()
          ..addAll(s);
      }),
    );
  }
}

class _TagSizesEmbed extends StatefulWidget {
  const _TagSizesEmbed();

  @override
  State<_TagSizesEmbed> createState() => _TagSizesEmbedState();
}

class _TagSizesEmbedState extends State<_TagSizesEmbed> {
  final Set<String> _a = {'news'};
  final Set<String> _b = {'news'};
  final Set<String> _c = {'news'};

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    Widget block(String title, RiseTagSize size, Set<String> sel, void Function(Set<String>) onChanged) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: muted),
            const SizedBox(height: 8),
            RiseTagGroup<String>(
              size: size,
              values: const ['news', 'travel', 'gaming'],
              labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
              selected: sel,
              onChanged: onChanged,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        block('Small', RiseTagSize.sm, _a, (s) => setState(() {
              _a
                ..clear()
                ..addAll(s);
            })),
        block('Medium', RiseTagSize.md, _b, (s) => setState(() {
              _b
                ..clear()
                ..addAll(s);
            })),
        block('Large', RiseTagSize.lg, _c, (s) => setState(() {
              _c
                ..clear()
                ..addAll(s);
            })),
      ],
    );
  }
}

class _TagVariantsEmbed extends StatefulWidget {
  const _TagVariantsEmbed();

  @override
  State<_TagVariantsEmbed> createState() => _TagVariantsEmbedState();
}

class _TagVariantsEmbedState extends State<_TagVariantsEmbed> {
  final Set<String> _d = {'news'};
  final Set<String> _s = {'news'};

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Default', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          variant: RiseTagVariant.default_,
          values: const ['news', 'travel', 'gaming'],
          labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
          selected: _d,
          onChanged: (s) => setState(() {
            _d
              ..clear()
              ..addAll(s);
          }),
        ),
        const SizedBox(height: 16),
        Text('Surface', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          variant: RiseTagVariant.surface,
          values: const ['news', 'travel', 'gaming'],
          labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
          selected: _s,
          onChanged: (s) => setState(() {
            _s
              ..clear()
              ..addAll(s);
          }),
        ),
      ],
    );
  }
}

class _TagDisabledEmbed extends StatefulWidget {
  const _TagDisabledEmbed();

  @override
  State<_TagDisabledEmbed> createState() => _TagDisabledEmbedState();
}

class _TagDisabledEmbedState extends State<_TagDisabledEmbed> {
  final Set<String> _selected = {'news'};

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Group disabled', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          isDisabled: true,
          values: const ['news', 'travel', 'gaming'],
          labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
          selected: _selected,
          onChanged: (_) {},
        ),
        const SizedBox(height: 16),
        Text('disabledKeys (travel)', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          disabledKeys: const {'travel'},
          values: const ['news', 'travel', 'gaming'],
          labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
          selected: _selected,
          onChanged: (s) => setState(() {
            _selected
              ..clear()
              ..addAll(s);
          }),
        ),
      ],
    );
  }
}

class _TagSelectionModesEmbed extends StatefulWidget {
  const _TagSelectionModesEmbed();

  @override
  State<_TagSelectionModesEmbed> createState() => _TagSelectionModesEmbedState();
}

class _TagSelectionModesEmbedState extends State<_TagSelectionModesEmbed> {
  final Set<String> _single = {'news'};
  final Set<String> _multi = {'news', 'travel'};

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    Widget block(String title, RiseTagGroupSelectionMode mode, Set<String> sel, ValueChanged<Set<String>> onChanged) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: muted),
            const SizedBox(height: 8),
            RiseTagGroup<String>(
              selectionMode: mode,
              values: const ['news', 'travel', 'gaming', 'shopping'],
              labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
              selected: sel,
              onChanged: onChanged,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        block('Single', RiseTagGroupSelectionMode.single, _single, (s) => setState(() {
              _single
                ..clear()
                ..addAll(s);
            })),
        block('Multiple', RiseTagGroupSelectionMode.multiple, _multi, (s) => setState(() {
              _multi
                ..clear()
                ..addAll(s);
            })),
      ],
    );
  }
}

class _TagWithIconsEmbed extends StatefulWidget {
  const _TagWithIconsEmbed();

  @override
  State<_TagWithIconsEmbed> createState() => _TagWithIconsEmbedState();
}

class _TagWithIconsEmbedState extends State<_TagWithIconsEmbed> {
  final Set<String> _selected = {'news'};

  static IconData _iconFor(String v) {
    return switch (v) {
      'news' => Icons.article_outlined,
      'travel' => Icons.flight_takeoff,
      'gaming' => Icons.sports_esports_outlined,
      'shopping' => Icons.shopping_bag_outlined,
      _ => Icons.label_outline,
    };
  }

  @override
  Widget build(BuildContext context) {
    return RiseTagGroup<String>(
      values: const ['news', 'travel', 'gaming', 'shopping'],
      labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
      selected: _selected,
      leadingBuilder: (v) => Icon(_iconFor(v), size: 16),
      onChanged: (s) => setState(() {
        _selected
          ..clear()
          ..addAll(s);
      }),
    );
  }
}

class _TagWithRemoveEmbed extends StatefulWidget {
  const _TagWithRemoveEmbed();

  @override
  State<_TagWithRemoveEmbed> createState() => _TagWithRemoveEmbedState();
}

class _TagWithRemoveEmbedState extends State<_TagWithRemoveEmbed> {
  List<String> _values = ['news', 'travel', 'gaming', 'shopping'];
  final Set<String> _selected = {'news'};

  @override
  Widget build(BuildContext context) {
    return RiseTagGroup<String>(
      values: _values,
      labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
      selected: _selected,
      onChanged: (s) => setState(() {
        _selected
          ..clear()
          ..addAll(s);
      }),
      onRemove: (v) => setState(() {
        _values = List<String>.from(_values)..remove(v);
        _selected.remove(v);
      }),
    );
  }
}

class _TagWithErrorEmbed extends StatefulWidget {
  const _TagWithErrorEmbed();

  @override
  State<_TagWithErrorEmbed> createState() => _TagWithErrorEmbedState();
}

class _TagWithErrorEmbedState extends State<_TagWithErrorEmbed> {
  final Set<String> _selected = {'laundry'};

  @override
  Widget build(BuildContext context) {
    final ok = _selected.isNotEmpty;
    return RiseTagGroup<String>(
      label: 'Amenities',
      description: 'Select at least one category',
      errorMessage: ok ? null : 'Please select at least one category',
      values: const ['laundry', 'fitness', 'parking', 'pool', 'breakfast'],
      labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
      selected: _selected,
      onChanged: (s) => setState(() {
        _selected
          ..clear()
          ..addAll(s);
      }),
    );
  }
}
