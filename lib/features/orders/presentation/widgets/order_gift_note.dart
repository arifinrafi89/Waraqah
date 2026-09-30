import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/domain/entities/gift.dart';

/// "Gift for Nabila", the card's message and whether it's wrapped. For
/// staff it also says how to pack it.
class OrderGiftNote extends StatelessWidget {
  const OrderGiftNote({super.key, required this.gift, this.forStaff = false});

  final Gift gift;
  final bool forStaff;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final faint = AppFonts.ui(size: 11.5, color: palette.textFaint);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Icon(Icons.card_giftcard_rounded, size: 20, color: palette.accent),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(
                l10n.orderGiftFor(gift.recipientName),
                style: context.texts.titleSmall,
              ),
              if (gift.message.isNotEmpty)
                Text(
                  '“${gift.message}”',
                  style: AppFonts.ui(size: 12.5, color: palette.textDim),
                ),
              if (forStaff)
                Text(
                  gift.wrapped
                      ? l10n.adminOrderGiftWrap
                      : l10n.adminOrderGiftPack,
                  style: AppFonts.ui(size: 11.5, color: palette.accent),
                )
              else if (gift.wrapped)
                Text(l10n.orderGiftWrapped, style: faint),
            ],
          ),
        ),
      ],
    );
  }
}
