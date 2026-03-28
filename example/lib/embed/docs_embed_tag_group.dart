import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Tag group demos for docs iframe (`?embed=tag-group-*`).
///
/// Parity targets: HeroUI v3
/// [tag-group.stories.tsx](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/tag-group/tag-group.stories.tsx)
/// and [tag-group.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/tag-group.css).
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

  static Widget controlled(BuildContext context) {
    return _wrap(const _TagControlledEmbed());
  }

  static Widget withIcons(BuildContext context) {
    return _wrap(const _TagWithPrefixEmbed());
  }

  static Widget withRemove(BuildContext context) {
    return _wrap(const _TagWithRemoveEmbed());
  }

  static Widget withError(BuildContext context) {
    return _wrap(const _TagWithErrorEmbed());
  }

  static Widget withListData(BuildContext context) {
    return _wrap(const _TagWithListDataEmbed());
  }
}

IconData _defaultStoryIcon(String v) {
  return switch (v) {
    'news' => Icons.article_outlined,
    'travel' => Icons.public_outlined,
    'gaming' => Icons.rocket_launch_outlined,
    'shopping' => Icons.shopping_bag_outlined,
    _ => Icons.label_outline,
  };
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
      selectionMode: RiseTagGroupSelectionMode.single,
      values: const ['news', 'travel', 'gaming', 'shopping'],
      labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
      leadingBuilder: (v) => Icon(_defaultStoryIcon(v), size: 16),
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
            RiseLabel.text(title, style: muted),
            const SizedBox(height: 8),
            RiseTagGroup<String>(
              selectionMode: RiseTagGroupSelectionMode.single,
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
        RiseLabel.text('Default', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          selectionMode: RiseTagGroupSelectionMode.single,
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
        RiseLabel.text('Surface', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          selectionMode: RiseTagGroupSelectionMode.single,
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
  final Set<String> _perTagDisabled = {'travel'};
  final Set<String> _disabledKeysOnly = {'news'};

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text('Disabled Tags', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          disabledKeys: const {'news', 'gaming'},
          values: const ['news', 'travel', 'gaming'],
          labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
          selected: _perTagDisabled,
          description: 'Some tags are disabled',
          onChanged: (s) => setState(() {
            _perTagDisabled
              ..clear()
              ..addAll(s);
          }),
        ),
        const SizedBox(height: 16),
        RiseLabel.text('Disabled Keys', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          disabledKeys: const {'travel'},
          values: const ['news', 'travel', 'gaming'],
          labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
          selected: _disabledKeysOnly,
          description: 'Tags disabled via disabledKeys prop',
          onChanged: (s) => setState(() {
            _disabledKeysOnly
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
    final hint = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.8),
        );
    Widget block(
      String title,
      RiseTagGroupSelectionMode mode,
      Set<String> sel,
      ValueChanged<Set<String>> onChanged,
      String helper,
    ) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RiseLabel.text(title, style: muted),
            const SizedBox(height: 8),
            RiseTagGroup<String>(
              selectionMode: mode,
              values: const ['news', 'travel', 'gaming', 'shopping'],
              labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
              selected: sel,
              onChanged: onChanged,
            ),
            const SizedBox(height: 6),
            Text(helper, style: hint),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        block(
          'Single Selection',
          RiseTagGroupSelectionMode.single,
          _single,
          (s) => setState(() {
            _single
              ..clear()
              ..addAll(s);
          }),
          'Choose one category',
        ),
        block(
          'Multiple Selection',
          RiseTagGroupSelectionMode.multiple,
          _multi,
          (s) => setState(() {
            _multi
              ..clear()
              ..addAll(s);
          }),
          'Choose multiple categories',
        ),
      ],
    );
  }
}

class _TagControlledEmbed extends StatefulWidget {
  const _TagControlledEmbed();

  @override
  State<_TagControlledEmbed> createState() => _TagControlledEmbedState();
}

class _TagControlledEmbedState extends State<_TagControlledEmbed> {
  final Set<String> _selected = {'news', 'travel'};

  @override
  Widget build(BuildContext context) {
    final summary = _selected.isEmpty
        ? 'None'
        : _selected.map((k) => k[0].toUpperCase() + k.substring(1)).join(', ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseTagGroup<String>(
          selectionMode: RiseTagGroupSelectionMode.multiple,
          label: 'Categories (controlled)',
          values: const ['news', 'travel', 'gaming', 'shopping'],
          labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
          selected: _selected,
          onChanged: (s) => setState(() {
            _selected
              ..clear()
              ..addAll(s);
          }),
        ),
        const SizedBox(height: 8),
        Text(
          'Selected: $summary',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: context.riseTheme.mutedForeground(0.9),
              ),
        ),
      ],
    );
  }
}

