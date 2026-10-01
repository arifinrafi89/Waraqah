import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/payment_method.dart';
import '../providers/checkout_providers.dart';
import 'checkout_labels.dart';
import 'choice_tile.dart';

/// Step 3: bKash, Nagad, cash on delivery or card. Cash on delivery is off
/// when there's nothing to deliver (eBooks only).
class PaymentPicker extends ConsumerWidget {
  const PaymentPicker({super.key});

  static const _icons = {
    PaymentMethod.bkash: Icons.phone_iphone_rounded,
    PaymentMethod.nagad: Icons.phone_android_rounded,
    PaymentMethod.cashOnDelivery: Icons.payments_outlined,
    PaymentMethod.card: Icons.credit_card_rounded,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final chosen = ref.watch(paymentMethodProvider);
    final needsDelivery =
        ref.watch(checkoutTotalsProvider)?.needsDelivery ?? true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.sm,
      children: [
        for (final method in PaymentMethod.values)
          ChoiceTile(
            key: ValueKey(method),
            icon: _icons[method]!,
            title: l10n.paymentName(method),
            subtitle: method == PaymentMethod.cashOnDelivery && !needsDelivery
                ? l10n.checkoutCodUnavailable
                : l10n.paymentNote(method),
            isSelected: method == chosen,
            onTap: method == PaymentMethod.cashOnDelivery && !needsDelivery
                ? null
                : () => ref.read(paymentMethodProvider.notifier).select(method),
          ),
        Text(
          l10n.checkoutDemoNote,
          style: AppFonts.ui(size: 11, color: context.palette.textFaint),
        ),
      ],
    );
  }
}
