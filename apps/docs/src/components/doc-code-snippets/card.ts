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
RiseCard(variant: RiseCardVariant.standard, child: …)
RiseCard(variant: RiseCardVariant.secondary, child: …)
RiseCard(variant: RiseCardVariant.tertiary, child: …)`;

export const cardHorizontalCode = `RiseCard(
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // leading media
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RiseCardTitle(child: Text('Heading')),
            RiseCardDescription(child: Text('…')),
            RiseCardFooter(child: RiseButton(…)),
          ],
        ),
      ),
    ],
  ),
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
