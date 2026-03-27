import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../../demo_shell.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Dialog',
      sections: [
        DemoSection(
          title: 'showRiseDialog',
          child: RiseButton(
            label: 'Open dialog',
            onPressed: () => showRiseDialog<void>(
              context: context,
              title: const Text('Confirm action'),
              child: const Text('This is the dialog body. You can put forms or long text here.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
