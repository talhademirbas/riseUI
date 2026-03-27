import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Select demos — driven by [riseSelectShowcase] (same as docs + embeds).
class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['select']!;
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
