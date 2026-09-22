import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/book_list_row.dart';

/// Scrollable list of catalog rows, padded clear of the floating nav bar.
class CatalogResultsList extends StatelessWidget {
  const CatalogResultsList({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: Insets.screen,
        right: Insets.screen,
        bottom: Sizes.navClearance,
        top: 2,
      ),
      itemCount: books.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (_, index) {
        final book = books[index];
        return BookListRow(
          book: book,
          vendorLine: l10n.catalogVendorCompare(book.vendor, book.vendorCount),
        );
      },
    );
  }
}
