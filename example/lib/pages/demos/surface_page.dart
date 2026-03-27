import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Surface demos — driven by [riseSurfaceShowcase] (same as docs + embeds).
class SurfacePage extends StatelessWidget {
  const SurfacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['surface']!;
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
