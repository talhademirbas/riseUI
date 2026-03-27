import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

/// Standard padding and section headers for showcase pages.
class DemoScaffold extends StatelessWidget {
  const DemoScaffold({
    super.key,
    required this.title,
    this.subtitle,
    required this.sections,
  });

  final String title;

  final String? subtitle;

  final List<DemoSection> sections;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (subtitle != null) ...[
            Text(
              subtitle!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: context.riseTheme.mutedForeground(0.8),
              ),
            ),
            const SizedBox(height: 20),
          ],
          for (var i = 0; i < sections.length; i++) ...[
            if (i > 0) const SizedBox(height: 28),
            sections[i],
          ],
        ],
      ),
    );
  }
}

class DemoSection extends StatelessWidget {
  const DemoSection({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
