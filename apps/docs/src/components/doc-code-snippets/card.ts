/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_card.dart`. */

export const cardUsageCode = `RiseCard(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      RiseCardHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RiseCardTitle(child: Text('Title')),
            RiseCardDescription(child: Text('Description')),
          ],
        ),
      ),
      SizedBox(height: RiseCard.sectionGap),
      RiseCardContent(child: Text('Body')),
      SizedBox(height: RiseCard.sectionGap),
      RiseCardFooter(
        child: RiseButton(
          onPressed: () {},
          label: 'Action',
        ),
      ),
    ],
  ),
)`;

export const cardVariantsCode = `RiseCard(variant: RiseCardVariant.transparent, child: …)
RiseCard(variant: RiseCardVariant.default_, child: …)
RiseCard(variant: RiseCardVariant.secondary, child: …)
RiseCard(variant: RiseCardVariant.tertiary, child: …)`;

export const cardHorizontalCode = `RiseCard(
  child: LayoutBuilder(
    builder: (context, constraints) {
      // Row on wide layouts; Column when constraints.maxWidth < 400
      return Row(…);
    },
  ),
)`;

export const cardWithAvatarCode = `RiseCard(
  child: Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RiseAvatar(name: 'Community', size: RiseAvatarSize.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RiseCardTitle(child: Text('Indie Hackers')),
                RiseCardDescription(child: Text('148 members')),
              ],
            ),
          ),
        ],
      ),
      Row(
        children: [
          RiseAvatar(name: 'Martha', size: RiseAvatarSize.sm),
          Text('By Martha'),
        ],
      ),
    ],
  ),
)`;

export const cardWithImagesCode = `Column(
  children: [
    RiseCard(
      child: Column(
        children: [
          // image / hero block
          RiseCardTitle(child: Text('Become an ACME Creator!')),
          RiseCardFooter(child: RiseButton(label: 'Apply now')),
        ],
      ),
    ),
    Row(
      children: [
        Expanded(child: RiseCard(variant: RiseCardVariant.secondary, child: …)),
        Expanded(child: RiseCard(variant: RiseCardVariant.secondary, child: …)),
      ],
    ),
  ],
)`;

export const cardWithFormCode = `RiseCard(
  child: Column(
    children: [
      RiseCardHeader(
        child: Column(
          children: [
            RiseCardTitle(child: Text('Login')),
            RiseCardDescription(child: Text('…')),
          ],
        ),
      ),
      SizedBox(height: RiseCard.sectionGap),
      RiseCardContent(
        child: Column(
          children: [
            RiseTextField(labelText: 'Email', fullWidth: true),
            RiseTextField(labelText: 'Password', obscureText: true, fullWidth: true),
          ],
        ),
      ),
      RiseCardFooter(child: Row(children: [RiseButton(…)])),
    ],
  ),
)`;
