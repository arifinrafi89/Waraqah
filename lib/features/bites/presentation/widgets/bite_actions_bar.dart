import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../report/domain/entities/content_report.dart';
import '../../../report/presentation/widgets/report_icon_button.dart';
import '../../domain/entities/bite.dart';
import 'bite_actions.dart';
import 'bite_feed_parts.dart';

/// Like (count), comments (count) and share; a flag on others' Bites.
class BiteActionsBar extends ConsumerWidget {
  const BiteActionsBar({super.key, required this.bite, this.onComments});

  final Bite bite;

  /// Opens the comments; `null` on the detail page itself.
  final VoidCallback? onComments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Row(
      children: [
        BiteAction(
          icon: bite.liked
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          count: bite.likes,
          label: l10n.bitesLike,
          active: bite.liked,
          onTap: () => ref.likeBite(context, bite),
        ),
        BiteAction(
          icon: Icons.chat_bubble_outline_rounded,
          count: bite.comments,
          label: l10n.bitesComments,
          onTap: onComments,
        ),
        BiteAction(
          icon: Icons.ios_share_rounded,
          label: l10n.bitesShare,
          onTap: () => ref.shareBite(context, bite),
        ),
        if (bite.isMine)
          const SizedBox(width: 48)
        else
          ReportIconButton(
            target: ReportTarget(kind: ReportTargetKind.bite, id: bite.id),
          ),
      ],
    );
  }
}
