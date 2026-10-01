import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../../../checkout/presentation/widgets/checkout_labels.dart';

/// bKash, Nagad or card. No cash on delivery: Waraqah holds the money.
class PrepaidPicker extends StatelessWidget {
  const PrepaidPicker({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final PaymentMethod value;
  final ValueChanged<PaymentMethod> onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.sm,
      children: [
        Wrap(
          spacing: Insets.sm,
          runSpacing: Insets.sm,
          children: [
            for (final method in PaymentMethod.values)
              if (method.isPrepaid)
                ChoiceChip(
                  label: Text(l10n.paymentName(method)),
                  selected: method == value,
                  onSelected: (_) => onChanged(method),
                ),
          ],
        ),
        Text(
          l10n.usedBuyNoCod,
          style: AppFonts.ui(size: 11.5, color: palette.textFaint),
        ),
      ],
    );
  }
}
