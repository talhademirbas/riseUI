# RiseUI

**RiseUI** is a minimal, [HeroUI](https://www.heroui.com/)-inspired Flutter component library: buttons, inputs, dialogs, toasts, and other building blocks with a cohesive theme.

## Install

```yaml
dependencies:
  rise_ui: ^0.1.0
```

Or:

```bash
dart pub add rise_ui
```

**SDK:** Dart `^3.10.1`, Flutter `>=1.17.0`.

## Quick start

Register **RiseThemeData** as a `ThemeExtension` on your `ThemeData` so widgets can read tokens via `context.riseTheme`:

```dart
import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RiseUI',
      theme: ThemeData(
        useMaterial3: true,
        extensions: const [RiseThemeData.light],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiseButton(
          label: 'Hello',
          onPressed: () {},
        ),
      ),
    );
  }
}
```

For dark mode, add a `darkTheme` that uses `ThemeData(extensions: const [RiseThemeData.dark], …)` (and optional `ColorScheme.fromSeed` wired to those tokens — see the `example` app’s `_riseExampleTheme`).

## Documentation

Full docs and usage examples are available at:

- https://www.risition.com/riseui/docs

## What’s included

All components are exported from `package:rise_ui/rise_ui.dart`.

### Inputs & form controls

- `RiseInput`
- `RiseTextField`
- `RiseTextArea`
- `RiseSearchField`
- `RiseInputOtp`
- `RiseCheckbox`
- `RiseRadio`
- `RiseSwitch`
- `RiseSelect`
- `RiseSlider`
- `RiseControlField`
- `RiseFieldError`
- `RiseLabel`
- `RiseDescription`
- `RiseInputGroup`

### Buttons & actions

- `RiseButton`
- `RiseButtonGroup`
- `RiseLinkButton`
- `RiseCloseButton`

### Layout, navigation & content

- `RiseAccordion`
- `RiseTabs`
- `RiseListGroup`
- `RiseMenu`
- `RiseTagGroup`
- `RiseChip`
- `RiseSeparator`
- `RiseScrollShadow`

### Surfaces & structure

- `RiseSurface`
- `RiseCard`
- `RiseAvatar`

### Overlays

- `RiseDialog`
- `RiseBottomSheet`
- `RisePopover`

### Feedback & loading

- `RiseAlert`
- `RiseToast`
- `RiseSpinner`
- `RiseSkeleton`

### Theming

- `RiseThemeData` (light and dark theme extensions)

## Example app

The repository includes a showcase app under [`example/`](https://github.com/talhademirbas/riseUI/tree/main/example). From that folder:

```bash
cd example && flutter pub get && flutter run
```

## Repository & contributing

- **Source:** [github.com/talhademirbas/riseUI](https://github.com/talhademirbas/riseUI)
- **Issues / ideas:** use [GitHub Issues](https://github.com/talhademirbas/riseUI/issues)

Third-party attribution is summarized in [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).

## License

MIT — see [`LICENSE`](LICENSE).
