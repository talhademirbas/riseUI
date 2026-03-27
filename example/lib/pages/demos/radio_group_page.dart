import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// RadioGroup demos — driven by showcase (same as docs + embeds).
class RadioGroupPage extends StatelessWidget {
  const RadioGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['radio']!;
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
