import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite.dart';
import 'bite_feed_parts.dart';

class BiteFeedCard extends StatelessWidget {
  const BiteFeedCard({
    super.key,
    required this.bite,
    required this.onLike,
    this.onComments,
    this.onShare,
    this.onEdit,
    this.onDelete,
    this.isSpoiler = false,
    this.spoilerRevealed = false,
    this.onRevealSpoiler,
  });

  final Bite bite;
  final VoidCallback onLike;
  final VoidCallback? onComments;
  final VoidCallback? onShare;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool isSpoiler;
  final bool spoilerRevealed;
  final VoidCallback? onRevealSpoiler;

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
                if (onEdit != null || onDelete != null)
                  PopupMenuButton<String>(
                    onSelected: (action) {
                      if (action == 'edit') onEdit?.call();
                      if (action == 'delete') onDelete?.call();
                    },
                    itemBuilder: (context) => [
                      if (onEdit != null)
                        PopupMenuItem(
                          value: 'edit',
                          child: Text(l10n.bitesEdit),
                        ),
                      if (onDelete != null)
                        PopupMenuItem(
                          value: 'delete',
                          child: Text(l10n.bitesDelete),
                        ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: Insets.md),
            GestureDetector(
              onTap: isSpoiler && !spoilerRevealed ? onRevealSpoiler : null,
              child: isSpoiler && !spoilerRevealed
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        ImageFiltered(
                          imageFilter: ui.ImageFilter.blur(
                            sigmaX: 7,
                            sigmaY: 7,
                          ),
                          child: Text(
                            bite.text,
                            style: AppFonts.ui(
                              size: 15,
                              height: 1.5,
                              color: palette.textDim,
                            ),
                          ),
                        ),
                        Text(
                          l10n.bitesSpoilerTap,
                          style: AppFonts.ui(
                            size: 12,
                            weight: FontWeight.w800,
                            color: palette.accent,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      bite.text,
                      style: AppFonts.ui(
                        size: 15,
                        height: 1.5,
                        color: palette.textDim,
                      ),
                    ),
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
                  onTap: onComments,
                ),
                BiteAction(
                  icon: Icons.share_outlined,
                  count: 0,
                  label: l10n.bitesShare,
                  onTap: onShare,
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
