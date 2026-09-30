import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/coupon.dart';
import 'checkout_labels.dart';

/// One coupon for staff: the code, what it gives, and until when. Expired
/// ones are marked in red.
class CouponTile extends StatelessWidget {
  const CouponTile({super.key, required this.coupon});

  final Coupon coupon;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final expired = coupon.isExpiredAt(DateTime.now());
    final expiry = coupon.expiresAt;
    final locale = Localizations.localeOf(context).toLanguageTag();
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Row(
        spacing: Insets.md,
        children: [
          Icon(
            Icons.local_offer_outlined,
            color: expired ? palette.textFaint : palette.accent,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  coupon.code,
                  style: AppFonts.numeric(size: 14, color: palette.text),
                ),
                Text(
                  l10n.couponSummary(coupon),
                  style: AppFonts.ui(size: 12, color: palette.textDim),
                ),
                Text(
                  expired
                      ? l10n.adminOrderCouponExpired
                      : expiry == null
                      ? l10n.adminOrderCouponNoEnd
                      : l10n.adminOrderCouponUntil(
                          DateFormat.yMMMd(locale).format(expiry),
                        ),
                  style: AppFonts.ui(
                    size: 11.5,
                    weight: expired ? FontWeight.w700 : FontWeight.w600,
                    color: expired ? palette.danger : palette.textFaint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
