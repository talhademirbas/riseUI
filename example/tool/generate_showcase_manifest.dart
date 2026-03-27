import 'dart:convert';
import 'dart:io';

import 'package:rise_ui_example/showcase/config/accordion_public_config.dart';
import 'package:rise_ui_example/showcase/config/alert_public_config.dart';
import 'package:rise_ui_example/showcase/config/avatar_public_config.dart';
import 'package:rise_ui_example/showcase/config/button_public_config.dart';
import 'package:rise_ui_example/showcase/config/tag_group_public_config.dart';
import 'package:rise_ui_example/showcase/config/skeleton_public_config.dart';
import 'package:rise_ui_example/showcase/config/slider_public_config.dart';
import 'package:rise_ui_example/showcase/config/spinner_public_config.dart';
import 'package:rise_ui_example/showcase/config/surface_public_config.dart';
import 'package:rise_ui_example/showcase/config/switch_public_config.dart';
import 'package:rise_ui_example/showcase/config/tabs_public_config.dart';
import 'package:rise_ui_example/showcase/config/chip_public_config.dart';
import 'package:rise_ui_example/showcase/config/card_public_config.dart';
import 'package:rise_ui_example/showcase/config/checkbox_public_config.dart';
import 'package:rise_ui_example/showcase/config/close_button_public_config.dart';
import 'package:rise_ui_example/showcase/config/description_public_config.dart';
import 'package:rise_ui_example/showcase/config/field_error_public_config.dart';
import 'package:rise_ui_example/showcase/config/label_public_config.dart';
import 'package:rise_ui_example/showcase/config/list_group_public_config.dart';
import 'package:rise_ui_example/showcase/config/popover_public_config.dart';
import 'package:rise_ui_example/showcase/config/radio_public_config.dart';
import 'package:rise_ui_example/showcase/config/search_field_public_config.dart';
import 'package:rise_ui_example/showcase/config/select_public_config.dart';
import 'package:rise_ui_example/showcase/config/scroll_shadow_public_config.dart';
import 'package:rise_ui_example/showcase/config/separator_public_config.dart';
import 'package:rise_ui_example/showcase/config/input_public_config.dart';
import 'package:rise_ui_example/showcase/config/input_group_public_config.dart';
import 'package:rise_ui_example/showcase/config/input_otp_public_config.dart';
import 'package:rise_ui_example/showcase/config/text_field_public_config.dart';
import 'package:rise_ui_example/showcase/config/text_area_public_config.dart';

/// Writes [apps/docs/src/data/showcase-manifest.json] for the Next.js docs app.
///
/// Uses only Flutter-agnostic config (no `dart:ui`). Run from `example/`:
/// `dart run tool/generate_showcase_manifest.dart`
void main() {
  // From `example/`, repo root is `../`.
  final outFile = File('../apps/docs/src/data/showcase-manifest.json');
  outFile.parent.createSync(recursive: true);
  final payload = <String, dynamic>{
    'version': 1,
    'generated': DateTime.now().toUtc().toIso8601String(),
    'components': [
      _accordionManifestMap(),
      _alertManifestMap(),
      _avatarManifestMap(),
      _buttonManifestMap(),
      _closeButtonManifestMap(),
      _chipManifestMap(),
      _cardManifestMap(),
      _tagGroupManifestMap(),
      _sliderManifestMap(),
      _skeletonManifestMap(),
      _spinnerManifestMap(),
      _surfaceManifestMap(),
      _switchManifestMap(),
      _tabsManifestMap(),
      _checkboxManifestMap(),
      _descriptionManifestMap(),
      _fieldErrorManifestMap(),
      _labelManifestMap(),
      _listGroupManifestMap(),
      _popoverManifestMap(),
      _radioManifestMap(),
      _searchFieldManifestMap(),
      _selectManifestMap(),
      _scrollShadowManifestMap(),
      _separatorManifestMap(),
      _inputManifestMap(),
      _inputGroupManifestMap(),
      _inputOtpManifestMap(),
      _textFieldManifestMap(),
      _textAreaManifestMap(),
    ],
  };
  outFile.writeAsStringSync(const JsonEncoder.withIndent('  ').convert(payload));
  // ignore: avoid_print
  print('Wrote ${outFile.absolute.path}');
}

