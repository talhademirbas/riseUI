import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../../demo_shell.dart';

class ListGroupPage extends StatelessWidget {
  const ListGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'List group',
      sections: [
        DemoSection(
          title: 'Tappable rows',
          child: RiseListGroup(
            padding: const EdgeInsets.symmetric(vertical: 4),
            children: [
              ListTile(
                title: const Text('Profile'),
                leading: const Icon(Icons.person_outline),
                onTap: () => RiseToast.show(context, message: 'Profile'),
              ),
              ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings_outlined),
                onTap: () => RiseToast.show(context, message: 'Settings'),
              ),
              ListTile(
                title: const Text('Sign out'),
                leading: const Icon(Icons.logout),
                onTap: () => RiseToast.show(context, message: 'Sign out'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
