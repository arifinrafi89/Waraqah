import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/sell_back.dart';
import '../../domain/entities/sell_back_rules.dart';
import 'sell_back_actions.dart';
import 'sell_back_book_row.dart';

/// One picked-up book: what the reader said, staff's own grade, and what
/// that pays and resells for.
class TradeInCard extends ConsumerStatefulWidget {
  const TradeInCard({super.key, required this.sellBack});

  final SellBack sellBack;

  @override
  ConsumerState<TradeInCard> createState() => _TradeInCardState();
}

class _TradeInCardState extends ConsumerState<TradeInCard> {
  late BookCondition _grade = widget.sellBack.condition;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final sb = widget.sellBack;
    final newPrice = sb.book.newPriceBdt;
    final pay = SellBackRules.quote(newPrice, _grade, flags: sb.flags);
    final resell = SellBackRules.resellPrice(newPrice, _grade);
    final dim = AppFonts.ui(size: 12, color: palette.textDim);
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          SellBackBookRow(book: sb.book),
          Text(
            [
              l10n.sellBackFrom(sb.readerName ?? '?'),
              l10n.sellBackReaderSays(l10n.conditionLabel(sb.condition)),
              l10n.sellBackQuoted(Bdt.format(sb.quoteBdt)),
            ].join(' · '),
            style: dim,
          ),
          Text(l10n.sellBackGradeAs, style: context.texts.titleSmall),
          Wrap(
            spacing: Insets.sm,
            runSpacing: Insets.sm,
            children: [
              for (final c in BookCondition.values)
                ChoiceChip(
                  label: Text(l10n.conditionLabel(c)),
                  selected: c == _grade,
                  onSelected: (_) => setState(() => _grade = c),
                ),
            ],
          ),
          PrimaryButton(
            label: l10n.sellBackPayAndPublish(
              Bdt.format(pay),
              Bdt.format(resell),
            ),
            onPressed: () =>
                ref.gradeTradeIn(context, sb, _grade, accept: true),
          ),
          TextButton(
            onPressed: () =>
                ref.gradeTradeIn(context, sb, _grade, accept: false),
            child: Text(l10n.sellBackReturn),
          ),
        ],
      ),
    );
  }
}
