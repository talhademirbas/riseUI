import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../../demo_shell.dart';

class ToastPage extends StatelessWidget {
  const ToastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Toast',
      sections: [
        DemoSection(
          title: 'Variants',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              RiseButton(
                label: 'Default',
                onPressed: () => RiseToast.show(context, message: 'Default toast'),
              ),
              RiseButton(
                variant: RiseButtonVariant.secondary,
                label: 'Accent',
                onPressed: () => RiseToast.show(
                  context,
                  message: 'Accent',
                  variant: RiseToastVariant.accent,
                ),
              ),
              RiseButton(
                variant: RiseButtonVariant.tertiary,
                label: 'Success',
                onPressed: () => RiseToast.show(
                  context,
                  message: 'Saved',
                  variant: RiseToastVariant.success,
                ),
              ),
              RiseButton(
                variant: RiseButtonVariant.outline,
                label: 'Warning',
                onPressed: () => RiseToast.show(
                  context,
                  message: 'Check this',
                  variant: RiseToastVariant.warning,
                ),
              ),
              RiseButton(
                variant: RiseButtonVariant.danger,
                label: 'Danger',
                onPressed: () => RiseToast.show(
                  context,
                  message: 'Failed',
                  variant: RiseToastVariant.danger,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
