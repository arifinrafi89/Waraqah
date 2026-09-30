import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../providers/book_detail_providers.dart';
import 'book_about_section.dart';
import 'book_detail_header.dart';
import 'book_reviews_section.dart';
import 'edition_picker.dart';
import 'look_inside_button.dart';
import 'other_ways_to_buy.dart';
import 'questions_section.dart';
import 'series_panel.dart';

/// Everything on a book's page, top to bottom: the header and Look Inside,
/// editions, used copies, the series, then the summary, questions and
/// reviews.
class BookDetailBody extends StatelessWidget {
  const BookDetailBody({super.key, required this.data});

  final BookDetailData data;

  @override
  Widget build(BuildContext context) {
    final book = data.book;
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
        gap,
        BookAboutSection(book: book, details: data.details),
        QuestionsSection(bookId: book.id),
        gap,
        BookReviewsSection(reviews: data.details.reviews),
      ],
    );
  }
}
