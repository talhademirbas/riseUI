import 'package:flutter/material.dart';

import '../../demo_shell.dart';
import '../../showcase/rise_showcase_registry.dart';

/// Input OTP demos — driven by [riseInputOtpShowcase] (same as docs + embeds).
class InputOtpPage extends StatelessWidget {
  const InputOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showcase = kRiseShowcasesById['input-otp']!;
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
