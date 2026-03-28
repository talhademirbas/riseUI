/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_avatar.dart`. */

const _chat = "https://img.heroui.chat/image/avatar?w=400&h=400&u=";

export const avatarUsageCode = `Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Column(
      children: [
        RiseAvatar(name: 'PG'),
        RiseAvatar(name: 'JR'),
        RiseAvatar(
          child: Icon(Icons.person_outline, size: RiseAvatar.iconSizeFor(RiseAvatarSize.md)),
        ),
      ],
    ),
    // + chat portraits + heroui-assets columns — see docs embed
  ],
)`;

export const avatarWithDelayCode = `// After 300ms timer — same portrait as Hero \`WithDelay\`
RiseAvatar(
  image: NetworkImage('${_chat}3'),
  name: 'John',
)`;

export const avatarSizesCode = `Wrap(
  spacing: 16,
  children: [
    RiseAvatar(
      image: NetworkImage('${_chat}3'),
      name: 'SM',
      size: RiseAvatarSize.sm,
    ),
    RiseAvatar(
      image: NetworkImage('${_chat}4'),
      name: 'MD',
      size: RiseAvatarSize.md,
    ),
    RiseAvatar(
      image: NetworkImage('${_chat}5'),
      name: 'LG',
      size: RiseAvatarSize.lg,
    ),
  ],
)`;

export const avatarColorsCode = `Wrap(
  spacing: 16,
  children: [
    RiseAvatar(name: 'DF', color: RiseAvatarColor.standard),
    RiseAvatar(name: 'AC', color: RiseAvatarColor.accent),
    RiseAvatar(name: 'SC', color: RiseAvatarColor.success),
    RiseAvatar(name: 'WR', color: RiseAvatarColor.warning),
    RiseAvatar(name: 'DG', color: RiseAvatarColor.danger),
  ],
)`;

export const avatarVariantsCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RiseSeparator(tone: RiseSeparatorTone.default_),
    Row(
      children: [
        RiseAvatar(name: 'AG', color: RiseAvatarColor.accent),
        // … kHeroAvatarColorColumnOrder × letter | soft | icon | img rows
      ],
    ),
  ],
)`;

export const avatarFallbackCode = `Wrap(
  spacing: 16,
  children: [
    RiseAvatar(name: 'JD'),
    RiseAvatar(
      child: Icon(Icons.person_outline, size: RiseAvatar.iconSizeFor(RiseAvatarSize.md)),
    ),
    RiseAvatar(
      image: NetworkImage('https://invalid-url-to-show-fallback.com/image.jpg'),
      name: 'NA',
    ),
  ],
)`;

export const avatarGroupCode = `RiseAvatarGroup(
  children: [
    RiseAvatar(image: NetworkImage('${_chat}3'), name: 'J'),
    RiseAvatar(image: NetworkImage('${_chat}5'), name: 'K'),
    const RiseAvatar(name: '+5', color: RiseAvatarColor.standard),
  ],
)`;

export const avatarCustomStylesCode = `RiseAvatar(
  color: RiseAvatarColor.accent,
  variant: RiseAvatarVariant.soft,
  child: Icon(Icons.auto_awesome, color: rise.accent),
)`;
