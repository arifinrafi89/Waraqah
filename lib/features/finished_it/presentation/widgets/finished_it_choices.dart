import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../sell_back/domain/entities/sell_back.dart';
import '../../domain/entities/finished_it_offers.dart';
import 'finished_it_actions.dart';
import 'finished_share_row.dart';

/// Review or post about the book, then the two ways to pass it on, with
/// what each is worth.
class FinishedItChoices extends ConsumerWidget {
  const FinishedItChoices({super.key, required this.book});

  final SellBackBook book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final offers = FinishedItOffers.of(book.newPriceBdt)!;
    final dim = AppFonts.ui(size: 12.5, height: 1.4, color: palette.textDim);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.md,
      children: [
        Text(
          l10n.listingFinishedTitle(book.title),
          style: context.texts.titleMedium,
        ),
        FinishedShareRow(bookId: book.bookId),
        Text(l10n.listingFinishedBody, style: dim),
        Text(
          l10n.listingFinishedListRange(
            Bdt.format(offers.readers.lowBdt),
            Bdt.format(offers.readers.highBdt),
          ),
          style: dim,
        ),
        PrimaryButton(
          label: l10n.listingFinishedList,
          icon: Icons.sell_outlined,
          onPressed: () => ref.listFinished(context, book),
        ),
        Text(
          l10n.listingFinishedSellBackLine(Bdt.format(offers.sellBackBdt)),
          style: dim,
        ),
        SecondaryButton(
          label: l10n.listingFinishedSellBack,
          onPressed: () => ref.sellBackFinished(context, book),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.listingFinishedKeep),
        ),
      ],
    );
  }
}
