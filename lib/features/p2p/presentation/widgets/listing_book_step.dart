import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../scan/presentation/widgets/scan_button.dart';
import '../providers/p2p_add_listing_notifier.dart';
import 'listing_rules_card.dart';
import 'p2p_add_listing_field.dart';

/// Step 1: the rules, then the Book, scanned or typed.
class ListingBookStep extends ConsumerWidget {
  const ListingBookStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final draft = ref.watch(p2pAddListingProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListingRulesCard(),
        const SizedBox(height: Insets.md),
        const ScanButton(forSell: true, wide: true),
        const SizedBox(height: Insets.md),
        P2pAddListingField(
          // A scanned book replaces what was typed.
          key: ValueKey(draft.bookId),
          initialValue: draft.title,
          label: l10n.listingBookTitle,
          hint: l10n.listingBookTitleHint,
          onChanged: ref.read(p2pAddListingProvider.notifier).updateTitle,
        ),
      ],
    );
  }
}
