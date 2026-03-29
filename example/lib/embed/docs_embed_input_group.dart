import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedInputGroup {
  DocsEmbedInputGroup._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _InputGroupUsageEmbed());
  static Widget textPrefix(BuildContext context) => _wrap(const _InputGroupTextPrefixEmbed());
  static Widget textSuffix(BuildContext context) => _wrap(const _InputGroupTextSuffixEmbed());
  static Widget iconPrefixTextSuffix(BuildContext context) =>
      _wrap(const _InputGroupIconPrefixTextSuffixEmbed());
  static Widget copySuffix(BuildContext context) => _wrap(const _InputGroupCopySuffixEmbed());
  static Widget iconPrefixCopySuffix(BuildContext context) =>
      _wrap(const _InputGroupIconPrefixCopySuffixEmbed());
  static Widget loading(BuildContext context) => _wrap(const _InputGroupLoadingEmbed());
  static Widget keyboardShortcut(BuildContext context) =>
      _wrap(const _InputGroupKeyboardShortcutEmbed());
  static Widget badgeSuffix(BuildContext context) => _wrap(const _InputGroupBadgeSuffixEmbed());
  static Widget requiredField(BuildContext context) => _wrap(const _InputGroupRequiredFieldEmbed());
  static Widget validation(BuildContext context) => _wrap(const _InputGroupValidationEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _InputGroupDisabledEmbed());
  static Widget withSuffix(BuildContext context) => _wrap(const _InputGroupWithSuffixEmbed());
  static Widget prefixAndSuffix(BuildContext context) =>
      _wrap(const _InputGroupPrefixSuffixEmbed());
  static Widget passwordToggle(BuildContext context) =>
      _wrap(const _InputGroupPasswordToggleEmbed());
  static Widget variants(BuildContext context) => _wrap(const _InputGroupVariantsEmbed());
  static Widget fullWidth(BuildContext context) => _wrap(const _InputGroupFullWidthEmbed());
  static Widget invalid(BuildContext context) => _wrap(const _InputGroupInvalidEmbed());
}

class _InputGroupUsageEmbed extends StatelessWidget {
  const _InputGroupUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      prefix: Icon(Icons.email_outlined, color: context.riseTheme.mutedForeground(0.7)),
      children: const [
        RiseInput(placeholder: 'name@email.com'),
      ],
    );
  }
}

/// Plain [Text] prefix (e.g. `https://`).
class _InputGroupTextPrefixEmbed extends StatelessWidget {
  const _InputGroupTextPrefixEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseInputGroup(
      prefix: Text('https://'),
      children: [
        RiseInput(placeholder: 'example.com'),
      ],
    );
  }
}

/// Plain [Text] suffix (e.g. TLD).
class _InputGroupTextSuffixEmbed extends StatelessWidget {
  const _InputGroupTextSuffixEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseInputGroup(
      suffix: Text('.com'),
      children: [
        RiseInput(placeholder: 'subdomain'),
      ],
    );
  }
}

/// Icon prefix + text suffix.
class _InputGroupIconPrefixTextSuffixEmbed extends StatelessWidget {
  const _InputGroupIconPrefixTextSuffixEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      prefix: Icon(Icons.currency_exchange, color: context.riseTheme.mutedForeground(0.7)),
      suffix: const Text('USD'),
      children: const [
        RiseInput(placeholder: '0.00', keyboardType: TextInputType.number),
      ],
    );
  }
}

class _InputGroupCopySuffixEmbed extends StatefulWidget {
  const _InputGroupCopySuffixEmbed();

  @override
  State<_InputGroupCopySuffixEmbed> createState() => _InputGroupCopySuffixEmbedState();
}

class _InputGroupCopySuffixEmbedState extends State<_InputGroupCopySuffixEmbed> {
  final _controller = TextEditingController(text: 'riseui.dev');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      suffix: IconButton(
        tooltip: 'Copy',
        icon: const Icon(Icons.copy_outlined),
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: _controller.text));
        },
      ),
      children: [
        RiseInput(controller: _controller, onChanged: (_) => setState(() {})),
      ],
    );
  }
}

class _InputGroupIconPrefixCopySuffixEmbed extends StatefulWidget {
  const _InputGroupIconPrefixCopySuffixEmbed();

  @override
  State<_InputGroupIconPrefixCopySuffixEmbed> createState() =>
      _InputGroupIconPrefixCopySuffixEmbedState();
}

class _InputGroupIconPrefixCopySuffixEmbedState extends State<_InputGroupIconPrefixCopySuffixEmbed> {
  final _controller = TextEditingController(text: 'riseui.dev');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      prefix: Icon(Icons.language_outlined, color: context.riseTheme.mutedForeground(0.7)),
      suffix: IconButton(
        tooltip: 'Copy',
        icon: const Icon(Icons.copy_outlined),
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: _controller.text));
        },
      ),
      children: [
        RiseInput(controller: _controller, onChanged: (_) => setState(() {})),
      ],
    );
  }
}

class _InputGroupLoadingEmbed extends StatefulWidget {
  const _InputGroupLoadingEmbed();

  @override
  State<_InputGroupLoadingEmbed> createState() => _InputGroupLoadingEmbedState();
}

class _InputGroupLoadingEmbedState extends State<_InputGroupLoadingEmbed> {
  var _busy = false;

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      suffix: _busy
          ? const Padding(
              padding: EdgeInsets.only(right: 8),
              child: RiseSpinner(size: RiseSpinnerSize.sm, color: RiseSpinnerColor.accent),
            )
          : IconButton(
              tooltip: 'Refresh',
              icon: const Icon(Icons.refresh_outlined),
              onPressed: () {
                setState(() => _busy = true);
                Future<void>.delayed(const Duration(seconds: 2), () {
                  if (mounted) setState(() => _busy = false);
                });
              },
            ),
      children: const [
        RiseInput(placeholder: 'Search…'),
      ],
    );
  }
}

