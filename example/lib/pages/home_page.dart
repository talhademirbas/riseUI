import 'package:flutter/material.dart';

import 'demos/accordion_page.dart';
import 'demos/alert_page.dart';
import 'demos/avatar_page.dart';
import 'demos/bottom_sheet_page.dart';
import 'demos/button_group_page.dart';
import 'demos/button_page.dart';
import 'demos/card_page.dart';
import 'demos/checkbox_page.dart';
import 'demos/chip_page.dart';
import 'demos/close_button_page.dart';
import 'demos/control_field_page.dart';
import 'demos/dialog_page.dart';
import 'demos/description_page.dart';
import 'demos/field_error_page.dart';
import 'demos/input_group_page.dart';
import 'demos/input_page.dart';
import 'demos/input_otp_page.dart';
import 'demos/label_page.dart';
import 'demos/link_button_page.dart';
import 'demos/list_group_page.dart';
import 'demos/menu_page.dart';
import 'demos/popover_page.dart';
import 'demos/radio_page.dart';
import 'demos/radio_group_page.dart';
import 'demos/scroll_shadow_page.dart';
import 'demos/search_field_page.dart';
import 'demos/select_page.dart';
import 'demos/separator_page.dart';
import 'demos/skeleton_page.dart';
import 'demos/slider_page.dart';
import 'demos/spinner_page.dart';
import 'demos/surface_page.dart';
import 'demos/switch_page.dart';
import 'demos/tabs_page.dart';
import 'demos/tag_group_page.dart';
import 'demos/text_area_page.dart';
import 'demos/text_field_page.dart';
import 'demos/toast_page.dart';
import 'demos/typography_page.dart';

/// Root catalog — one screen per component to keep builds light.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiseUI examples'),
      ),
      body: ListView(
        children: [
          _CategoryHeader('Actions & links'),
          _tile(context, 'Button', const ButtonPage(), Icons.smart_button_outlined),
          _tile(context, 'Button group', const ButtonGroupPage(), Icons.view_column),
          _tile(context, 'Close button', const CloseButtonPage(), Icons.close),
          _tile(context, 'Link button', const LinkButtonPage(), Icons.link),
          const Divider(height: 1),
          _CategoryHeader('Layout & surfaces'),
          _tile(context, 'Surface', const SurfacePage(), Icons.layers_outlined),
          _tile(context, 'Separator', const SeparatorPage(), Icons.horizontal_rule),
          _tile(context, 'Card', const CardPage(), Icons.credit_card_outlined),
          _tile(context, 'Tabs', const TabsPage(), Icons.tab),
          _tile(context, 'Scroll shadow', const ScrollShadowPage(), Icons.gradient),
          const Divider(height: 1),
          _CategoryHeader('Typography'),
          _tile(context, 'Label & description', const TypographyPage(), Icons.title),
          _tile(context, 'Label', const LabelPage(), Icons.label_outline),
          _tile(context, 'Description', const DescriptionPage(), Icons.notes_outlined),
          _tile(context, 'Field error', const FieldErrorPage(), Icons.error_outline),
          const Divider(height: 1),
          _CategoryHeader('Display'),
          _tile(context, 'Chip', const ChipPage(), Icons.label_outline),
          _tile(context, 'Avatar', const AvatarPage(), Icons.account_circle_outlined),
          _tile(context, 'Alert', const AlertPage(), Icons.info_outline),
          _tile(context, 'List group', const ListGroupPage(), Icons.view_list_outlined),
          _tile(context, 'Accordion', const AccordionPage(), Icons.expand_more),
          _tile(context, 'Tag group', const TagGroupPage(), Icons.local_offer_outlined),
          const Divider(height: 1),
          _CategoryHeader('Form'),
          _tile(context, 'Checkbox', const CheckboxPage(), Icons.check_box_outlined),
          _tile(context, 'Switch', const SwitchPage(), Icons.toggle_on_outlined),
          _tile(context, 'Radio', const RadioPage(), Icons.radio_button_checked),
          _tile(context, 'Radio group', const RadioGroupPage(), Icons.radio_button_checked),
          _tile(context, 'Slider', const SliderPage(), Icons.tune),
          _tile(context, 'Text field', const TextFieldPage(), Icons.text_fields),
          _tile(context, 'Text area', const TextAreaPage(), Icons.notes_outlined),
          _tile(context, 'Search field', const SearchFieldPage(), Icons.search),
          _tile(context, 'Select', const SelectPage(), Icons.arrow_drop_down_circle_outlined),
          _tile(context, 'Control field', const ControlFieldPage(), Icons.input),
          _tile(context, 'Input', const InputPage(), Icons.edit_outlined),
          _tile(context, 'Input group', const InputGroupPage(), Icons.view_column),
          _tile(context, 'Input OTP', const InputOtpPage(), Icons.pin_outlined),
          const Divider(height: 1),
          _CategoryHeader('Feedback'),
          _tile(context, 'Spinner', const SpinnerPage(), Icons.hourglass_empty),
          _tile(context, 'Skeleton', const SkeletonPage(), Icons.rectangle_outlined),
          const Divider(height: 1),
          _CategoryHeader('Overlays'),
          _tile(context, 'Dialog', const DialogPage(), Icons.chat_bubble_outline),
          _tile(context, 'Bottom sheet', const BottomSheetPage(), Icons.swipe_up),
          _tile(context, 'Toast', const ToastPage(), Icons.notifications_none),
          _tile(context, 'Menu', const MenuPage(), Icons.menu_open),
          _tile(context, 'Popover', const PopoverPage(), Icons.picture_in_picture_alt_outlined),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _tile(BuildContext context, String name, Widget page, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 22),
      title: Text(name),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _open(context, page),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
