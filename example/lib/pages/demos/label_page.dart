import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Label demos — driven by [riseLabelShowcase] (same as docs + embeds).
class LabelPage extends StatelessWidget {
  const LabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['label']!;
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
