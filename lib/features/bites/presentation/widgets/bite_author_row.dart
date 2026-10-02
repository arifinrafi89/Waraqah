import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bite.dart';
import 'bite_feed_parts.dart';
import 'bite_menu.dart';
import 'bite_time.dart';

/// Avatar, name, "area · 3h · edited" and the ⋮ menu.
class BiteAuthorRow extends StatelessWidget {
  const BiteAuthorRow({super.key, required this.bite});

  final Bite bite;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final meta = [
      if (bite.authorArea.isNotEmpty) bite.authorArea,
      context.biteAgo(bite.createdAt),
      if (bite.editedAt != null) l10n.bitesEdited,
    ].join(' · ');
    return Row(
      children: [
        ReaderAvatar(readerId: bite.authorId, name: bite.authorName),
        const SizedBox(width: Insets.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bite.isMine ? l10n.bitesYou : bite.authorName,
                style: AppFonts.ui(
                  size: 14,
                  weight: FontWeight.w800,
                  color: palette.text,
                ),
              ),
              Text(
                meta,
                style: AppFonts.ui(size: 11, color: palette.textFaint),
              ),
            ],
          ),
        ),
        BiteMenu(bite: bite),
      ],
    );
  }
}