Map<String, dynamic> _accordionManifestMap() => {
      'id': kAccordionComponentId,
      'title': kAccordionTitle,
      'description': kAccordionDescription,
      'variants': [
        for (final c in kAccordionUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kAccordionComponentId),
          },
      ],
    };

Map<String, dynamic> _alertManifestMap() => {
      'id': kAlertComponentId,
      'title': kAlertTitle,
      'description': kAlertDescription,
      'variants': [
        for (final c in kAlertUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kAlertComponentId),
          },
      ],
    };

Map<String, dynamic> _avatarManifestMap() => {
      'id': kAvatarComponentId,
      'title': kAvatarTitle,
      'description': kAvatarDescription,
      'variants': [
        for (final c in kAvatarUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kAvatarComponentId),
          },
      ],
    };

Map<String, dynamic> _buttonManifestMap() => {
      'id': kButtonComponentId,
      'title': kButtonTitle,
      'description': kButtonDescription,
      'variants': [
        for (final c in kButtonUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kButtonComponentId),
          },
      ],
    };

Map<String, dynamic> _closeButtonManifestMap() => {
      'id': kCloseButtonComponentId,
      'title': kCloseButtonTitle,
      'description': kCloseButtonDescription,
      'variants': [
        for (final c in kCloseButtonUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kCloseButtonComponentId),
          },
      ],
    };

Map<String, dynamic> _chipManifestMap() => {
      'id': kChipComponentId,
      'title': kChipTitle,
      'description': kChipDescription,
      'variants': [
        for (final c in kChipUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kChipComponentId),
          },
      ],
    };

Map<String, dynamic> _cardManifestMap() => {
      'id': kCardComponentId,
      'title': kCardTitle,
      'description': kCardDescription,
      'variants': [
        for (final c in kCardUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kCardComponentId),
          },
      ],
    };

Map<String, dynamic> _tagGroupManifestMap() => {
      'id': kTagGroupComponentId,
      'title': kTagGroupTitle,
      'description': kTagGroupDescription,
      'variants': [
        for (final c in kTagGroupUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kTagGroupComponentId),
          },
      ],
    };

Map<String, dynamic> _sliderManifestMap() => {
      'id': kSliderComponentId,
      'title': kSliderTitle,
      'description': kSliderDescription,
      'variants': [
        for (final c in kSliderUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kSliderComponentId),
          },
      ],
    };

Map<String, dynamic> _skeletonManifestMap() => {
      'id': kSkeletonComponentId,
      'title': kSkeletonTitle,
      'description': kSkeletonDescription,
      'variants': [
        for (final c in kSkeletonUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kSkeletonComponentId),
          },
      ],
    };

Map<String, dynamic> _spinnerManifestMap() => {
      'id': kSpinnerComponentId,
      'title': kSpinnerTitle,
      'description': kSpinnerDescription,
      'variants': [
        for (final c in kSpinnerUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kSpinnerComponentId),
          },
      ],
    };

Map<String, dynamic> _surfaceManifestMap() => {
      'id': kSurfaceComponentId,
      'title': kSurfaceTitle,
      'description': kSurfaceDescription,
      'variants': [
        for (final c in kSurfaceUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kSurfaceComponentId),
          },
      ],
    };

Map<String, dynamic> _switchManifestMap() => {
      'id': kSwitchComponentId,
      'title': kSwitchTitle,
      'description': kSwitchDescription,
      'variants': [
        for (final c in kSwitchUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kSwitchComponentId),
          },
      ],
    };

Map<String, dynamic> _tabsManifestMap() => {
      'id': kTabsComponentId,
      'title': kTabsTitle,
      'description': kTabsDescription,
      'variants': [
        for (final c in kTabsUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kTabsComponentId),
          },
      ],
    };

Map<String, dynamic> _checkboxManifestMap() => {
      'id': kCheckboxComponentId,
      'title': kCheckboxTitle,
      'description': kCheckboxDescription,
      'variants': [
        for (final c in kCheckboxUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kCheckboxComponentId),
          },
      ],
    };

Map<String, dynamic> _descriptionManifestMap() => {
      'id': kDescriptionComponentId,
      'title': kDescriptionTitle,
      'description': kDescriptionDescription,
      'variants': [
        for (final c in kDescriptionUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kDescriptionComponentId),
          },
      ],
    };

