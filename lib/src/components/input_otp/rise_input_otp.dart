import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/rise_theme.dart';

/// Same pattern strings as HeroUI `REGEXP_ONLY_*`
/// ([input-otp/index.ts](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/input-otp/index.ts)).
const String kRiseInputOtpRegexpOnlyDigits = r'^\d+$';
const String kRiseInputOtpRegexpOnlyChars = r'^[a-zA-Z]+$';
const String kRiseInputOtpRegexpOnlyDigitsAndChars = r'^[a-zA-Z0-9]+$';

/// Hero [input-otp.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input-otp.css) `.input-otp__slot`:
/// `h-10` × `w-9.5`.
const double kRiseInputOtpSlotHeight = 40;

/// See [kRiseInputOtpSlotHeight].
const double kRiseInputOtpSlotWidth = 38;

/// `gap-2` between slots / groups.
const double kRiseInputOtpGap = 8;

/// `rounded-field` (matches [RiseInput]).
const double kRiseInputOtpRadius = 14;

/// Visual variant aligned with HeroUI `input-otp--primary` / `input-otp--secondary`.
enum RiseInputOtpVariant {
  /// Default: `shadow-field`, `--surface` slot fill.
  primary,

  /// `shadow-none`, `--color-default` slot fill.
  secondary,
}

/// Inset rule between slot groups — `.input-otp__separator`
/// ([input-otp.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input-otp.css)).
class RiseInputOtpSeparator extends StatelessWidget {
  const RiseInputOtpSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Container(
      width: 6,
      height: 2,
      decoration: BoxDecoration(
        color: rise.separator,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

/// OTP / one-time code slots (HeroUI [InputOTP](https://github.com/heroui-inc/heroui/tree/v3/packages/react/src/components/input-otp),
/// [input-otp.css](https://github.com/heroui-inc/heroui/blob/v3/packages/styles/components/input-otp.css)).
///
/// Styling follows `.input-otp__slot`: field border/shadow, hover fill, focus ring, filled state,
/// caret blink, and optional middle [separatorBuilder] (use [RiseInputOtpSeparator] for Hero parity).
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
    this.spacing = kRiseInputOtpGap,
    this.slotWidth = kRiseInputOtpSlotWidth,
    this.slotHeight = kRiseInputOtpSlotHeight,
  });

  final int length;

  final ValueChanged<String>? onCompleted;

  final ValueChanged<String>? onChanged;

  final bool autofocus;

  final bool isDisabled;

  final bool isInvalid;

  final RiseInputOtpVariant variant;

  /// Allowed single character(s) per slot (default: digits).
  final RegExp? pattern;

  /// Placed before slot index `(length / 2).ceil()` — e.g. 6 → `3 | 3`.
  final WidgetBuilder? separatorBuilder;

  final double spacing;

  final double slotWidth;

  final double slotHeight;

  @override
  State<RiseInputOtp> createState() => _RiseInputOtpState();
}

