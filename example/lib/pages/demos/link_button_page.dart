import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../../demo_shell.dart';

class LinkButtonPage extends StatelessWidget {
  const LinkButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Link button',
      sections: [
        DemoSection(
          title: 'Inline link',
          child: RiseLinkButton(
            label: 'Open link action',
            onPressed: () => RiseToast.show(context, message: 'Link tapped'),
          ),
        ),
      ],
    );
  }
}
