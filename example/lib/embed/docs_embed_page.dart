import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import '../showcase/catalog/accordion_showcase.dart';
import '../showcase/catalog/alert_showcase.dart';
import '../showcase/catalog/avatar_showcase.dart';
import '../showcase/catalog/button_showcase.dart';
import '../showcase/catalog/checkbox_showcase.dart';
import '../showcase/catalog/description_showcase.dart';
import '../showcase/catalog/field_error_showcase.dart';
import '../showcase/catalog/label_showcase.dart';
import '../showcase/catalog/list_group_showcase.dart';
import '../showcase/catalog/popover_showcase.dart';
import '../showcase/catalog/radio_showcase.dart';
import '../showcase/catalog/search_field_showcase.dart';
import '../showcase/catalog/select_showcase.dart';
import '../showcase/catalog/scroll_shadow_showcase.dart';
import '../showcase/catalog/separator_showcase.dart';
import '../showcase/catalog/input_showcase.dart';
import '../showcase/catalog/input_group_showcase.dart';
import '../showcase/catalog/input_otp_showcase.dart';
import '../showcase/catalog/tag_group_showcase.dart';
import '../showcase/catalog/skeleton_showcase.dart';
import '../showcase/catalog/slider_showcase.dart';
import '../showcase/catalog/spinner_showcase.dart';
import '../showcase/catalog/surface_showcase.dart';
import '../showcase/catalog/switch_showcase.dart';
import '../showcase/catalog/tabs_showcase.dart';
import '../showcase/catalog/text_area_showcase.dart';
import '../showcase/catalog/text_field_showcase.dart';
import '../showcase/catalog/chip_showcase.dart';
import '../showcase/catalog/card_showcase.dart';
import '../showcase/catalog/close_button_showcase.dart';

/// Renders a single docs preview by `?embed=` query (Flutter web only).
class DocsEmbedPage extends StatelessWidget {
  const DocsEmbedPage({super.key, required this.embedId});

  final String embedId;

  @override
  Widget build(BuildContext context) {
    final child = _buildForId(context);
    return Scaffold(
      backgroundColor: context.riseTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: child,
        ),
      ),
    );
  }

  Widget _buildForId(BuildContext context) {
    final accordion = buildAccordionDocsEmbed(context, embedId);
    if (accordion != null) {
      return accordion;
    }
    final alertEmbed = buildAlertDocsEmbed(context, embedId);
    if (alertEmbed != null) {
      return alertEmbed;
    }
    final avatarEmbed = buildAvatarDocsEmbed(context, embedId);
    if (avatarEmbed != null) {
      return avatarEmbed;
    }
    final button = buildButtonDocsEmbed(context, embedId);
    if (button != null) {
      return button;
    }
    final closeButton = buildCloseButtonDocsEmbed(context, embedId);
    if (closeButton != null) {
      return closeButton;
    }
    final chip = buildChipDocsEmbed(context, embedId);
    if (chip != null) {
      return chip;
    }
    final cardEmbed = buildCardDocsEmbed(context, embedId);
    if (cardEmbed != null) {
      return cardEmbed;
    }
    final tagGroup = buildTagGroupDocsEmbed(context, embedId);
    if (tagGroup != null) {
      return tagGroup;
    }
    final slider = buildSliderDocsEmbed(context, embedId);
    if (slider != null) {
      return slider;
    }
    final skeletonEmbed = buildSkeletonDocsEmbed(context, embedId);
    if (skeletonEmbed != null) {
      return skeletonEmbed;
    }
    final spinnerEmbed = buildSpinnerDocsEmbed(context, embedId);
    if (spinnerEmbed != null) {
      return spinnerEmbed;
    }
    final surfaceEmbed = buildSurfaceDocsEmbed(context, embedId);
    if (surfaceEmbed != null) {
      return surfaceEmbed;
    }
    final switchEmbed = buildSwitchDocsEmbed(context, embedId);
    if (switchEmbed != null) {
      return switchEmbed;
    }
    final checkboxEmbed = buildCheckboxDocsEmbed(context, embedId);
    if (checkboxEmbed != null) {
      return checkboxEmbed;
    }
    final descriptionEmbed = buildDescriptionDocsEmbed(context, embedId);
    if (descriptionEmbed != null) {
      return descriptionEmbed;
    }
    final fieldErrorEmbed = buildFieldErrorDocsEmbed(context, embedId);
    if (fieldErrorEmbed != null) {
      return fieldErrorEmbed;
    }
    final labelEmbed = buildLabelDocsEmbed(context, embedId);
    if (labelEmbed != null) {
      return labelEmbed;
    }
    final listGroupEmbed = buildListGroupDocsEmbed(context, embedId);
    if (listGroupEmbed != null) {
      return listGroupEmbed;
    }
    final popoverEmbed = buildPopoverDocsEmbed(context, embedId);
    if (popoverEmbed != null) {
      return popoverEmbed;
    }
    final radioEmbed = buildRadioDocsEmbed(context, embedId);
    if (radioEmbed != null) {
      return radioEmbed;
    }
    final searchFieldEmbed = buildSearchFieldDocsEmbed(context, embedId);
    if (searchFieldEmbed != null) {
      return searchFieldEmbed;
    }
    final selectEmbed = buildSelectDocsEmbed(context, embedId);
    if (selectEmbed != null) {
      return selectEmbed;
    }
    final separatorEmbed = buildSeparatorDocsEmbed(context, embedId);
    if (separatorEmbed != null) {
      return separatorEmbed;
    }
    final scrollShadowEmbed = buildScrollShadowDocsEmbed(context, embedId);
    if (scrollShadowEmbed != null) {
      return scrollShadowEmbed;
    }
    final inputEmbed = buildInputDocsEmbed(context, embedId);
    if (inputEmbed != null) {
      return inputEmbed;
    }
    final inputGroupEmbed = buildInputGroupDocsEmbed(context, embedId);
    if (inputGroupEmbed != null) {
      return inputGroupEmbed;
    }
    final inputOtpEmbed = buildInputOtpDocsEmbed(context, embedId);
    if (inputOtpEmbed != null) {
      return inputOtpEmbed;
    }
    final textAreaEmbed = buildTextAreaDocsEmbed(context, embedId);
    if (textAreaEmbed != null) {
      return textAreaEmbed;
    }
    final textFieldEmbed = buildTextFieldDocsEmbed(context, embedId);
    if (textFieldEmbed != null) {
      return textFieldEmbed;
    }
    final tabsEmbed = buildTabsDocsEmbed(context, embedId);
    if (tabsEmbed != null) {
      return tabsEmbed;
    }
    return Center(
      child: Text(
        'Unknown embed: $embedId',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
