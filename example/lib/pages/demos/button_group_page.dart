import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// ButtonGroup demos — driven by [riseButtonGroupShowcase] (same as docs + embeds).
class ButtonGroupPage extends StatelessWidget {
  const ButtonGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['button-group']!;
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
