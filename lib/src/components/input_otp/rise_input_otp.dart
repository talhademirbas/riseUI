import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/rise_theme.dart';

/// Visual variant aligned with HeroUI InputOTP (`primary` / `secondary`).
enum RiseInputOtpVariant {
  primary,
  secondary,
}

/// Single-character fields for codes / OTP (HeroUI [InputOTP](https://heroui.com/docs/native/components/input-otp)).
class RiseInputOtp extends StatefulWidget {
  const RiseInputOtp({
    super.key,
    required this.length,
    this.onCompleted,
    this.onChanged,
    this.autofocus = true,
    this.isDisabled = false,
    this.isInvalid = false,
    this.variant = RiseInputOtpVariant.primary,
    this.pattern,
    this.separatorBuilder,
    this.spacing = 8,
    this.fieldSize = 44,
  });

  final int length;

  final ValueChanged<String>? onCompleted;

  final ValueChanged<String>? onChanged;

  final bool autofocus;

  final bool isDisabled;

  final bool isInvalid;

  final RiseInputOtpVariant variant;

  /// Character whitelist pattern for each slot (defaults to digits only).
  final RegExp? pattern;

  /// Optional separator widget between slot groups.
  final WidgetBuilder? separatorBuilder;

  final double spacing;

  final double fieldSize;

  @override
  State<RiseInputOtp> createState() => _RiseInputOtpState();
}

class _RiseInputOtpState extends State<RiseInputOtp> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _nodes;

  void _refreshVisualState() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _nodes = List.generate(widget.length, (_) => FocusNode());
    for (final c in _controllers) {
      c.addListener(_refreshVisualState);
    }
    for (final n in _nodes) {
      n.addListener(_refreshVisualState);
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.removeListener(_refreshVisualState);
      c.dispose();
    }
    for (final n in _nodes) {
      n.removeListener(_refreshVisualState);
      n.dispose();
    }
    super.dispose();
  }

  void _submitIfDone() {
    final code = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(code);
    if (code.length == widget.length) {
      widget.onCompleted?.call(code);
    }
  }

  InputDecoration _fieldDecoration(BuildContext context, {required bool isActive, required bool isFilled}) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final bg = widget.variant == RiseInputOtpVariant.primary
        ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35)
        : rise.muted;
    final effectiveBorder = widget.isInvalid ? rise.danger : rise.border;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: effectiveBorder),
    );
    return InputDecoration(
      isDense: true,
      counterText: '',
      filled: true,
      fillColor: (isActive || isFilled) ? bg.withValues(alpha: 0.9) : bg,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: widget.isInvalid ? rise.danger : rise.accent, width: 2),
      ),
      disabledBorder: border.copyWith(
        borderSide: BorderSide(color: rise.border.withValues(alpha: 0.45)),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);

    final pattern = widget.pattern ?? RegExp(r'[0-9]');
    return Semantics(
      label: 'One-time code entry',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < widget.length; i++) ...[
            if (i > 0) SizedBox(width: widget.spacing),
            if (widget.separatorBuilder != null && i == (widget.length / 2).ceil())
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.spacing),
                child: widget.separatorBuilder!(context),
              ),
            SizedBox(
              width: widget.fieldSize,
              height: widget.fieldSize,
              child: TextField(
                controller: _controllers[i],
                focusNode: _nodes[i],
                autofocus: widget.autofocus && i == 0,
                enabled: !widget.isDisabled,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: rise.defaultForeground,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(pattern),
                ],
                decoration: _fieldDecoration(
                  context,
                  isActive: _nodes[i].hasFocus,
                  isFilled: _controllers[i].text.isNotEmpty,
                ),
                onChanged: (v) {
                  if (widget.isDisabled) return;
                  if (v.isNotEmpty && i < widget.length - 1) {
                    _nodes[i + 1].requestFocus();
                  }
                  if (v.isEmpty && i > 0) {
                    _nodes[i - 1].requestFocus();
                  }
                  _submitIfDone();
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
