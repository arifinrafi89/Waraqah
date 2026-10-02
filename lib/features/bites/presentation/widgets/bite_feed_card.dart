import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../report/domain/entities/content_report.dart';
import '../../../report/presentation/widgets/report_icon_button.dart';
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
                '#${bite.bookTitle}',
                style: AppFonts.ui(
                  size: 13,
                  weight: FontWeight.w700,
                  color: palette.accent,
                ),
              ),
            ],
            const SizedBox(height: Insets.md),
            Row(
              children: [
                BiteAction(
                  icon: Icons.chat_bubble_outline_rounded,
                  count: bite.comments,
                  label: l10n.bitesReply,
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
                ReportIconButton(
                  target: ReportTarget(
                    kind: ReportTargetKind.bite,
                    id: bite.id,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
