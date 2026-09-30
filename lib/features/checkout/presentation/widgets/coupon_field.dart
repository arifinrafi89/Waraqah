import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/coupon.dart';
import '../providers/checkout_providers.dart';
import 'applied_coupon_card.dart';

/// A coupon code box with Apply. Once a code works it turns into a card
/// with a remove button; a code that doesn't work says why.
class CouponField extends ConsumerStatefulWidget {
  const CouponField({super.key});

  @override
  ConsumerState<CouponField> createState() => _CouponFieldState();
}

class _CouponFieldState extends ConsumerState<CouponField> {
  final _code = TextEditingController();

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final coupon = ref.watch(couponProvider);
    final applied = coupon.value;
    if (applied != null) return AppliedCouponCard(coupon: applied);
    final problem = coupon.error;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        AppTextField(
          hint: l10n.checkoutCouponHint,
          icon: Icons.local_offer_outlined,
          controller: _code,
          trailing: TextButton(
            onPressed: coupon.isLoading
                ? null
                : () => ref.read(couponProvider.notifier).apply(_code.text),
            child: coupon.isLoading
                ? const SizedBox.square(
                    dimension: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l10n.checkoutApply),
          ),
        ),
        if (problem is CouponRejected)
          Text(switch (problem.problem) {
            CouponProblem.notFound => l10n.checkoutCouponNotFound,
            CouponProblem.expired => l10n.checkoutCouponExpired,
            CouponProblem.belowMinimum => l10n.checkoutCouponMinimum(
              Bdt.format(problem.minOrderBdt),
            ),
          }, style: AppFonts.ui(size: 11.5, color: palette.danger)),
      ],
    );
  }
}
