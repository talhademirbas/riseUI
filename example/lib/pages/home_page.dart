import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

import 'demos/accordion_page.dart';
import 'demos/alert_page.dart';
import 'demos/avatar_page.dart';
import 'demos/button_page.dart';
import 'demos/card_page.dart';
import 'demos/checkbox_page.dart';
import 'demos/chip_page.dart';
import 'demos/close_button_page.dart';
import 'demos/description_page.dart';
import 'demos/field_error_page.dart';
import 'demos/label_page.dart';
import 'demos/list_group_page.dart';
import 'demos/input_group_page.dart';
import 'demos/input_page.dart';
import 'demos/input_otp_page.dart';
import 'demos/popover_page.dart';
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

/// Root catalog — one screen per component to keep builds light.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));
  }

  static const List<_CatalogSection> _sections = [
    _CatalogSection(
      title: 'Buttons',
      entries: [
        _CatalogEntry(label: 'Button', page: ButtonPage(), icon: Icons.smart_button_outlined),
        _CatalogEntry(label: 'Close button', page: CloseButtonPage(), icon: Icons.close),
      ],
    ),
    _CatalogSection(
      title: 'Layout',
      entries: [
        _CatalogEntry(label: 'Card', page: CardPage(), icon: Icons.credit_card_outlined),
        _CatalogEntry(label: 'Separator', page: SeparatorPage(), icon: Icons.horizontal_rule),
        _CatalogEntry(label: 'Surface', page: SurfacePage(), icon: Icons.layers_outlined),
      ],
    ),
    _CatalogSection(
      title: 'Navigation',
      entries: [
        _CatalogEntry(label: 'Accordion', page: AccordionPage(), icon: Icons.expand_more),
        _CatalogEntry(label: 'List group', page: ListGroupPage(), icon: Icons.list_alt_outlined),
        _CatalogEntry(label: 'Tabs', page: TabsPage(), icon: Icons.tab),
      ],
    ),
    _CatalogSection(
      title: 'Media',
      entries: [
        _CatalogEntry(label: 'Avatar', page: AvatarPage(), icon: Icons.account_circle_outlined),
      ],
    ),
    _CatalogSection(
      title: 'Data Display',
      entries: [
        _CatalogEntry(label: 'Chip', page: ChipPage(), icon: Icons.label_outline),
      ],
    ),
    _CatalogSection(
      title: 'Utilities',
      entries: [
        _CatalogEntry(label: 'Scroll shadow', page: ScrollShadowPage(), icon: Icons.gradient),
      ],
    ),
    _CatalogSection(
      title: 'Collections',
      entries: [
        _CatalogEntry(label: 'Tag group', page: TagGroupPage(), icon: Icons.local_offer_outlined),
      ],
    ),
    _CatalogSection(
      title: 'Controls',
      entries: [
        _CatalogEntry(label: 'Switch', page: SwitchPage(), icon: Icons.toggle_on_outlined),
        _CatalogEntry(label: 'Slider', page: SliderPage(), icon: Icons.tune),
      ],
    ),
    _CatalogSection(
      title: 'Forms',
      entries: [
        _CatalogEntry(label: 'Checkbox', page: CheckboxPage(), icon: Icons.check_box_outlined),
        _CatalogEntry(label: 'Description', page: DescriptionPage(), icon: Icons.notes_outlined),
        _CatalogEntry(label: 'Field error', page: FieldErrorPage(), icon: Icons.error_outline),
        _CatalogEntry(label: 'Input', page: InputPage(), icon: Icons.edit_outlined),
        _CatalogEntry(label: 'Input group', page: InputGroupPage(), icon: Icons.view_column),
        _CatalogEntry(label: 'Input OTP', page: InputOtpPage(), icon: Icons.pin_outlined),
        _CatalogEntry(label: 'Label', page: LabelPage(), icon: Icons.label_outline),
        _CatalogEntry(label: 'Radio group', page: RadioGroupPage(), icon: Icons.radio_button_checked),
        _CatalogEntry(label: 'Search field', page: SearchFieldPage(), icon: Icons.search),
        _CatalogEntry(label: 'Select', page: SelectPage(), icon: Icons.arrow_drop_down_circle_outlined),
        _CatalogEntry(label: 'Text area', page: TextAreaPage(), icon: Icons.notes_outlined),
        _CatalogEntry(label: 'Text field', page: TextFieldPage(), icon: Icons.text_fields),
      ],
    ),
    _CatalogSection(
      title: 'Feedback',
      entries: [
        _CatalogEntry(label: 'Alert', page: AlertPage(), icon: Icons.info_outline),
        _CatalogEntry(label: 'Skeleton', page: SkeletonPage(), icon: Icons.rectangle_outlined),
        _CatalogEntry(label: 'Spinner', page: SpinnerPage(), icon: Icons.hourglass_empty),
      ],
    ),
    _CatalogSection(
      title: 'Overlays',
      entries: [
        _CatalogEntry(label: 'Popover', page: PopoverPage(), icon: Icons.picture_in_picture_alt_outlined),
        _CatalogEntry(label: 'Toast', page: ToastPage(), icon: Icons.notifications_none),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;

    return Scaffold(
      backgroundColor: rise.background,
      appBar: AppBar(
        title: Text(
          'RiseUI examples',
          style: TextStyle(
            color: rise.defaultForeground,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: rise.background,
        foregroundColor: rise.defaultForeground,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: RiseScrollShadow(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            for (var i = 0; i < _sections.length; i++) ...[
              if (i > 0)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: RiseSeparator(tone: RiseSeparatorTone.tertiary),
                ),
              _HomeSection(
                section: _sections[i],
                onOpen: _open,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CatalogEntry {
  const _CatalogEntry({
    required this.label,
    required this.page,
    required this.icon,
  });

  final String label;
  final Widget page;
  final IconData icon;
}

class _CatalogSection {
  const _CatalogSection({
    required this.title,
    required this.entries,
  });

  final String title;
  final List<_CatalogEntry> entries;
}

class _HomeSection extends StatelessWidget {
  const _HomeSection({
    required this.section,
    required this.onOpen,
  });

  final _CatalogSection section;
  final void Function(BuildContext context, Widget page) onOpen;

  @override
  Widget build(BuildContext context) {
    final rise = context.riseTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: RiseLabel.text(
            section.title,
            style: TextStyle(
              fontSize: 12,
              height: 1.2,
              letterSpacing: 0.03,
              fontWeight: FontWeight.w700,
              color: rise.accent,
            ),
          ),
        ),
        RiseListGroup(
          showDividers: true,
          children: [
            for (final e in section.entries)
              RiseListGroupItem(
                onTap: () => onOpen(context, e.page),
                prefix: RiseListGroupItemPrefix(
                  child: Icon(e.icon, size: 22, color: rise.mutedForeground(0.85)),
                ),
                content: RiseListGroupItemContent(
                  child: RiseListGroupItemTitle(e.label),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
