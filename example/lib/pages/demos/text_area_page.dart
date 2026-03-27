import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// TextArea demos — driven by [riseTextAreaShowcase] (same as docs + embeds).
class TextAreaPage extends StatelessWidget {
  const TextAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['text-area']!;
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
