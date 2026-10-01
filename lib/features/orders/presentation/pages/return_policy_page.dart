import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/orders_top_bar.dart';

/// `/return-policy`: when and how a book can go back, and where the money
/// goes. It says what the app does: 7 days after delivery, printed books,
/// refunds to the wallet. Anyone can read it.
class ReturnPolicyPage extends StatelessWidget {
  const ReturnPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final sections = [
      (Icons.event_outlined, l10n.orderPolicyWhenTitle, l10n.orderPolicyWhen),
      (
        Icons.menu_book_outlined,
        l10n.orderPolicyWhatTitle,
        l10n.orderPolicyWhat,
      ),
      (
        Icons.photo_camera_outlined,
        l10n.orderPolicyHowTitle,
        l10n.orderPolicyHow,
      ),
      (
        Icons.account_balance_wallet_outlined,
        l10n.orderPolicyMoneyTitle,
        l10n.orderPolicyMoney,
      ),
      (
        Icons.close_rounded,
        l10n.orderPolicyCancelTitle,
        l10n.orderPolicyCancel,
      ),
      (
        Icons.people_outline_rounded,
        l10n.orderPolicyUsedTitle,
        l10n.orderPolicyUsed,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            OrdersTopBar(title: l10n.orderPolicyTitle),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  Insets.screen,
                  0,
                  Insets.screen,
                  Insets.xl,
                ),
                itemCount: sections.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final (icon, title, body) = sections[i];
                  return _Section(icon: icon, title: title, body: body);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.icon, required this.title, required this.body});

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Insets.md,
        children: [
          Icon(icon, color: palette.accent),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(title, style: context.texts.titleSmall),
                Text(
                  body,
                  style: AppFonts.ui(
                    size: 12.5,
                    height: 1.45,
                    color: palette.textDim,
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
