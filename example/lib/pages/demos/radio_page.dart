import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../../demo_shell.dart';

/// Radio primitive demos (separate from RadioGroup showcase page).
class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  String _value = 'flutter';

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Radio',
      subtitle: 'Primitive control examples.',
      sections: [
        DemoSection(
          title: 'Usage',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RiseRadioGroup<String>(
                    value: _value,
                    onChanged: (v) => setState(() => _value = v ?? _value),
                    child: RiseRadio<String>(value: 'flutter'),
                  ),
                  const Text(' Flutter'),
                ],
              ),
              Row(
                children: [
                  RiseRadioGroup<String>(
                    value: _value,
                    onChanged: (v) => setState(() => _value = v ?? _value),
                    child: RiseRadio<String>(value: 'other'),
                  ),
                  const Text(' Other'),
                ],
              ),
            ],
          ),
        ),
        DemoSection(
          title: 'Disabled',
          child: Row(
            children: const [
              RiseRadioGroup<String>(
                value: 'flutter',
                onChanged: _noopRadioChange,
                isDisabled: true,
                child: RiseRadio<String>(value: 'flutter', isDisabled: true),
              ),
              Text(' Disabled radio'),
            ],
          ),
        ),
        DemoSection(
          title: 'Current value',
          child: Text('Value: $_value'),
        ),
      ],
    );
  }
}

void _noopRadioChange(String? _) {}
