import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Input group demos — driven by [riseInputGroupShowcase] (same as docs + embeds).
class InputGroupPage extends StatelessWidget {
  const InputGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['input-group']!;
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
