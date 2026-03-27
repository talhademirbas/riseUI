import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Slider demos — driven by [riseSliderShowcase] (same as docs + embeds).
class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['slider']!;
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
