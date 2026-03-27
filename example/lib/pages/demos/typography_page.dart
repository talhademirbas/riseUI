import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../../demo_shell.dart';

/// Label, description, and field error on one screen (related primitives).
class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Label & description',
      subtitle: 'Also includes field error styling.',
      sections: [
        DemoSection(
          title: 'RiseLabel',
          child: RiseLabel.text('Section title'),
        ),
        DemoSection(
          title: 'RiseDescription',
          child: const RiseDescription(
            child: Text('Helper text that explains the field without competing with the label.'),
          ),
        ),
        DemoSection(
          title: 'RiseFieldError',
          child: const RiseFieldError(
            child: Text('Please enter a valid email address.'),
          ),
        ),
        DemoSection(
          title: 'Stacked (typical form)',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RiseLabel.text('Password'),
              const SizedBox(height: 4),
              const RiseDescription(child: Text('At least 8 characters.')),
              const SizedBox(height: 8),
              const TextField(decoration: InputDecoration(border: OutlineInputBorder())),
              const SizedBox(height: 6),
              const RiseFieldError(child: Text('Too short.')),
            ],
          ),
        ),
      ],
    );
  }
}
