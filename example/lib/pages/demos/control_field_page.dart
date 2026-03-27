import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../../demo_shell.dart';

class ControlFieldPage extends StatelessWidget {
  const ControlFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Control field',
      sections: [
        DemoSection(
          title: 'RiseControlFieldText',
          child: RiseControlFieldText(
            label: 'Email',
            description: 'We never share your email.',
            error: 'Invalid format',
            control: RiseTextField(
              labelText: 'Email',
              hintText: 'you@example.com',
            ),
          ),
        ),
        DemoSection(
          title: 'Without error',
          child: RiseControlFieldText(
            label: 'Display name',
            description: 'Visible to other users.',
            control: const RiseTextField(),
          ),
        ),
      ],
    );
  }
}
