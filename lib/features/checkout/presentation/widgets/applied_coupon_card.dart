import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/coupon.dart';
import '../providers/checkout_providers.dart';

/// "EID100 applied · You save ৳100", with a button to take it off. If the
/// cart has since dropped below the code's minimum, it says so instead.
class AppliedCouponCard extends ConsumerWidget {
  const AppliedCouponCard({super.key, required this.coupon});

  final Coupon coupon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final discount = ref.watch(checkoutTotalsProvider)?.couponDiscountBdt ?? 0;
    return SurfaceCard(
      padding: const EdgeInsets.fromLTRB(Insets.md, 6, 4, 6),
      child: Row(
        spacing: Insets.md,
        children: [
          Icon(Icons.local_offer_rounded, color: palette.accent, size: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.checkoutCouponApplied(coupon.code),
                  style: context.texts.titleSmall,
                ),
                Text(
                  discount > 0
                      ? l10n.cartYouSave(Bdt.format(discount))
                      : l10n.checkoutCouponMinimum(
                          Bdt.format(coupon.minOrderBdt),
                        ),
                  style: AppFonts.ui(
                    size: 11.5,
                    weight: FontWeight.w700,
                    color: discount > 0 ? palette.accent : palette.danger,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: l10n.checkoutRemoveCoupon,
            icon: const Icon(Icons.close_rounded, size: 18),
            color: palette.textDim,
            onPressed: () => ref.read(couponProvider.notifier).remove(),
          ),
        ],
      ),
    );
  }
}
