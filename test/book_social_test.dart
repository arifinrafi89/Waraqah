import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/bites/domain/entities/bite.dart';
import 'package:waraqah/features/catalog/presentation/widgets/book_bites_section.dart';
import 'package:waraqah/features/catalog/presentation/widgets/book_reviews_section.dart';
import 'package:waraqah/features/catalog/domain/entities/book_review.dart';
import 'package:waraqah/features/bites/presentation/providers/bite_providers.dart';
import 'package:waraqah/l10n/app_localizations.dart';

void main() {
  testWidgets('reviews show verified purchase and accept a star review', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppL10n.localizationsDelegates,
        supportedLocales: AppL10n.supportedLocales,
        theme: AppTheme.light(),
        home: const Scaffold(
          body: SingleChildScrollView(
            child: BookReviewsSection(
              bookId: 'bk-sapiens',
              reviews: [
                BookReview(
                  id: 'review-1',
                  reviewerName: 'Reader',
                  reviewerHandle: 'reader',
                  rating: 5,
                  text: 'Already purchased.',
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Write a review'));
    await tester.pumpAndSettle();
    expect(find.text('Verified Purchase'), findsOneWidget);
    expect(find.byTooltip('5'), findsOneWidget);
    expect(find.text('Submit review'), findsOneWidget);
  });

  testWidgets('book Bites widget renders tagged Bites', (tester) async {
    const bite = Bite(
      id: 'bt-book',
      authorName: 'Reader',
      authorHandle: 'reader',
      text: 'A memorable book.',
      taggedBookId: 'bk-sapiens',
      taggedBookTitle: 'Sapiens',
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bitesAboutBookProvider('bk-sapiens')
              .overrideWith((ref) => Future.value(const [bite])),
        ],
        child: MaterialApp(
          localizationsDelegates: AppL10n.localizationsDelegates,
          supportedLocales: AppL10n.supportedLocales,
          theme: AppTheme.light(),
          home: Scaffold(body: BookBitesSection(bookId: 'bk-sapiens')),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Bites about this book'), findsOneWidget);
    expect(find.text('A memorable book.'), findsOneWidget);
  });
}
