import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Close button demos — driven by [riseCloseButtonShowcase] (same as docs + embeds).
class CloseButtonPage extends StatelessWidget {
  const CloseButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['close-button']!;
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
