import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../wallet_routes.dart';

/// "Wallet" row for Profile: drop in `const WalletLink()`.
class WalletLink extends StatelessWidget {
  const WalletLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.walletTitle,
        icon: const Icon(Icons.account_balance_wallet_outlined, size: 18),
        onPressed: () => context.push(WalletRoutes.wallet),
      ),
    );
  }
}
