import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../../domain/entities/book_details.dart';
import '../providers/catalog_providers.dart';
import 'edition_labels.dart';

/// Summary plus publication facts. Renders nothing when there is no data,
/// so books without a seed entry do not show an empty heading.
class BookAboutSection extends ConsumerWidget {
  const BookAboutSection({
    super.key,
    required this.book,
    required this.details,
  });

  final Book book;
  final BookDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final facts = [
      if (details.pages != null) l10n.bookDetailPages(details.pages!),
      l10n.languageLabel(book.originalLanguage),
    ];
    final publisher = ref.watch(publisherProvider(book.publisherId)).value;
    if (details.description == null && facts.isEmpty && publisher == null) {
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
          if (facts.isNotEmpty || publisher != null)
            Padding(
              padding: const EdgeInsets.only(top: Insets.md),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final fact in facts) MiniTag(label: fact, fontSize: 10),
                  if (publisher != null)
                    MiniTag(
                      label: publisher.name,
                      fontSize: 10,
                      onTap: () => context.push(
                        CatalogRoutes.publisherFor(publisher.id),
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
