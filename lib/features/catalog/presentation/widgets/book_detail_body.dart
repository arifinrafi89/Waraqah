import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../bites/domain/entities/bite_query.dart';
import '../../../bites/presentation/providers/bite_providers.dart';
import '../../../bites/presentation/widgets/book_bites_panel.dart';
import '../../../deals/presentation/widgets/book_bundles.dart';
import '../../../reviews/presentation/providers/review_providers.dart';
import '../../../reviews/presentation/widgets/book_reviews_panel.dart';
import '../providers/book_detail_providers.dart';
import 'book_about_section.dart';
import 'book_detail_header.dart';
import 'edition_picker.dart';
import 'look_inside_button.dart';
import 'other_ways_to_buy.dart';
import 'questions_section.dart';
import 'series_panel.dart';

/// Everything on a book's page, top to bottom: the header and Look Inside,
/// editions, used copies, the series, then the summary, questions,
/// reviews and Bites about the Book.
class BookDetailBody extends ConsumerWidget {
  const BookDetailBody({super.key, required this.data});

  final BookDetailData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = data.book;
    // Load the reviews and Bites with the page, not when scrolled to.
    ref.listen(bookReviewsProvider(book.id), (_, _) {});
    ref.listen(bitesProvider(BiteQuery(bookId: book.id)), (_, _) {});
    const gap = SizedBox(height: Insets.xl + 4);
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        BookDetailHeader(book: book),
        LookInsideButton(bookId: book.id),
        gap,
        EditionPicker(book: book),
        const SizedBox(height: Insets.lg),
        OtherWaysToBuy(bookId: book.id),
        const SizedBox(height: Insets.lg),
        SeriesPanel(bookId: book.id),
        BookBundles(bookId: book.id),
        gap,
        BookAboutSection(book: book, details: data.details),
        QuestionsSection(bookId: book.id),
        gap,
        BookReviewsPanel(bookId: book.id),
        gap,
        BookBitesPanel(bookId: book.id),
      ],
    );
  }
}
