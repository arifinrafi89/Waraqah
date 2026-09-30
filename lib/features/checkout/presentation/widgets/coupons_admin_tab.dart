import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/coupon_admin_providers.dart';
import 'coupon_tile.dart';
import 'new_coupon_sheet.dart';

/// The Coupons tab in the Admin area's Orders section: a New coupon button
/// and every coupon, newest first.
class CouponsAdminTab extends ConsumerWidget {
  const CouponsAdminTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return AsyncView(
      value: ref.watch(couponsProvider),
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: () => ref.invalidate(couponsProvider),
      skeleton: const Padding(
        padding: EdgeInsets.all(Insets.screen),
        child: Column(
          spacing: 10,
          children: [
            ShimmerBox(height: 48, radius: Radii.md),
            ShimmerBox(height: 76, radius: Radii.card),
            ShimmerBox(height: 76, radius: Radii.card),
          ],
        ),
      ),
      builder: (coupons) => ListView(
        padding: const EdgeInsets.all(Insets.screen),
        children: [
          PrimaryButton(
            label: l10n.adminOrderNewCoupon,
            icon: Icons.add_rounded,
            onPressed: () => _newCoupon(context),
          ),
          const SizedBox(height: Insets.md),
          for (final coupon in coupons)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CouponTile(key: ValueKey(coupon.code), coupon: coupon),
            ),
        ],
      ),
    );
  }

  /// Opens the form; says "Coupon created" once it's saved.
  Future<void> _newCoupon(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final created = AppL10n.of(context)!.adminOrderCouponCreated;
    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const NewCouponForm(),
    );
    if (saved == true) {
      messenger.showSnackBar(SnackBar(content: Text(created)));
    }
  }
}
