import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/edition_providers.dart';
import 'delivery_row.dart';
import 'edition_tile.dart';

/// Every Edition of [book] to pick from, cheapest first, with the delivery
/// estimate for the one that's picked.
class EditionPicker extends ConsumerWidget {
  const EditionPicker({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final chosen = book.chosenEdition(
      ref.watch(selectedEditionIdProvider(book.id)),
    );
    final editions = [...book.editions]
      ..sort((a, b) => a.priceBdt.compareTo(b.priceBdt));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.sm,
      children: [
        SectionHeader(
          title: l10n.bookEditionTitle,
          subtitle: l10n.bookEditionCount(editions.length),
        ),
        for (final edition in editions)
          EditionTile(
            key: ValueKey(edition.id),
            edition: edition,
            isSelected: edition.id == chosen.id,
            isTranslation: book.isTranslation(edition),
            onTap: () => ref
                .read(selectedEditionIdProvider(book.id).notifier)
                .select(edition.id),
          ),
        const SizedBox(height: 2),
        DeliveryRow(edition: chosen),
      ],
    );
  }
}
