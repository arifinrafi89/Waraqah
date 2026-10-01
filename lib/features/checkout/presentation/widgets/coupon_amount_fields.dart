import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/segmented_selector.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/coupon.dart';

/// The deal part of the New coupon form: % off (with an optional cap),
/// taka off, or free delivery, plus the minimum order.
class CouponAmountFields extends StatelessWidget {
  const CouponAmountFields({
    super.key,
    required this.kind,
    required this.onKindChanged,
    required this.value,
    required this.cap,
    required this.minOrder,
  });

  final CouponKind kind;
  final ValueChanged<CouponKind> onKindChanged;
  final TextEditingController value;
  final TextEditingController cap;
  final TextEditingController minOrder;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    AppTextField number(TextEditingController c, String label) => AppTextField(
      label: label,
      hint: '0',
      controller: c,
      keyboardType: TextInputType.number,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        SegmentedSelector<CouponKind>(
          options: CouponKind.values,
          labels: [
            l10n.adminOrderCouponKindPercent,
            l10n.adminOrderCouponKindAmount,
            l10n.checkoutFreeDelivery,
          ],
          value: kind,
          onChanged: onKindChanged,
        ),
        if (kind == CouponKind.percentOff) ...[
          number(value, l10n.adminOrderCouponPercent),
          number(cap, l10n.adminOrderCouponCap),
        ],
        if (kind == CouponKind.amountOff)
          number(value, l10n.adminOrderCouponTaka),
        number(minOrder, l10n.adminOrderCouponMinOrder),
      ],
    );
  }
}
