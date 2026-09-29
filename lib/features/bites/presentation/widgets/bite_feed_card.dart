import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite.dart';
import 'bite_feed_parts.dart';

class BiteFeedCard extends StatelessWidget {
  const BiteFeedCard({super.key, required this.bite, required this.onLike});

  final Bite bite;
  final VoidCallback onLike;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Card(
      margin: const EdgeInsets.only(bottom: Insets.md),
      child: Padding(
        padding: const EdgeInsets.all(Insets.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BiteAvatar(bite: bite, palette: palette),
                const SizedBox(width: Insets.md),
                Expanded(
                  child: BiteAuthorLine(bite: bite, palette: palette),
                ),
              ],
            ),
            const SizedBox(height: Insets.md),
            Text(
              bite.text,
              style: AppFonts.ui(size: 15, height: 1.5, color: palette.textDim),
            ),
            if (bite.hasBookTag) ...[
              const SizedBox(height: Insets.sm),
              Text(
                '#${bite.taggedBookTitle}',
                style: AppFonts.ui(
                  size: 13,
                  weight: FontWeight.w700,
                  color: palette.accent,
                ),
              ),
            ],
            if (bite.imageUrl != null) ...[
              const SizedBox(height: Insets.md),
              ClipRRect(
                borderRadius: BorderRadius.circular(Radii.md),
                child: AspectRatio(
                  aspectRatio: 1.9,
                  child: Image.network(
                    bite.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) =>
                        ColoredBox(color: palette.surface2),
                  ),
                ),
              ),
            ],
            const SizedBox(height: Insets.md),
            Row(
              children: [
                BiteAction(
                  icon: Icons.chat_bubble_outline_rounded,
                  count: bite.replies,
                  label: l10n.bitesReply,
                ),
                BiteAction(
                  icon: Icons.repeat_rounded,
                  count: bite.reposts,
                  label: l10n.bitesRepost,
                ),
                BiteAction(
                  icon: bite.liked
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  count: bite.likes,
                  label: l10n.bitesLike,
                  active: bite.liked,
                  onTap: onLike,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
