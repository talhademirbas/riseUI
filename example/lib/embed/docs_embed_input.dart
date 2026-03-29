import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

class DocsEmbedInput {
  DocsEmbedInput._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _InputUsageEmbed());
  static Widget inputTypes(BuildContext context) => _wrap(const _InputTypesEmbed());
  static Widget controlled(BuildContext context) => _wrap(const _InputControlledEmbed());
  static Widget fullWidth(BuildContext context) => _wrap(const _InputFullWidthEmbed());
  static Widget variants(BuildContext context) => _wrap(const _InputVariantsEmbed());
  static Widget onSurfaces(BuildContext context) => _wrap(const _InputOnSurfacesEmbed());
  static Widget invalid(BuildContext context) => _wrap(const _InputInvalidEmbed());
  static Widget disabled(BuildContext context) => _wrap(const _InputDisabledEmbed());
}

class _InputUsageEmbed extends StatelessWidget {
  const _InputUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseInput(
      placeholder: 'Your name',
    );
  }
}

class _InputTypesEmbed extends StatefulWidget {
  const _InputTypesEmbed();

  @override
  State<_InputTypesEmbed> createState() => _InputTypesEmbedState();
}

class _InputTypesEmbedState extends State<_InputTypesEmbed> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const RiseInput(
          keyboardType: TextInputType.emailAddress,
          placeholder: 'Email',
        ),
        const SizedBox(height: 12),
        const RiseInput(
          keyboardType: TextInputType.number,
          placeholder: 'Age',
        ),
        const SizedBox(height: 12),
        RiseInput(
          obscureText: _obscure,
          placeholder: 'Password',
          suffixIcon: IconButton(
            icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => _obscure = !_obscure),
          ),
        ),
      ],
    );
  }
}

class _InputControlledEmbed extends StatefulWidget {
  const _InputControlledEmbed();

  @override
  State<_InputControlledEmbed> createState() => _InputControlledEmbedState();
}

class _InputControlledEmbedState extends State<_InputControlledEmbed> {
  final _controller = TextEditingController(text: 'https://heroui.com');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiseInput(
      controller: _controller,
      onChanged: (_) => setState(() {}),
    );
  }
}

/// Matches [FullWidth story](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/input/input.stories.tsx).
class _InputFullWidthEmbed extends StatelessWidget {
  const _InputFullWidthEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          width: 400,
          child: RiseInput(
            fullWidth: true,
            placeholder: 'Full width input',
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: rise.surface,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: const RiseSurface(
            variant: RiseSurfaceVariant.transparent,
            padding: EdgeInsets.zero,
            child: RiseInput(
              fullWidth: true,
              variant: RiseInputVariant.secondary,
              placeholder: 'Full width input on surface',
            ),
          ),
        ),
      ],
    );
  }
}

class _InputVariantsEmbed extends StatelessWidget {
  const _InputVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RiseInput(
            fullWidth: true,
            placeholder: 'Primary input',
            variant: RiseInputVariant.primary,
          ),
          SizedBox(height: 8),
          RiseInput(
            fullWidth: true,
            placeholder: 'Secondary input',
            variant: RiseInputVariant.secondary,
          ),
        ],
      ),
    );
  }
}

/// Matches [OnSurfaces story](https://github.com/heroui-inc/heroui/blob/v3/packages/react/src/components/input/input.stories.tsx).
class _InputOnSurfacesEmbed extends StatelessWidget {
  const _InputOnSurfacesEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.bodySmall?.copyWith(
          color: rise.mutedForeground(0.85),
          fontWeight: FontWeight.w500,
        ) ??
        TextStyle(color: rise.mutedForeground(0.85), fontWeight: FontWeight.w500, fontSize: 14);

    Widget block(String title, RiseSurfaceVariant v) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: labelStyle),
          const SizedBox(height: 8),
          RiseSurface(
            variant: v,
            borderRadius: 24,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RiseInput(
                  fullWidth: true,
                  placeholder: 'Your name',
                  variant: RiseInputVariant.primary,
                ),
                const SizedBox(height: 12),
                RiseInput(
                  fullWidth: true,
                  placeholder: 'Your name',
                  variant: RiseInputVariant.secondary,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        block('Default Surface', RiseSurfaceVariant.default_),
        const SizedBox(height: 32),
        block('Secondary Surface', RiseSurfaceVariant.secondary),
        const SizedBox(height: 32),
        block('Tertiary Surface', RiseSurfaceVariant.tertiary),
        const SizedBox(height: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transparent Surface', style: labelStyle),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: rise.border),
              ),
              child: RiseSurface(
                variant: RiseSurfaceVariant.transparent,
                borderRadius: 24,
                padding: const EdgeInsets.all(24),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RiseInput(
                      fullWidth: true,
                      placeholder: 'Your name',
                      variant: RiseInputVariant.primary,
                    ),
                    SizedBox(height: 12),
                    RiseInput(
                      fullWidth: true,
                      placeholder: 'Your name',
                      variant: RiseInputVariant.secondary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _InputInvalidEmbed extends StatelessWidget {
  const _InputInvalidEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseInput(
      isInvalid: true,
      placeholder: 'Must be at least 3 characters',
    );
  }
}

class _InputDisabledEmbed extends StatelessWidget {
  const _InputDisabledEmbed();

  @override
  Widget build(BuildContext context) {
    return const RiseInput(
      enabled: false,
      placeholder: 'Not editable',
    );
  }
}
