import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// SearchField demos — driven by [riseSearchFieldShowcase] (same as docs + embeds).
class SearchFieldPage extends StatelessWidget {
  const SearchFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['search-field']!;
    return DemoScaffold(
      title: showcase.title,
      subtitle: showcase.description,
      sections: [
        for (final u in showcase.usages)
          DemoSection(
            title: u.sectionTitle,
            child: u.builder(context),
          ),
      ],
    );
  }
}
