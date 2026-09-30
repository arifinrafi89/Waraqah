import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../wallet/presentation/providers/wallet_providers.dart';
import '../providers/checkout_providers.dart';

/// "Pay ৳180 from your wallet" with a switch. Hidden when the wallet is
/// empty.
class WalletCard extends ConsumerWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final balance = ref.watch(walletProvider).value?.balanceBdt ?? 0;
    final totals = ref.watch(checkoutTotalsProvider);
    if (totals == null || balance <= 0) return const SizedBox.shrink();
    final usable = min(balance, totals.beforeWalletBdt);
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SurfaceCard(
        padding: const EdgeInsets.fromLTRB(
          Insets.md,
          Insets.sm,
          Insets.sm,
          Insets.sm,
        ),
        child: Row(
          spacing: Insets.md,
          children: [
            Icon(Icons.account_balance_wallet_outlined, color: palette.accent),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.walletUseAtCheckout(Bdt.format(usable)),
                    style: context.texts.titleSmall,
                  ),
                  Text(
                    l10n.walletYouHave(Bdt.format(balance)),
                    style: AppFonts.ui(size: 11.5, color: palette.textFaint),
                  ),
                ],
              ),
            ),
            Switch(
              value: ref.watch(useWalletProvider),
              onChanged: (use) =>
                  ref.read(useWalletProvider.notifier).select(use),
            ),
          ],
        ),
      ),
    );
  }
}
