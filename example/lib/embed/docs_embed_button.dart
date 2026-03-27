import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Button demos for docs iframe (`?embed=button-*`) — aligned with [HeroUI Button](https://heroui.com/docs/react/components/button).
class DocsEmbedButton {
  DocsEmbedButton._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static void _noop() {}

  /// Basic usage.
  static Widget usage(BuildContext context) {
    return _wrap(
      RiseButton(
        label: 'Click me',
        onPressed: _noop,
      ),
    );
  }

  /// All variants in a wrap.
  static Widget variants(BuildContext context) {
    return _wrap(
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          RiseButton(label: 'Primary', onPressed: _noop),
          RiseButton(variant: RiseButtonVariant.secondary, label: 'Secondary', onPressed: _noop),
          RiseButton(variant: RiseButtonVariant.tertiary, label: 'Tertiary', onPressed: _noop),
          RiseButton(variant: RiseButtonVariant.outline, label: 'Outline', onPressed: _noop),
          RiseButton(variant: RiseButtonVariant.ghost, label: 'Ghost', onPressed: _noop),
          RiseButton(variant: RiseButtonVariant.danger, label: 'Danger', onPressed: _noop),
          RiseButton(variant: RiseButtonVariant.dangerSoft, label: 'Danger soft', onPressed: _noop),
        ],
      ),
    );
  }

  static Widget _iconBtn(IconData i, String label) {
    return RiseButton(
      onPressed: _noop,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(i, size: 18),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }

  /// Leading icon + label.
  static Widget withIcons(BuildContext context) {
    return _wrap(
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          _iconBtn(Icons.search, 'Search'),
          _iconBtn(Icons.person_add_outlined, 'Add Member'),
          _iconBtn(Icons.email_outlined, 'Email'),
          RiseButton(
            variant: RiseButtonVariant.danger,
            onPressed: _noop,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.delete_outline, size: 18),
                SizedBox(width: 8),
                Text('Delete'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget iconOnly(BuildContext context) {
    final muted = context.riseTheme.mutedForeground(0.7);
    return _wrap(
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          RiseButton(
            isIconOnly: true,
            onPressed: _noop,
            child: Icon(Icons.more_horiz, color: muted),
          ),
          RiseButton(
            isIconOnly: true,
            variant: RiseButtonVariant.outline,
            onPressed: _noop,
            child: Icon(Icons.settings_outlined, color: muted),
          ),
          RiseButton(
            isIconOnly: true,
            variant: RiseButtonVariant.danger,
            onPressed: _noop,
            child: const Icon(Icons.delete_outline, size: 20),
          ),
        ],
      ),
    );
  }

  /// Spinner + text (pending) — spinner matches `accentForeground` on primary fill.
  static Widget loading(BuildContext context) {
    final fg = context.riseTheme.accentForeground;
    return _wrap(
      RiseButton(
        isDisabled: true,
        onPressed: null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: fg,
              ),
            ),
            const SizedBox(width: 10),
            Text('Uploading…', style: TextStyle(color: fg)),
          ],
        ),
      ),
    );
  }

  /// Outline + paperclip + label.
  static Widget loadingState(BuildContext context) {
    return _wrap(
      RiseButton(
        variant: RiseButtonVariant.outline,
        onPressed: _noop,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.attach_file, size: 18, color: context.riseTheme.defaultForeground),
            const SizedBox(width: 8),
            const Text('Upload File'),
          ],
        ),
      ),
    );
  }

  static Widget sizes(BuildContext context) {
    return _wrap(
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RiseButton(size: RiseButtonSize.sm, label: 'Small', onPressed: _noop),
          const SizedBox(width: 16),
          RiseButton(size: RiseButtonSize.md, label: 'Medium', onPressed: _noop),
          const SizedBox(width: 16),
          RiseButton(size: RiseButtonSize.lg, label: 'Large', onPressed: _noop),
        ],
      ),
    );
  }

  static Widget fullWidth(BuildContext context) {
    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseButton(
            fullWidth: true,
            label: 'Primary Button',
            onPressed: _noop,
          ),
          const SizedBox(height: 12),
          RiseButton(
            fullWidth: true,
            variant: RiseButtonVariant.outline,
            onPressed: _noop,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, size: 18, color: context.riseTheme.defaultForeground),
                const SizedBox(width: 8),
                const Text('With Icon'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget disabled(BuildContext context) {
    return _wrap(
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          RiseButton(isDisabled: true, label: 'Primary', onPressed: _noop),
          RiseButton(isDisabled: true, variant: RiseButtonVariant.secondary, label: 'Secondary', onPressed: _noop),
          RiseButton(isDisabled: true, variant: RiseButtonVariant.tertiary, label: 'Tertiary', onPressed: _noop),
          RiseButton(isDisabled: true, variant: RiseButtonVariant.outline, label: 'Outline', onPressed: _noop),
          RiseButton(isDisabled: true, variant: RiseButtonVariant.ghost, label: 'Ghost', onPressed: _noop),
          RiseButton(isDisabled: true, variant: RiseButtonVariant.danger, label: 'Danger', onPressed: _noop),
        ],
      ),
    );
  }

  /// Stacked OAuth-style rows — [HeroUI Social Buttons](https://heroui.com/docs/react/components/button) (outline + full width).
  static Widget socialButtons(BuildContext context) {
    final fg = context.riseTheme.defaultForeground;
    Widget row(IconData icon, String label) {
      return RiseButton(
        fullWidth: true,
        variant: RiseButtonVariant.outline,
        onPressed: _noop,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: fg),
            const SizedBox(width: 10),
            Text(label),
          ],
        ),
      );
    }

    return _wrap(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          row(Icons.g_mobiledata, 'Sign in with Google'),
          const SizedBox(height: 12),
          row(Icons.code, 'Sign in with GitHub'),
          const SizedBox(height: 12),
          row(Icons.apple, 'Sign in with Apple'),
        ],
      ),
    );
  }

  /// Icon + [RiseButtonLabel] + muted suffix — HeroUI-style compound label (not ad-hoc render props).
  static Widget compoundLabel(BuildContext context) {
    final theme = context.riseTheme;
    final muted = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: theme.mutedForeground(0.85),
        );
    return _wrap(
      RiseButton(
        variant: RiseButtonVariant.secondary,
        onPressed: _noop,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.mail_outlined, size: 18),
            const SizedBox(width: 8),
            const RiseButtonLabel('Messages'),
            const SizedBox(width: 6),
            Text('12', style: muted),
          ],
        ),
      ),
    );
  }
}