class _InputGroupKeyboardShortcutEmbed extends StatelessWidget {
  const _InputGroupKeyboardShortcutEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    return RiseInputGroup(
      suffix: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: rise.surfaceSecondary,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: rise.border),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              '⌘K',
              style: theme.textTheme.labelSmall?.copyWith(
                    color: rise.mutedForeground(0.85),
                    fontWeight: FontWeight.w600,
                  ) ??
                  TextStyle(
                    fontSize: 12,
                    color: rise.mutedForeground(0.85),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ),
      children: const [
        RiseInput(placeholder: 'Quick command…'),
      ],
    );
  }
}

class _InputGroupBadgeSuffixEmbed extends StatelessWidget {
  const _InputGroupBadgeSuffixEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      prefix: Icon(Icons.code_outlined, color: context.riseTheme.mutedForeground(0.7)),
      suffix: const Padding(
        padding: EdgeInsets.only(right: 8),
        child: RiseChip(
          size: RiseChipSize.sm,
          child: Text('Beta'),
        ),
      ),
      children: const [
        RiseInput(placeholder: 'feature/api-v2'),
      ],
    );
  }
}

class _InputGroupRequiredFieldEmbed extends StatelessWidget {
  const _InputGroupRequiredFieldEmbed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RiseLabel.text('Project name', isRequired: true),
        const SizedBox(height: 6),
        RiseInputGroup(
          prefix: Icon(Icons.folder_outlined, color: context.riseTheme.mutedForeground(0.7)),
          children: const [
            RiseInput(placeholder: 'my-app'),
          ],
        ),
      ],
    );
  }
}

class _InputGroupValidationEmbed extends StatefulWidget {
  const _InputGroupValidationEmbed();

  @override
  State<_InputGroupValidationEmbed> createState() => _InputGroupValidationEmbedState();
}

class _InputGroupValidationEmbedState extends State<_InputGroupValidationEmbed> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = _controller.text;
    final invalid = value.isNotEmpty && value.length < 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RiseInputGroup(
          isInvalid: invalid,
          prefix: Icon(Icons.alternate_email, color: context.riseTheme.mutedForeground(0.7)),
          children: [
            RiseInput(
              controller: _controller,
              onChanged: (_) => setState(() {}),
              placeholder: 'Username',
            ),
          ],
        ),
        const SizedBox(height: 6),
        RiseFieldError(
          visible: invalid,
          child: const Text('Use at least 3 characters.'),
        ),
      ],
    );
  }
}

class _InputGroupDisabledEmbed extends StatelessWidget {
  const _InputGroupDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      enabled: false,
      prefix: Icon(Icons.lock_outline, color: context.riseTheme.mutedForeground(0.5)),
      children: const [
        RiseInput(placeholder: 'Read-only token'),
      ],
    );
  }
}

class _InputGroupWithSuffixEmbed extends StatelessWidget {
  const _InputGroupWithSuffixEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      suffix: Icon(Icons.alternate_email, color: context.riseTheme.mutedForeground(0.7)),
      children: const [
        RiseInput(placeholder: 'Email address'),
      ],
    );
  }
}

class _InputGroupPrefixSuffixEmbed extends StatelessWidget {
  const _InputGroupPrefixSuffixEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseInputGroup(
      prefix: Text('\$'),
      suffix: Text('USD'),
      children: [
        RiseInput(placeholder: 'Set a price'),
      ],
    );
  }
}

class _InputGroupPasswordToggleEmbed extends StatefulWidget {
  const _InputGroupPasswordToggleEmbed();

  @override
  State<_InputGroupPasswordToggleEmbed> createState() => _InputGroupPasswordToggleEmbedState();
}

class _InputGroupPasswordToggleEmbedState extends State<_InputGroupPasswordToggleEmbed> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return RiseInputGroup(
      suffix: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
      ),
      children: [
        RiseInput(
          obscureText: _obscure,
          placeholder: 'Password',
        ),
      ],
    );
  }
}

class _InputGroupVariantsEmbed extends StatelessWidget {
  const _InputGroupVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RiseInputGroup(
          variant: RiseInputGroupVariant.primary,
          prefix: Icon(Icons.email_outlined),
          children: [RiseInput(placeholder: 'Primary variant')],
        ),
        SizedBox(height: 12),
        RiseInputGroup(
          variant: RiseInputGroupVariant.secondary,
          prefix: Icon(Icons.email_outlined),
          children: [RiseInput(placeholder: 'Secondary variant')],
        ),
      ],
    );
  }
}

class _InputGroupFullWidthEmbed extends StatelessWidget {
  const _InputGroupFullWidthEmbed();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RiseInputGroup(
            fullWidth: true,
            prefix: Icon(Icons.email_outlined),
            children: [RiseInput(placeholder: 'name@email.com')],
          ),
          SizedBox(height: 16),
          RiseInputGroup(
            fullWidth: true,
            suffix: Icon(Icons.visibility_outlined),
            children: [
              RiseInput(
                obscureText: true,
                placeholder: 'Enter password',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InputGroupInvalidEmbed extends StatelessWidget {
  const _InputGroupInvalidEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseInputGroup(
      isInvalid: true,
      prefix: Icon(Icons.email_outlined),
      children: [
        RiseInput(placeholder: 'Invalid email'),
      ],
    );
  }
}
