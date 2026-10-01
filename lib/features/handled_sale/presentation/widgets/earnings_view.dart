import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/earnings.dart';
import 'money_rows.dart';
import 'sale_actions.dart';

/// The totals, a payout button when there's money ready, and past payouts.
class EarningsView extends ConsumerWidget {
  const EarningsView({super.key, required this.earnings});

  final Earnings earnings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final date = DateFormat.yMMMd(
      Localizations.localeOf(context).toLanguageTag(),
    );
    final available = earnings.availableBdt;
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        SurfaceCard(
          padding: const EdgeInsets.all(Insets.md),
          child: MoneyRows(
            rows: [
              (l10n.usedEarningsHeld, earnings.heldBdt),
              (l10n.usedEarningsEarned, earnings.earnedBdt),
              (l10n.usedEarningsPaidOut, earnings.paidOutBdt),
              (l10n.usedEarningsAvailable, available),
            ],
          ),
        ),
        if (available > 0) ...[
          const SizedBox(height: Insets.md),
          PrimaryButton(
            label: l10n.usedEarningsPayout(Bdt.format(available)),
            onPressed: () => ref.requestPayout(context),
          ),
        ],
        const SizedBox(height: Insets.lg),
        SectionHeader(title: l10n.usedEarningsPayouts),
        if (earnings.payouts.isEmpty)
          Text(l10n.usedEarningsNoPayouts, style: context.texts.bodySmall),
        for (final payout in earnings.payouts)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.usedEarningsPayoutLine(Bdt.format(payout.amountBdt)),
                    style: AppFonts.ui(size: 13, color: palette.text),
                  ),
                ),
                Text(
                  date.format(payout.at),
                  style: AppFonts.ui(size: 12, color: palette.textDim),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
