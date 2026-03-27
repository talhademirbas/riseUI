import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../../demo_shell.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Menu',
      sections: [
        DemoSection(
          title: 'RiseMenu (MenuAnchor)',
          child: RiseMenu(
            builder: (context, controller, child) {
              return RiseButton(
                label: 'Open menu',
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
              );
            },
            menuChildren: [
              MenuItemButton(
                onPressed: () => RiseToast.show(context, message: 'Copy'),
                child: const Text('Copy'),
              ),
              MenuItemButton(
                onPressed: () => RiseToast.show(context, message: 'Paste'),
                child: const Text('Paste'),
              ),
              MenuItemButton(
                onPressed: () => RiseToast.show(context, message: 'Delete'),
                child: const Text('Delete'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
