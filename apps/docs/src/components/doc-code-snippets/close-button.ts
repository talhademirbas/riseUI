/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_close_button.dart`. */

export const closeButtonUsageCode = `RiseCloseButton(
  onPressed: () {},
)`;

export const closeButtonWithCustomIconCode = `Wrap(
  spacing: 16,
  runSpacing: 16,
  children: [
    RiseCloseButton(
      onPressed: () {},
      child: Icon(Icons.close, size: 20),
    ),
    RiseCloseButton(
      onPressed: () {},
      child: Icon(Icons.highlight_off_outlined, size: 20),
    ),
  ],
)`;

export const closeButtonInteractiveCode = `class CloseDemo extends StatefulWidget {
  @override
  State<CloseDemo> createState() => _CloseDemoState();
}

class _CloseDemoState extends State<CloseDemo> {
  int clicks = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Clicked: \$clicks times'),
        SizedBox(height: 16),
        RiseCloseButton(
          onPressed: () => setState(() => clicks++),
        ),
      ],
    );
  }
}`;
