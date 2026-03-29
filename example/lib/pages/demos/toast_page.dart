import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Toast demos — driven by [riseToastShowcase] (same as docs + embeds).
class ToastPage extends StatelessWidget {
  const ToastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['toast']!;
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
