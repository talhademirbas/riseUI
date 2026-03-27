/** Dart snippets — keep in sync with `example/lib/embed/docs_embed_avatar.dart`. */

export const avatarUsageCode = `Wrap(
  spacing: 16,
  children: [
    RiseAvatar(
      image: NetworkImage(kDocsAvatarSampleImageUrl),
      name: 'Sam Rowe',
    ),
    const RiseAvatar(
      name: 'Alex Griffin',
      color: RiseAvatarColor.accent,
    ),
    RiseAvatar(
      child: ColoredBox(
        color: rise.accent.withValues(alpha: 0.2),
        child: Icon(Icons.person_outline, color: rise.accent),
      ),
    ),
  ],
)`;

export const avatarSizesCode = `const Wrap(
  spacing: 16,
  children: [
    RiseAvatar(
      image: NetworkImage(kDocsAvatarSampleImageUrl),
      name: 'S',
      size: RiseAvatarSize.sm,
    ),
    RiseAvatar(
      image: NetworkImage(kDocsAvatarSampleImageUrl),
      name: 'M',
      size: RiseAvatarSize.md,
    ),
    RiseAvatar(
      image: NetworkImage(kDocsAvatarSampleImageUrl),
      name: 'L',
      size: RiseAvatarSize.lg,
    ),
  ],
)`;

export const avatarColorsCode = `const Wrap(
  spacing: 12,
  children: [
    RiseAvatar(name: 'AG', color: RiseAvatarColor.standard),
    RiseAvatar(name: 'AG', color: RiseAvatarColor.accent),
    RiseAvatar(name: 'AG', color: RiseAvatarColor.success),
    RiseAvatar(name: 'AG', color: RiseAvatarColor.warning),
    RiseAvatar(name: 'AG', color: RiseAvatarColor.danger),
  ],
)`;

export const avatarVariantsCode = `Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Solid'),
    Wrap(
      spacing: 12,
      children: [
        for (final c in RiseAvatarColor.values)
          RiseAvatar(
            name: 'AG',
            color: c,
            variant: RiseAvatarVariant.solid,
          ),
      ],
    ),
    Text('Soft'),
    Wrap(
      spacing: 12,
      children: [
        for (final c in RiseAvatarColor.values)
          RiseAvatar(
            name: 'AG',
            color: c,
            variant: RiseAvatarVariant.soft,
          ),
      ],
    ),
  ],
)`;

export const avatarFallbackCode = `const RiseAvatar(
  image: NetworkImage('https://example.invalid/no-image.png'),
  name: 'Jamie Doe',
  color: RiseAvatarColor.accent,
)`;

export const avatarGroupCode = `RiseAvatarGroup(
  children: [
    RiseAvatar(
      image: NetworkImage(kDocsAvatarSampleImageUrl),
      name: 'A',
    ),
    const RiseAvatar(name: 'Bo Chen', color: RiseAvatarColor.success),
    RiseAvatar(
      image: NetworkImage('https://picsum.photos/seed/rise-avatar-b/200'),
      name: 'C',
    ),
    const RiseAvatar(name: 'Dana Lee', color: RiseAvatarColor.warning),
  ],
)`;

export const avatarCustomStylesCode = `RiseAvatar(
  color: RiseAvatarColor.accent,
  variant: RiseAvatarVariant.soft,
  child: Icon(Icons.auto_awesome, color: rise.accent),
)`;
