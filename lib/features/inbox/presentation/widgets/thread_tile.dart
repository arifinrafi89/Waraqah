import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/inbox_thread.dart';
import '../../inbox_routes.dart';
import 'inbox_labels.dart';

/// One conversation in the inbox: the book, who it's with, whether the
/// reader is buying or selling, the latest message, and how many are new.
class ThreadTile extends StatelessWidget {
  const ThreadTile({super.key, required this.thread});

  final InboxThread thread;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final isNew = thread.unread > 0;
    final last = thread.lastMessage;
    return SurfaceCard(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => context.push(InboxRoutes.threadFor(thread.id)),
        borderRadius: BorderRadius.circular(Radii.sm),
        child: Row(
          spacing: Insets.md,
          children: [
            SizedBox(
              width: 40,
              child: CoverArt(
                title: thread.listing.title,
                seed: thread.listing.coverSeed,
                aspectRatio: 2 / 3,
                fontSize: 6,
                radius: 6,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    '${thread.otherName} · '
                    '${thread.isBuying ? l10n.inboxBuying : l10n.inboxSelling}',
                    style: AppFonts.ui(
                      size: 13,
                      weight: isNew ? FontWeight.w800 : FontWeight.w600,
                      color: palette.text,
                    ),
                  ),
                  Text(
                    thread.listing.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.ui(size: 11, color: palette.textFaint),
                  ),
                  Text(
                    l10n.preview(thread),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.ui(
                      size: 12,
                      color: isNew ? palette.text : palette.textDim,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 6,
              children: [
                if (last != null)
                  Text(
                    messageTime(context, last.at),
                    style: AppFonts.ui(size: 10.5, color: palette.textFaint),
                  ),
                if (isNew) _Count(count: thread.unread),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Count extends StatelessWidget {
  const _Count({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(
      color: context.palette.accent,
      borderRadius: BorderRadius.circular(Radii.pill),
    ),
    child: Text(
      '$count',
      style: AppFonts.ui(
        size: 10.5,
        weight: FontWeight.w800,
        color: context.palette.accentInk,
      ),
    ),
  );
}
