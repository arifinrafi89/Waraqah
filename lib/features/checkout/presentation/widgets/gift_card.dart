import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/checkout_providers.dart';
import '../providers/gift_providers.dart';
import 'gift_fields.dart';

/// "Send as a gift" with a switch; once on, who it's for, the card and gift
/// wrap. Only for orders that get delivered.
class GiftCard extends ConsumerWidget {
  const GiftCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final totals = ref.watch(checkoutTotalsProvider);
    if (totals == null || !totals.needsDelivery) return const SizedBox.shrink();
    final gift = ref.watch(giftProvider);
    final notifier = ref.read(giftProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SurfaceCard(
        padding: const EdgeInsets.fromLTRB(
          Insets.md,
          Insets.sm,
          Insets.sm,
          Insets.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              spacing: Insets.md,
              children: [
                Icon(Icons.card_giftcard_rounded, color: palette.accent),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.checkoutGiftTitle,
                        style: context.texts.titleSmall,
                      ),
                      Text(
                        l10n.checkoutGiftNote,
                        style: AppFonts.ui(
                          size: 11.5,
                          color: palette.textFaint,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: gift != null,
                  onChanged: (on) => on ? notifier.start() : notifier.clear(),
                ),
              ],
            ),
            if (gift != null) GiftFields(gift: gift),
          ],
        ),
      ),
    );
  }
}
