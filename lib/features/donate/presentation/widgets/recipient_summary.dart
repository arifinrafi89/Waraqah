import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/recipient.dart';

/// Name with a Verified badge, what kind of place and where, and how many
/// of the books they asked for have come in.
class RecipientSummary extends StatelessWidget {
  const RecipientSummary({super.key, required this.recipient});

  final Recipient recipient;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final wanted = recipient.booksWanted;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(recipient.name, style: context.texts.titleMedium),
        Row(
          spacing: 6,
          children: [
            Icon(Icons.verified_rounded, size: 16, color: palette.accent),
            Text(
              l10n.giftDonateVerified,
              style: AppFonts.ui(
                size: 11.5,
                weight: FontWeight.w700,
                color: palette.accent,
              ),
            ),
            Expanded(
              child: Text(
                '${l10n.giftDonateKind(recipient.kind.name)} · '
                '${recipient.area}, ${recipient.district}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.ui(size: 11.5, color: palette.textFaint),
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(Radii.sm),
          child: LinearProgressIndicator(
            value: wanted == 0 ? 1 : recipient.booksReceived / wanted,
            minHeight: 6,
            color: palette.accent,
            backgroundColor: palette.accentSoft,
          ),
        ),
        Text(
          l10n.giftDonateProgress(recipient.booksReceived, wanted),
          style: AppFonts.ui(size: 11.5, color: palette.textDim),
        ),
      ],
    );
  }
}
