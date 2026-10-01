import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import 'edition_labels.dart';
import 'section_style.dart';

/// A titled row of chips in the Filter sheet.
class SearchFilterGroup extends StatelessWidget {
  const SearchFilterGroup({
    super.key,
    required this.title,
    required this.chips,
  });

  final String title;
  final List<Widget> chips;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: Insets.md),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Insets.sm,
      children: [
        Text(title, style: context.texts.titleSmall),
        Wrap(spacing: Insets.sm, runSpacing: Insets.sm, children: chips),
      ],
    ),
  );
}

/// One chip: tap to choose it, tap again to clear (single choice) or toggle.
Widget filterChip(String label, bool selected, VoidCallback onTap) =>
    FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
    );

/// A price range in taka: [min] included, [max] excluded.
typedef PriceRange = (int? min, int? max);

const List<PriceRange> priceRanges = [
  (null, 300),
  (300, 600),
  (600, 1000),
  (1000, null),
];

String priceLabel(AppL10n l10n, PriceRange range) => switch (range) {
  (null, _) => l10n.searchPriceUnder300,
  (300, _) => l10n.searchPrice300to600,
  (600, _) => l10n.searchPrice600to1000,
  _ => l10n.searchPriceOver1000,
};

const List<double?> ratings = [null, 3, 4, 4.5];

String ratingLabel(AppL10n l10n, double? rating) => switch (rating) {
  null => l10n.searchFilterAny,
  3 => l10n.searchRating3,
  4 => l10n.searchRating4,
  _ => l10n.searchRating45,
};

String sectionLabel(AppL10n l10n, Section s) => s.label(l10n);
String formatName(AppL10n l10n, BookFormat f) => l10n.formatLabel(f);
String languageName(AppL10n l10n, BookLanguage l) => l10n.languageLabel(l);
