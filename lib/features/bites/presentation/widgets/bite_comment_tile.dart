import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../readers/readers_routes.dart';
import '../../../report/domain/entities/content_report.dart';
import '../../../report/presentation/widgets/report_icon_button.dart';
import '../../domain/entities/bite.dart';
import 'bite_comment_actions.dart';
import 'bite_feed_parts.dart';
import 'bite_time.dart';

/// One comment: avatar, name, time, text and "Reply" (top comments only).
/// Own comments can be deleted; others can be reported.
class BiteCommentTile extends ConsumerWidget {
  const BiteCommentTile({super.key, required this.comment, this.onReply});

  final BiteComment comment;
  final VoidCallback? onReply;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final name = comment.isMine ? l10n.bitesYou : comment.authorName;
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () =>
                context.push(ReadersRoutes.readerFor(comment.authorId)),
            customBorder: const CircleBorder(),
            child: ReaderAvatar(
              readerId: comment.authorId,
              name: name,
              radius: 15,
            ),
          ),
          const SizedBox(width: Insets.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: name,
                    style: AppFonts.ui(
                      size: 13,
                      weight: FontWeight.w800,
                      color: palette.text,
                    ),
                    children: [
                      TextSpan(
                        text: '  ${context.biteAgo(comment.createdAt)}',
                        style: AppFonts.ui(size: 11, color: palette.textFaint),
                      ),
                    ],
                  ),
                ),
                Text(
                  comment.text,
                  style: AppFonts.ui(size: 13.5, color: palette.textDim),
                ),
                if (onReply != null)
                  TextButton(
                    onPressed: onReply,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 32),
                    ),
                    child: Text(l10n.bitesReply),
                  ),
              ],
            ),
          ),
          if (comment.isMine)
            IconButton(
              tooltip: l10n.bitesDeleteComment,
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              onPressed: () => ref.deleteBiteComment(context, comment.id),
            )
          else
            ReportIconButton(
              target: ReportTarget(
                kind: ReportTargetKind.comment,
                id: comment.id,
              ),
            ),
        ],
      ),
    );
  }
}
