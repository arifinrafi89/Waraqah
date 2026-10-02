import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite.dart';
import 'bite_comment_tile.dart';

/// Top comments, oldest first, each with its replies indented below.
class BiteCommentList extends StatelessWidget {
  const BiteCommentList({
    super.key,
    required this.comments,
    required this.onReply,
  });

  final List<BiteComment> comments;
  final ValueChanged<BiteComment> onReply;

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: Insets.xl),
        child: Text(
          AppL10n.of(context)!.bitesNoComments,
          textAlign: TextAlign.center,
          style: AppFonts.ui(size: 13, color: context.palette.textFaint),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final top in comments) ...[
          BiteCommentTile(comment: top, onReply: () => onReply(top)),
          for (final reply in top.replies)
            Padding(
              padding: const EdgeInsets.only(left: Insets.xl * 2),
              child: BiteCommentTile(comment: reply),
            ),
        ],
      ],
    );
  }
}