Map<String, dynamic> _fieldErrorManifestMap() => {
      'id': kFieldErrorComponentId,
      'title': kFieldErrorTitle,
      'description': kFieldErrorDescription,
      'variants': [
        for (final c in kFieldErrorUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kFieldErrorComponentId),
          },
      ],
    };

Map<String, dynamic> _labelManifestMap() => {
      'id': kLabelComponentId,
      'title': kLabelTitle,
      'description': kLabelDescription,
      'variants': [
        for (final c in kLabelUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kLabelComponentId),
          },
      ],
    };

Map<String, dynamic> _listGroupManifestMap() => {
      'id': kListGroupComponentId,
      'title': kListGroupTitle,
      'description': kListGroupDescription,
      'variants': [
        for (final c in kListGroupUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kListGroupComponentId),
          },
      ],
    };

Map<String, dynamic> _popoverManifestMap() => {
      'id': kPopoverComponentId,
      'title': kPopoverTitle,
      'description': kPopoverDescription,
      'variants': [
        for (final c in kPopoverUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kPopoverComponentId),
          },
      ],
    };

Map<String, dynamic> _radioManifestMap() => {
      'id': kRadioComponentId,
      'title': kRadioTitle,
      'description': kRadioDescription,
      'variants': [
        for (final c in kRadioUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kRadioComponentId),
          },
      ],
    };

Map<String, dynamic> _searchFieldManifestMap() => {
      'id': kSearchFieldComponentId,
      'title': kSearchFieldTitle,
      'description': kSearchFieldDescription,
      'variants': [
        for (final c in kSearchFieldUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kSearchFieldComponentId),
          },
      ],
    };

Map<String, dynamic> _selectManifestMap() => {
      'id': kSelectComponentId,
      'title': kSelectTitle,
      'description': kSelectDescription,
      'variants': [
        for (final c in kSelectUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kSelectComponentId),
          },
      ],
    };

Map<String, dynamic> _scrollShadowManifestMap() => {
      'id': kScrollShadowComponentId,
      'title': kScrollShadowTitle,
      'description': kScrollShadowDescription,
      'variants': [
        for (final c in kScrollShadowUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kScrollShadowComponentId),
          },
      ],
    };

Map<String, dynamic> _separatorManifestMap() => {
      'id': kSeparatorComponentId,
      'title': kSeparatorTitle,
      'description': kSeparatorDescription,
      'variants': [
        for (final c in kSeparatorUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kSeparatorComponentId),
          },
      ],
    };

Map<String, dynamic> _inputManifestMap() => {
      'id': kInputComponentId,
      'title': kInputTitle,
      'description': kInputDescription,
      'variants': [
        for (final c in kInputUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kInputComponentId),
          },
      ],
    };

Map<String, dynamic> _inputGroupManifestMap() => {
      'id': kInputGroupComponentId,
      'title': kInputGroupTitle,
      'description': kInputGroupDescription,
      'variants': [
        for (final c in kInputGroupUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kInputGroupComponentId),
          },
      ],
    };

Map<String, dynamic> _inputOtpManifestMap() => {
      'id': kInputOtpComponentId,
      'title': kInputOtpTitle,
      'description': kInputOtpDescription,
      'variants': [
        for (final c in kInputOtpUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kInputOtpComponentId),
          },
      ],
    };

Map<String, dynamic> _textFieldManifestMap() => {
      'id': kTextFieldComponentId,
      'title': kTextFieldTitle,
      'description': kTextFieldDescription,
      'variants': [
        for (final c in kTextFieldUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kTextFieldComponentId),
          },
      ],
    };

Map<String, dynamic> _textAreaManifestMap() => {
      'id': kTextAreaComponentId,
      'title': kTextAreaTitle,
      'description': kTextAreaDescription,
      'variants': [
        for (final c in kTextAreaUsagePublicConfigs)
          {
            'slug': c.slug,
            'sectionTitle': c.sectionTitle,
            'subtitle': c.subtitle,
            'minHeight': c.minHeight,
            'embed': c.embedId(kTextAreaComponentId),
          },
      ],
    };
