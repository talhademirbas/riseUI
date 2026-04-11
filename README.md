# RiseUI

[📚 Documentation](https://www.risition.com/riseui/docs) · [🖼️ Widgets](https://www.risition.com/riseui/docs/components/button) · [🤓 API Reference](https://pub.dev/documentation/rise_ui/latest/) · [🗺️ Road Map](https://github.com/talhademirbas/riseUI/issues)

**RiseUI** is a minimal, [HeroUI](https://www.heroui.com/)-inspired Flutter component library: buttons, inputs, dialogs, toasts, and other building blocks with a cohesive theme.

## Why Choose RiseUI?

- **HeroUI-aligned** — familiar variants, spacing, and motion ideas translated to Flutter, not a pixel-perfect web port.
- **Flutter-first APIs** — composition and `ThemeExtension` patterns that feel natural in Material apps.
- **One theme system** — `RiseThemeData` (light/dark) shared across every widget; access tokens with `context.riseTheme`.
- **Documented end-to-end** — live docs with embeds, Dart snippets, and a runnable [`example/`](https://github.com/talhademirbas/riseUI/tree/main/example) app in the repo.
- **Practical scope** — inputs, overlays, feedback, and layout primitives without pulling in a full design-system framework.

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