class _TagWithPrefixEmbed extends StatefulWidget {
  const _TagWithPrefixEmbed();

  @override
  State<_TagWithPrefixEmbed> createState() => _TagWithPrefixEmbedState();
}

class _TagWithPrefixEmbedState extends State<_TagWithPrefixEmbed> {
  final Set<String> _icons = {'news'};
  final Set<String> _people = {'fred'};

  static const _avatarUrls = <String, String>{
    'fred': 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg',
    'michael': 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg',
    'jane': 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg',
  };

  static const _names = <String, String>{
    'fred': 'Fred',
    'michael': 'Michael',
    'jane': 'Jane',
  };

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text('With Icons', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          selectionMode: RiseTagGroupSelectionMode.single,
          values: const ['news', 'travel', 'gaming', 'shopping'],
          labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
          leadingBuilder: (v) => Icon(_defaultStoryIcon(v), size: 16),
          selected: _icons,
          description: 'Tags with icons',
          onChanged: (s) => setState(() {
            _icons
              ..clear()
              ..addAll(s);
          }),
        ),
        const SizedBox(height: 24),
        RiseLabel.text('With Avatars', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          selectionMode: RiseTagGroupSelectionMode.single,
          values: const ['fred', 'michael', 'jane'],
          labelBuilder: (v) => _names[v]!,
          leadingBuilder: (v) => RiseAvatar(
            size: RiseAvatarSize.sm,
            image: NetworkImage(_avatarUrls[v]!),
            name: _names[v]!,
          ),
          selected: _people,
          description: 'Tags with avatars',
          onChanged: (s) => setState(() {
            _people
              ..clear()
              ..addAll(s);
          }),
        ),
      ],
    );
  }
}

class _TagWithRemoveEmbed extends StatefulWidget {
  const _TagWithRemoveEmbed();

  @override
  State<_TagWithRemoveEmbed> createState() => _TagWithRemoveEmbedState();
}

class _TagWithRemoveEmbedState extends State<_TagWithRemoveEmbed> {
  List<String> _categories = ['news', 'travel', 'gaming', 'shopping'];
  List<String> _frameworks = ['react', 'vue', 'angular', 'svelte'];
  final Set<String> _catSel = {'news'};
  final Set<String> _fwSel = {'react'};

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: context.riseTheme.mutedForeground(0.75),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RiseLabel.text('Default remove button', style: muted),
        const SizedBox(height: 8),
        if (_categories.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                'No categories found',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.riseTheme.mutedForeground(0.75),
                    ),
              ),
            ),
          )
        else
          RiseTagGroup<String>(
            values: _categories,
            labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
            selected: _catSel,
            onChanged: (s) => setState(() {
              _catSel
                ..clear()
                ..addAll(s);
            }),
            onRemove: (v) => setState(() {
              _categories = List<String>.from(_categories)..remove(v);
              _catSel.remove(v);
            }),
          ),
        const SizedBox(height: 6),
        Text(
          'Click the X to remove tags',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: context.riseTheme.mutedForeground(0.8),
              ),
        ),
        const SizedBox(height: 24),
        RiseLabel.text('Frameworks (removable list)', style: muted),
        const SizedBox(height: 8),
        RiseTagGroup<String>(
          values: _frameworks,
          labelBuilder: (v) => v[0].toUpperCase() + v.substring(1),
          selected: _fwSel,
          onChanged: (s) => setState(() {
            _fwSel
              ..clear()
              ..addAll(s);
          }),
          onRemove: (v) => setState(() {
            _frameworks = List<String>.from(_frameworks)..remove(v);
            _fwSel.remove(v);
          }),
        ),
      ],
    );
  }
}

class _TagWithErrorEmbed extends StatefulWidget {
  const _TagWithErrorEmbed();

