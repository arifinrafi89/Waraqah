import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../loyalty/domain/entities/loyalty_rules.dart';
import '../../../loyalty/presentation/providers/points_providers.dart';
import '../providers/checkout_providers.dart';

/// "Use 118 points · ৳118 off" with a switch, or, below the minimum, how
/// many points the reader has and when they can use them.
class PointsCard extends ConsumerWidget {
  const PointsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final balance = ref.watch(pointsProvider).value?.balance ?? 0;
    final totals = ref.watch(checkoutTotalsProvider);
    if (totals == null) return const SizedBox.shrink();
    final usable = LoyaltyRules.usable(
      balance: balance,
      booksBdt: totals.subtotalBdt - totals.couponOnBooksBdt,
    );
    return SurfaceCard(
      padding: const EdgeInsets.fromLTRB(
        Insets.md,
        Insets.sm,
        Insets.sm,
        Insets.sm,
      ),
      child: Row(
        spacing: Insets.md,
        children: [
          Icon(Icons.stars_outlined, color: palette.accent),
          Expanded(
            child: usable == 0
                ? Text(
                    l10n.checkoutPointsNotYet(balance),
                    style: AppFonts.ui(size: 12, color: palette.textDim),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.checkoutUsePoints(usable),
                        style: context.texts.titleSmall,
                      ),
                      Text(
                        l10n.checkoutPointsSave(Bdt.format(usable), balance),
                        style: AppFonts.ui(
                          size: 11.5,
                          color: palette.textFaint,
                        ),
                      ),
                    ],
                  ),
          ),
          if (usable > 0)
            Switch(
              value: ref.watch(usePointsProvider),
              onChanged: (use) =>
                  ref.read(usePointsProvider.notifier).select(use),
            ),
        ],
      ),
    );
  }
}
