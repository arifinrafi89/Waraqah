import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/booklist.dart';
import 'booklist_book_row.dart';
import 'my_booklist_actions.dart';

/// The Booklist page's scrolling part: note, New total, "Add books" on an
/// own list, then a row per Book.
class BooklistBody extends ConsumerWidget {
  const BooklistBody({super.key, required this.booklist});

  final Booklist booklist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    final books = booklist.books;
    final note = booklist.note(isBangla);
    final total = books.fold(0, (sum, b) => sum + b.fromPriceBdt);
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.md,
      ),
      children: [
        if (note != null) Text(note, style: context.texts.bodyMedium),
        const SizedBox(height: Insets.sm),
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.booklistNewTotal(books.length, Bdt.format(total)),
                style: context.texts.titleSmall,
              ),
            ),
            if (booklist.isMine)
              TextButton.icon(
                icon: const Icon(Icons.add_rounded),
                label: Text(l10n.booklistAddBooks),
                onPressed: () => ref.pickBooklistBooks(context, booklist),
              ),
          ],
        ),
        const SizedBox(height: Insets.sm),
        if (books.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Insets.xl),
            child: Text(
              l10n.booklistEmpty,
              textAlign: TextAlign.center,
              style: context.texts.bodyMedium,
            ),
          ),
        for (final book in books)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: BooklistBookRow(
              key: ValueKey(book.id),
              book: book,
              onRemove: booklist.isMine
                  ? () => _remove(context, ref, book)
                  : null,
            ),
          ),
      ],
    );
  }

  void _remove(BuildContext context, WidgetRef ref, Book book) =>
      ref.setBooklistBooks(context, booklist, [
        for (final b in booklist.books)
          if (b.id != book.id) b.id,
      ]);
}
