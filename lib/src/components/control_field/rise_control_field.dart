import 'package:flutter/material.dart';

import '../description/rise_description.dart';
import '../field_error/rise_field_error.dart';
import '../label/rise_label.dart';

/// Label + optional description + control + optional error (HeroUI [ControlField](https://heroui.com/docs/native/components/control-field)).
class RiseControlField extends StatelessWidget {
  const RiseControlField({
    super.key,
    this.label,
    this.description,
    this.error,
    required this.control,
    this.gapAfterHeader = 8,
    this.gapLabelToDescription = 4,
  });

  final Widget? label;

  final Widget? description;

  final Widget? error;

  final Widget control;

  /// Space between the last header line (label and/or description) and [control].
  final double gapAfterHeader;

  final double gapLabelToDescription;

  @override
  Widget build(BuildContext context) {
    final hasHeader = label != null || description != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ignore: use_null_aware_elements — explicit label slot for Column children
        if (label case final l?) l,
        if (description case final d?) ...[
          SizedBox(height: label != null ? gapLabelToDescription : 0),
          RiseDescription(child: d),
        ],
        if (hasHeader) SizedBox(height: gapAfterHeader),
        control,
        if (error case final e?) ...[
          const SizedBox(height: 6),
          RiseFieldError(child: e),
        ],
      ],
    );
  }
}

/// Variant with plain [String] label / description / error.
class RiseControlFieldText extends StatelessWidget {
  const RiseControlFieldText({
    super.key,
    this.label,
    this.description,
    this.error,
    required this.control,
  });

  final String? label;

  final String? description;

  final String? error;

  final Widget control;

  @override
  Widget build(BuildContext context) {
    return RiseControlField(
      label: label != null ? RiseLabel.text(label!) : null,
      description: description != null ? Text(description!) : null,
      error: error != null ? Text(error!) : null,
      control: control,
    );
  }
}
