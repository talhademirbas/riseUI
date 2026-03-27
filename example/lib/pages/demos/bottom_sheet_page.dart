import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../../demo_shell.dart';

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Bottom sheet',
      sections: [
        DemoSection(
          title: 'showRiseModalBottomSheet',
          child: RiseButton(
            variant: RiseButtonVariant.secondary,
            label: 'Open sheet',
            onPressed: () => showRiseModalBottomSheet<void>(
              context: context,
              title: const Text('Options'),
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: const Text('Option A'),
                      onTap: () {
                        Navigator.pop(context);
                        RiseToast.show(context, message: 'A');
                      },
                    ),
                    ListTile(
                      title: const Text('Option B'),
                      onTap: () {
                        Navigator.pop(context);
                        RiseToast.show(context, message: 'B');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
