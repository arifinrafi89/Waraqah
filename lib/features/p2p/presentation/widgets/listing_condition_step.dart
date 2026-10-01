import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';
import '../providers/p2p_add_listing_notifier.dart';

/// Step 2: the condition grade, and flags for highlighting, notes or damage.
class ListingConditionStep extends ConsumerWidget {
  const ListingConditionStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final draft = ref.watch(p2pAddListingProvider);
    final notifier = ref.read(p2pAddListingProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          children: [
            for (final condition in BookCondition.values)
              ChoiceChip(
                label: Text(switch (condition) {
                  BookCondition.likeNew => l10n.listingConditionLikeNew,
                  BookCondition.veryGood => l10n.listingConditionVeryGood,
                  BookCondition.good => l10n.listingConditionGood,
                  BookCondition.acceptable => l10n.listingConditionAcceptable,
                }),
                selected: draft.condition == condition,
                onSelected: (_) => notifier.updateCondition(condition),
              ),
          ],
        ),
        const SizedBox(height: Insets.md),
        Text(l10n.listingFlags),
        Wrap(
          spacing: 8,
          children: [
            for (final flag in [
              l10n.listingFlagHighlighting,
              l10n.listingFlagNotes,
              l10n.listingFlagDamage,
            ])
              FilterChip(
                label: Text(flag),
                selected: draft.flags.contains(flag),
                onSelected: (_) => notifier.toggleFlag(flag),
              ),
          ],
        ),
      ],
    );
  }
}
