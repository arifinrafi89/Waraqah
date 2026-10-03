import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/wallet.dart';

/// One line of wallet history: why, which order or book, when, and +/- ৳.
class WalletEntryTile extends StatelessWidget {
  const WalletEntryTile({super.key, required this.entry});

  final WalletEntry entry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final date = DateFormat.yMMMd(
      Localizations.localeOf(context).toLanguageTag(),
    ).format(entry.at);
    final order = entry.orderNumber ?? '';
    final why = switch (entry.reason) {
      WalletReason.cancelRefund => l10n.walletCancelRefund(order),
      WalletReason.returnRefund => l10n.walletReturnRefund(order),
      WalletReason.saleRefund => l10n.walletSaleRefund(entry.note ?? order),
      WalletReason.sellBack => l10n.walletSellBack(entry.note ?? ''),
      WalletReason.spent => l10n.walletSpentOn(order),
    };
    final amount = Bdt.format(entry.amountBdt.abs());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.sm),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(why, style: context.texts.titleSmall),
                Text(
                  date,
                  style: AppFonts.ui(size: 11, color: palette.textFaint),
                ),
              ],
            ),
          ),
          Text(
            entry.amountBdt > 0 ? '+$amount' : '-$amount',
            style: AppFonts.numeric(
              size: 14,
              color: entry.amountBdt > 0 ? palette.accent : palette.textDim,
            ),
          ),
        ],
      ),
    );
  }
}