class _RiseInputOtpState extends State<RiseInputOtp> with SingleTickerProviderStateMixin {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _nodes;
  late final List<bool> _hovering;
  late AnimationController _caretBlink;

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _nodes = List.generate(widget.length, (_) => FocusNode());
    _hovering = List<bool>.filled(widget.length, false);
    _caretBlink = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 530),
    );
    for (final c in _controllers) {
      c.addListener(_refresh);
    }
    for (final n in _nodes) {
      n.addListener(_onFocusChanged);
    }
    _syncCaretAnimation();
  }

  void _onFocusChanged() {
    _syncCaretAnimation();
    _refresh();
  }

  void _syncCaretAnimation() {
    final anyFocused = _nodes.any((n) => n.hasFocus);
    if (anyFocused) {
      if (!_caretBlink.isAnimating) {
        _caretBlink.repeat(reverse: true);
      }
    } else {
      _caretBlink
        ..stop()
        ..reset();
    }
  }

  @override
  void dispose() {
    _caretBlink.dispose();
    for (final c in _controllers) {
      c.removeListener(_refresh);
      c.dispose();
    }
    for (final n in _nodes) {
      n.removeListener(_onFocusChanged);
      n.dispose();
    }
    super.dispose();
  }

  void _emitIfDone() {
    final code = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(code);
    if (code.length == widget.length) {
      widget.onCompleted?.call(code);
    }
  }

  Color _slotBaseFill(RiseThemeData rise) {
    return widget.variant == RiseInputOtpVariant.primary ? rise.surface : rise.surfaceSecondary;
  }

  /// `.input-otp__slot` active / filled — `bg-field-focus`.
  Color _slotFocusFill(RiseThemeData rise) {
    if (widget.variant == RiseInputOtpVariant.primary) {
      return Color.lerp(rise.surface, rise.surfaceSecondary, 0.42)!;
    }
    return rise.surfaceSecondary;
  }

  Color _slotFill(RiseThemeData rise, int i) {
    final base = _slotBaseFill(rise);
    if (widget.isDisabled) return base;
    final filled = _controllers[i].text.isNotEmpty;
    final focused = _nodes[i].hasFocus;
    if (_hovering[i] && !focused && !filled) {
      if (widget.variant == RiseInputOtpVariant.primary) {
        return Color.lerp(base, rise.muted, 0.22)!;
      }
      return Color.lerp(base, rise.resolveDefaultHover(), 0.28)!;
    }
    if (focused || filled) {
      if (widget.isInvalid) {
        return _slotFocusFill(rise);
      }
      return _slotFocusFill(rise);
    }
    return base;
  }

  Color _slotBorderColor(RiseThemeData rise, int i) {
    if (widget.isDisabled) {
      return rise.border.withValues(alpha: rise.disabledOpacity);
    }
    if (widget.isInvalid) {
      return rise.danger;
    }
    if (_nodes[i].hasFocus) {
      return rise.accent;
    }
    return rise.border;
  }

  double _slotBorderWidth(int i) {
    if (widget.isDisabled) return 1;
    if (widget.isInvalid) {
      return _nodes[i].hasFocus ? 2 : 1.5;
    }
    if (_nodes[i].hasFocus) return 2;
    return 1;
  }

  List<BoxShadow>? _slotShadows(RiseThemeData rise, bool primaryShell) {
    if (!primaryShell || widget.isDisabled) return null;
    if (Theme.of(context).brightness == Brightness.dark) return null;
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        offset: const Offset(0, 1),
        blurRadius: 2,
      ),
    ];
  }

  TextInputType _keyboardTypeForPattern(RegExp pattern) {
    final p = pattern.pattern;
    if (p.contains(r'[a-zA-Z]') && !p.contains(r'0-9')) {
      return TextInputType.text;
    }
    return TextInputType.number;
  }

  Widget _buildSlot(BuildContext context, int i) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final pattern = widget.pattern ?? RegExp(r'[0-9]');
    final raw = _controllers[i].text;
    final char = raw.isEmpty ? '' : raw.substring(0, 1);
    final focused = _nodes[i].hasFocus;
    final primaryShell = widget.variant == RiseInputOtpVariant.primary;

    final fill = _slotFill(rise, i);
    final borderColor = _slotBorderColor(rise, i);
    final borderWidth = _slotBorderWidth(i);

    final textStyle = theme.textTheme.titleLarge?.copyWith(
          fontSize: 18,
          height: 24 / 18,
          letterSpacing: -0.27,
          fontWeight: FontWeight.w600,
          color: Colors.transparent,
        ) ??
        const TextStyle(
          fontSize: 18,
          height: 24 / 18,
          letterSpacing: -0.27,
          fontWeight: FontWeight.w600,
          color: Colors.transparent,
        );
    final verticalPad = (widget.slotHeight - 24) / 2;

    Widget field = TextField(
      controller: _controllers[i],
      focusNode: _nodes[i],
      autofocus: widget.autofocus && i == 0,
      enabled: !widget.isDisabled,
      textAlign: TextAlign.center,
      keyboardType: _keyboardTypeForPattern(pattern),
      maxLength: 1,
      showCursor: false,
      style: textStyle,
      inputFormatters: [FilteringTextInputFormatter.allow(pattern)],
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: verticalPad.clamp(0, 20)),
        counterText: '',
        isCollapsed: true,
      ),
      onChanged: (v) {
        if (widget.isDisabled) return;
        if (v.length > 1) {
          final last = v.substring(v.length - 1);
          _controllers[i].text = last;
          _controllers[i].selection = const TextSelection.collapsed(offset: 1);
        }
        if (v.isNotEmpty && i < widget.length - 1) {
          _nodes[i + 1].requestFocus();
        }
        if (v.isEmpty && i > 0) {
          _nodes[i - 1].requestFocus();
        }
        _emitIfDone();
      },
    );

    final digit = AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, anim) {
        return FadeTransition(
          opacity: anim,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.2),
              end: Offset.zero,
            ).animate(anim),
            child: child,
          ),
        );
      },
      child: char.isEmpty
          ? const SizedBox(key: ValueKey<String>('empty'), width: 1, height: 1)
          : Text(
              char,
              key: ValueKey<String>(char),
              style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    height: 24 / 18,
                    letterSpacing: -0.27,
                    fontWeight: FontWeight.w600,
                    color: rise.defaultForeground,
                  ) ??
                  TextStyle(
                    fontSize: 18,
                    height: 24 / 18,
                    letterSpacing: -0.27,
                    fontWeight: FontWeight.w600,
                    color: rise.defaultForeground,
                  ),
            ),
    );

    final caret = FadeTransition(
      opacity: _caretBlink,
      child: Container(
        width: 2,
        height: 16,
        decoration: BoxDecoration(
          color: rise.mutedForeground(0.65),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );

    final inner = ClipRRect(
      borderRadius: BorderRadius.circular(kRiseInputOtpRadius),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(width: widget.slotWidth, height: widget.slotHeight, child: field),
          IgnorePointer(child: digit),
          if (focused && !widget.isDisabled && char.isEmpty)
            IgnorePointer(
              child: caret,
            ),
        ],
      ),
    );

    Widget shell = Material(
      color: fill,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRiseInputOtpRadius),
        side: BorderSide(color: borderColor, width: borderWidth),
      ),
      child: inner,
    );

    if (primaryShell) {
      shell = DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRiseInputOtpRadius),
          boxShadow: _slotShadows(rise, true),
        ),
        child: shell,
      );
    }

    return MouseRegion(
      onEnter: (_) {
        if (widget.isDisabled) return;
        setState(() => _hovering[i] = true);
      },
      onExit: (_) => setState(() => _hovering[i] = false),
      child: SizedBox(
        width: widget.slotWidth,
        height: widget.slotHeight,
        child: shell,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < widget.length; i++) ...[
          if (i > 0) SizedBox(width: widget.spacing),
          if (widget.separatorBuilder != null && i == (widget.length / 2).ceil())
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.spacing),
              child: widget.separatorBuilder!(context),
            ),
          _buildSlot(context, i),
        ],
      ],
    );

    return Semantics(
      label: 'One-time code entry',
      child: Opacity(
        opacity: widget.isDisabled ? 0.5 : 1,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: row,
        ),
      ),
    );
  }
}
