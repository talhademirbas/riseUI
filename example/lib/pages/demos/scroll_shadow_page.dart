import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Scroll shadow demos — driven by [riseScrollShadowShowcase] (same as docs + embeds).
class ScrollShadowPage extends StatelessWidget {
  const ScrollShadowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['scroll-shadow']!;
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
