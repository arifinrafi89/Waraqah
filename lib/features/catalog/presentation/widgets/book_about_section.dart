import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_details.dart';

/// Summary plus publication facts. Renders nothing when there is no data,
/// so books without a seed entry do not show an empty heading.
class BookAboutSection extends StatelessWidget {
  const BookAboutSection({
    super.key,
    required this.book,
    required this.details,
  });

  final Book book;
  final BookDetails details;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final facts = [
      if (details.pages != null) l10n.bookDetailPages(details.pages!),
      switch (book.originalLanguage) {
        BookLanguage.bangla => l10n.bookLanguageBangla,
        BookLanguage.english => l10n.bookLanguageEnglish,
        BookLanguage.arabic => l10n.bookLanguageArabic,
      },
      ?details.publisher,
    ];
    if (details.description == null && facts.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.xl + 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: l10n.bookDetailAbout),
          if (details.description != null)
            Text(details.description!, style: context.texts.bodyMedium),
          if (facts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: Insets.md),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final fact in facts) MiniTag(label: fact, fontSize: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
