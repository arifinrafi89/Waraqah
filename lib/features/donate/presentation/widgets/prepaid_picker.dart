import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../../../checkout/presentation/widgets/checkout_labels.dart';

/// "Payment" with bKash, Nagad and Card: the ways to pay now. Donations
/// can't be cash on delivery, since the recipient would be asked to pay.
class PrepaidPicker extends StatelessWidget {
  const PrepaidPicker({
    super.key,
    required this.value,
    required this.onChanged,
  });

  static const methods = [
    PaymentMethod.bkash,
    PaymentMethod.nagad,
    PaymentMethod.card,
  ];

  final PaymentMethod value;
  final ValueChanged<PaymentMethod> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.sm,
      children: [
        Text(
          l10n.checkoutStepPayment,
          style: AppFonts.ui(size: 12, color: context.palette.textDim),
        ),
        Wrap(
          spacing: Insets.sm,
          children: [
            for (final method in methods)
              ChoiceChip(
                label: Text(l10n.paymentName(method)),
                selected: value == method,
                onSelected: (_) => onChanged(method),
              ),
          ],
        ),
      ],
    );
  }
}
