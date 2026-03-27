import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'docs_embed_accordion.dart' show kDocsEmbedMaxWidth;

/// Card demos for docs iframe (`?embed=card-*`).
class DocsEmbedCard {
  DocsEmbedCard._();

  static Widget _wrap(Widget child) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kDocsEmbedMaxWidth),
        child: child,
      ),
    );
  }

  static Widget usage(BuildContext context) => _wrap(const _CardUsageEmbed());

  static Widget variants(BuildContext context) => _wrap(const _CardVariantsEmbed());

  static Widget horizontal(BuildContext context) => _wrap(const _CardHorizontalEmbed());

  static Widget withForm(BuildContext context) => _wrap(const _CardWithFormEmbed());
}

class _CardUsageEmbed extends StatelessWidget {
  const _CardUsageEmbed();

  @override
  Widget build(BuildContext context) {
    return RiseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseCardHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const RiseCardTitle(child: Text('Become an Acme Creator!')),
                const SizedBox(height: 4),
                RiseCardDescription(
                  child: Text(
                    'Visit the Acme Creator Hub to sign up today and start earning credits from '
                    'your fans and followers.',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: RiseCard.sectionGap),
          RiseCardContent(
            child: Text(
              'Creator Hub spots are limited. Apply early to lock in founding benefits.',
              style: TextStyle(color: context.riseTheme.defaultForeground, fontSize: 14, height: 20 / 14),
            ),
          ),
          const SizedBox(height: RiseCard.sectionGap),
          RiseCardFooter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: RiseButton(
                variant: RiseButtonVariant.primary,
                onPressed: () {},
                label: 'Creator Hub',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardVariantsEmbed extends StatelessWidget {
  const _CardVariantsEmbed();

  @override
  Widget build(BuildContext context) {
    Widget tile(String label, RiseCardVariant v) {
      return RiseCard(
        variant: v,
        child: Text(
          label,
          style: TextStyle(
            color: context.riseTheme.defaultForeground,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        tile('transparent — nested / low emphasis', RiseCardVariant.transparent),
        const SizedBox(height: RiseCard.sectionGap),
        tile('standard — default surface', RiseCardVariant.standard),
        const SizedBox(height: RiseCard.sectionGap),
        tile('secondary — medium prominence', RiseCardVariant.secondary),
        const SizedBox(height: RiseCard.sectionGap),
        tile('tertiary — higher prominence', RiseCardVariant.tertiary),
      ],
    );
  }
}

class _CardHorizontalEmbed extends StatelessWidget {
  const _CardHorizontalEmbed();

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;
    return RiseCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 96,
              height: 96,
              color: rise.muted,
              alignment: Alignment.center,
              child: Icon(Icons.image_outlined, color: rise.mutedForeground()),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const RiseCardTitle(child: Text('Become an ACME Creator!')),
                const SizedBox(height: 4),
                RiseCardDescription(
                  child: const Text(
                    'Lorem ipsum dolor sit amet consectetur. Sed arcu donec id aliquam dolor sed '
                    'amet faucibus etiam.',
                  ),
                ),
                const SizedBox(height: RiseCard.sectionGap),
                Text(
                  'Only 10 spots · Submission ends Oct 10.',
                  style: TextStyle(fontSize: 12, color: rise.mutedForeground(0.85)),
                ),
                const SizedBox(height: RiseCard.sectionGap),
                RiseCardFooter(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RiseButton(
                      variant: RiseButtonVariant.primary,
                      onPressed: () {},
                      label: 'Apply now',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardWithFormEmbed extends StatefulWidget {
  const _CardWithFormEmbed();

  @override
  State<_CardWithFormEmbed> createState() => _CardWithFormEmbedState();
}

class _CardWithFormEmbedState extends State<_CardWithFormEmbed> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          RiseCardHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const RiseCardTitle(child: Text('Login')),
                const SizedBox(height: 4),
                RiseCardDescription(
                  child: const Text('Enter your credentials to access your account.'),
                ),
              ],
            ),
          ),
          const SizedBox(height: RiseCard.sectionGap),
          RiseCardContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RiseTextField(
                  controller: _email,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  fullWidth: true,
                ),
                const SizedBox(height: 12),
                RiseTextField(
                  controller: _password,
                  labelText: 'Password',
                  obscureText: true,
                  fullWidth: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: RiseCard.sectionGap),
          RiseCardFooter(
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                RiseButton(
                  variant: RiseButtonVariant.primary,
                  onPressed: () {},
                  label: 'Sign in',
                ),
                RiseButton(
                  variant: RiseButtonVariant.ghost,
                  onPressed: () {},
                  label: 'Forgot password?',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
