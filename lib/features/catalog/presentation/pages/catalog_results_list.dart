import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/stock_label.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/book_list_row.dart';
import '../widgets/book_local_title.dart';

/// Scrollable list of catalog rows, padded clear of the floating nav bar.
/// [header] scrolls above the rows, full width.
class CatalogResultsList extends StatelessWidget {
  const CatalogResultsList({
    super.key,
    required this.books,
    this.onOpen,
    this.showBanglaTitles = false,
    this.header,
  });

  final List<Book> books;
  final VoidCallback? onOpen;

  /// Search only: each row's Bangla title under its title, when it differs.
  final bool showBanglaTitles;

  final Widget? header;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return ListView.separated(
      padding: EdgeInsets.only(bottom: Sizes.navClearance, top: 2),
      itemCount: books.length + (header == null ? 0 : 1),
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (_, index) {
        if (header != null && index == 0) return header!;
        final book = books[header == null ? index : index - 1];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
          child: BookListRow(
            book: book,
            stockLabel: l10n.stockStatus(book.cardStockStatus),
            onOpen: onOpen,
            subtitle: showBanglaTitles ? book.otherTitle(context) : null,
          ),
        );
      },
    );
  }
}