  @override
  State<_TagWithErrorEmbed> createState() => _TagWithErrorEmbedState();
}

class _TagWithErrorEmbedState extends State<_TagWithErrorEmbed> {
  final Set<String> _selected = {};

  @override
  Widget build(BuildContext context) {
    final invalid = _selected.isEmpty;
    final labels = _selected.map((v) => v[0].toUpperCase() + v.substring(1)).toList()..sort();
    final desc = invalid
        ? 'Select at least one category'
        : 'Selected: ${labels.join(', ')}';
    return RiseTagGroup<String>(
      label: 'Amenities',
      description: desc,
      errorMessage: invalid ? 'Please select at least one category' : null,
      values: const ['laundry', 'fitness', 'parking', 'pool', 'breakfast'],
      labelBuilder: (v) => v == 'fitness' ? 'Fitness center' : v[0].toUpperCase() + v.substring(1),
      selected: _selected,
      onChanged: (s) => setState(() {
        _selected
          ..clear()
          ..addAll(s);
      }),
    );
  }
}

class _TeamUser {
  const _TeamUser({
    required this.id,
    required this.name,
    required this.avatarUrl,
  });

  final String id;
  final String name;
  final String avatarUrl;
}

class _TagWithListDataEmbed extends StatefulWidget {
  const _TagWithListDataEmbed();

  @override
  State<_TagWithListDataEmbed> createState() => _TagWithListDataEmbedState();
}

class _TagWithListDataEmbedState extends State<_TagWithListDataEmbed> {
  static final List<_TeamUser> _initial = [
    const _TeamUser(
      id: 'fred',
      name: 'Fred',
      avatarUrl: 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/blue.jpg',
    ),
    const _TeamUser(
      id: 'michael',
      name: 'Michael',
      avatarUrl: 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/green.jpg',
    ),
    const _TeamUser(
      id: 'jane',
      name: 'Jane',
      avatarUrl: 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/purple.jpg',
    ),
    const _TeamUser(
      id: 'alice',
      name: 'Alice',
      avatarUrl: 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/red.jpg',
    ),
    const _TeamUser(
      id: 'bob',
      name: 'Bob',
      avatarUrl: 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/orange.jpg',
    ),
    const _TeamUser(
      id: 'charlie',
      name: 'Charlie',
      avatarUrl: 'https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/black.jpg',
    ),
  ];

  late List<_TeamUser> _users = List<_TeamUser>.from(_initial);
  final Set<String> _selected = {'fred', 'michael'};

  _TeamUser? _user(String id) {
    for (final u in _users) {
      if (u.id == id) return u;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final hint = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: rise.mutedForeground(0.85),
        );
    final ids = _users.map((u) => u.id).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_users.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                'No team members',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: rise.mutedForeground(0.75),
                    ),
              ),
            ),
          )
        else
          RiseTagGroup<String>(
            label: 'Team Members',
            selectionMode: RiseTagGroupSelectionMode.multiple,
            values: ids,
            labelBuilder: (id) => _user(id)?.name ?? id,
            leadingBuilder: (id) {
              final u = _user(id);
              if (u == null) return const SizedBox.shrink();
              return RiseAvatar(
                size: RiseAvatarSize.sm,
                image: NetworkImage(u.avatarUrl),
                name: u.name,
              );
            },
            selected: _selected,
            description: 'Select team members for your project',
            onChanged: (s) => setState(() {
              _selected
                ..clear()
                ..addAll(s);
            }),
            onRemove: (id) => setState(() {
              _users = List<_TeamUser>.from(_users)..removeWhere((u) => u.id == id);
              _selected.remove(id);
            }),
          ),
        if (_selected.isNotEmpty && _users.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            'Selected:',
            style: hint?.copyWith(fontWeight: FontWeight.w600) ??
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: rise.mutedForeground(0.85),
                ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: _selected.map((id) {
              final u = _user(id);
              if (u == null) return const SizedBox.shrink();
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RiseAvatar(
                    size: RiseAvatarSize.sm,
                    image: NetworkImage(u.avatarUrl),
                    name: u.name,
                  ),
                  const SizedBox(width: 6),
                  Text(u.name, style: Theme.of(context).textTheme.labelLarge),
                ],
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
