import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Separator demos — driven by [riseSeparatorShowcase] (same as docs + embeds).
class SeparatorPage extends StatelessWidget {
  const SeparatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['separator']!;
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
