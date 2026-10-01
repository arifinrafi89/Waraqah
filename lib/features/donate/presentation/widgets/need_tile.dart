import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/recipient.dart';
import 'donate_sheet.dart';

/// One book a place asked for: how many have come in, the price of a copy,
/// and Donate (guests log in first). Says so once they have enough.
class NeedTile extends ConsumerWidget {
  const NeedTile({super.key, required this.recipient, required this.need});

  final Recipient recipient;
  final RecipientNeed need;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final book = need.book;
    final faint = AppFonts.ui(size: 11, color: palette.textFaint);
    return SurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        spacing: Insets.md,
        children: [
          SizedBox(
            width: Sizes.listThumbWidth,
            child: CoverArt(
              title: book.coverLabel,
              seed: book.coverSeed,
              aspectRatio: Sizes.listThumbWidth / Sizes.listThumbHeight,
              fontSize: 8.5,
              radius: 10,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.texts.titleSmall,
                ),
                Text(book.author, style: faint),
                Text(
                  l10n.giftDonateNeedProgress(need.received, need.wanted),
                  style: AppFonts.ui(
                    size: 11,
                    weight: FontWeight.w700,
                    color: need.isMet ? palette.textFaint : palette.accent,
                  ),
                ),
                Text(
                  l10n.giftDonatePerCopy(Bdt.format(need.priceBdt)),
                  style: faint,
                ),
              ],
            ),
          ),
          if (need.isMet)
            Text(l10n.giftDonateMet, style: faint)
          else
            FilledButton(
              onPressed: () => ref.read(sessionProvider) == null
                  ? context.push(AuthRoutes.login)
                  : showDonateSheet(context, recipient, need),
              child: Text(l10n.giftDonateAction),
            ),
        ],
      ),
    );
  }
}
