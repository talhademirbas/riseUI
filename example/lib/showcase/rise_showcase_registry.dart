import 'catalog/accordion_showcase.dart';
import 'catalog/alert_showcase.dart';
import 'catalog/avatar_showcase.dart';
import 'catalog/button_showcase.dart';
import 'catalog/button_group_showcase.dart';
import 'catalog/chip_showcase.dart';
import 'catalog/card_showcase.dart';
import 'catalog/checkbox_showcase.dart';
import 'catalog/close_button_showcase.dart';
import 'catalog/description_showcase.dart';
import 'catalog/field_error_showcase.dart';
import 'catalog/input_showcase.dart';
import 'catalog/input_group_showcase.dart';
import 'catalog/input_otp_showcase.dart';
import 'catalog/label_showcase.dart';
import 'catalog/popover_showcase.dart';
import 'catalog/radio_showcase.dart';
import 'catalog/search_field_showcase.dart';
import 'catalog/select_showcase.dart';
import 'catalog/scroll_shadow_showcase.dart';
import 'catalog/separator_showcase.dart';
import 'catalog/tag_group_showcase.dart';
import 'catalog/skeleton_showcase.dart';
import 'catalog/slider_showcase.dart';
import 'catalog/spinner_showcase.dart';
import 'catalog/surface_showcase.dart';
import 'catalog/switch_showcase.dart';
import 'catalog/tabs_showcase.dart';
import 'catalog/text_area_showcase.dart';
import 'catalog/text_field_showcase.dart';
import 'rise_showcase_models.dart';

/// All registered component showcases (extend this list as you add components).
final List<RiseComponentShowcase> kRiseComponentShowcases = [
  riseAccordionShowcase,
  riseAlertShowcase,
  riseAvatarShowcase,
  riseButtonShowcase,
  riseCloseButtonShowcase,
  riseChipShowcase,
  riseCardShowcase,
  riseCheckboxShowcase,
  riseDescriptionShowcase,
  riseFieldErrorShowcase,
  riseLabelShowcase,
  risePopoverShowcase,
  riseRadioShowcase,
  riseSearchFieldShowcase,
  riseSelectShowcase,
  riseScrollShadowShowcase,
  riseSeparatorShowcase,
  riseInputShowcase,
  riseInputGroupShowcase,
  riseInputOtpShowcase,
  riseButtonGroupShowcase,
  riseTagGroupShowcase,
  riseSliderShowcase,
  riseSkeletonShowcase,
  riseSpinnerShowcase,
  riseSurfaceShowcase,
  riseSwitchShowcase,
  riseTabsShowcase,
  riseTextFieldShowcase,
  riseTextAreaShowcase,
];

final Map<String, RiseComponentShowcase> kRiseShowcasesById = {
  for (final c in kRiseComponentShowcases) c.componentId: c,
};
