import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'embed/docs_embed_page.dart';
import 'pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final embedId = _readEmbedId();
  final ThemeMode? embedThemeMode = _readEmbedThemeMode();
  runApp(RiseUiExampleApp(embedId: embedId, embedThemeMode: embedThemeMode));
}

/// Docs site loads `/…?embed=accordion-faq` inside an iframe.
String? _readEmbedId() {
  if (!kIsWeb) return null;
  try {
    final q = Uri.base.queryParameters['embed'];
    if (q == null || q.isEmpty) return null;
    return q;
  } catch (_) {
    return null;
  }
}

ThemeMode? _readEmbedThemeMode() {
  if (!kIsWeb) return null;
  try {
    final t = Uri.base.queryParameters['theme'];
    if (t == 'dark') return ThemeMode.dark;
    if (t == 'light') return ThemeMode.light;
    return null;
  } catch (_) {
    return null;
  }
}

ThemeData _riseExampleTheme({required Brightness brightness}) {
  final rise = brightness == Brightness.dark ? RiseThemeData.dark : RiseThemeData.light;
  final scheme = ColorScheme.fromSeed(
        seedColor: rise.accent,
        brightness: brightness,
        surface: rise.surface,
        onSurface: rise.defaultForeground,
        primary: rise.accent,
        onPrimary: rise.accentForeground,
        error: rise.danger,
        onError: rise.dangerForeground,
      )
      .copyWith(
        surfaceContainerLowest: rise.background,
        surfaceContainerLow: rise.muted,
        surfaceContainer: rise.surfaceSecondary,
        surfaceContainerHigh: rise.surfaceTertiary,
        surfaceContainerHighest: rise.surfaceTertiary,
        outline: rise.border,
        outlineVariant: rise.separator,
      );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    scaffoldBackgroundColor: rise.background,
    colorScheme: scheme,
    extensions: [rise],
  );
}

/// Example app for the `rise_ui` package.
///
/// Each component lives under [pages/demos] and is opened from [HomePage] so
/// only one heavy screen is built at a time. For documentation **embed** mode,
/// [build] uses [DocsEmbedPage] when `?embed=` is present (Flutter web).
class RiseUiExampleApp extends StatelessWidget {
  const RiseUiExampleApp({super.key, this.embedId, this.embedThemeMode});

  /// When set (web + `?embed=`), shows a single preview for iframe embedding.
  final String? embedId;

  /// Optional `?theme=dark|light` when [embedId] is set.
  final ThemeMode? embedThemeMode;

  @override
  Widget build(BuildContext context) {
    final embed = embedId;
    return MaterialApp(
      title: 'RiseUI Example',
      debugShowCheckedModeBanner: false,
      theme: _riseExampleTheme(brightness: Brightness.light),
      darkTheme: _riseExampleTheme(brightness: Brightness.dark),
      themeMode: embedThemeMode ?? ThemeMode.system,
      home: embed != null ? DocsEmbedPage(embedId: embed) : const HomePage(),
    );
  }
}
