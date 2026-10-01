import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';

/// The condition grade, and flags for highlighting, notes or damage.
class SellBackConditionPicker extends StatelessWidget {
  const SellBackConditionPicker({
    super.key,
    required this.condition,
    required this.flags,
    required this.onCondition,
    required this.onFlag,
  });

  final BookCondition condition;
  final Set<String> flags;
  final ValueChanged<BookCondition> onCondition;
  final ValueChanged<String> onFlag;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.sm,
      children: [
        SectionHeader(title: l10n.sellBackCondition),
        Wrap(
          spacing: Insets.sm,
          runSpacing: Insets.sm,
          children: [
            for (final c in BookCondition.values)
              ChoiceChip(
                label: Text(l10n.conditionLabel(c)),
                selected: c == condition,
                onSelected: (_) => onCondition(c),
              ),
          ],
        ),
        Wrap(
          spacing: Insets.sm,
          runSpacing: Insets.sm,
          children: [
            for (final flag in [
              l10n.listingFlagHighlighting,
              l10n.listingFlagNotes,
              l10n.listingFlagDamage,
            ])
              FilterChip(
                label: Text(flag),
                selected: flags.contains(flag),
                onSelected: (_) => onFlag(flag),
              ),
          ],
        ),
      ],
    );
  }
}
