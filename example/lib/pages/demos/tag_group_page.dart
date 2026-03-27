import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Tag group demos — driven by [riseTagGroupShowcase] (same as docs + embeds).
class TagGroupPage extends StatelessWidget {
  const TagGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['tag-group']!;
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
