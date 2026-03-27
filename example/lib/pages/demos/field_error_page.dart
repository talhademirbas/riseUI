import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Field error demos — driven by [riseFieldErrorShowcase] (same as docs + embeds).
class FieldErrorPage extends StatelessWidget {
  const FieldErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['field-error']!;
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
