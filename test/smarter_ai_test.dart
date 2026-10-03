import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/ai_assistant/ai_assistant_routes.dart';
import 'package:waraqah/features/ai_assistant/data/sources/assistant_brain.dart';
import 'package:waraqah/features/ai_assistant/data/sources/assistant_intent.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('plain words become filters, in English and Bangla', () {
    final a = AssistantIntent.detect('Books for Class 9 under ৳1,000', []);
    expect((a.classLevel, a.maxPrice, a.basket), (9, 1000, true));
    final b = AssistantIntent.detect('৯ম শ্রেণির বই ১০০০ টাকার মধ্যে', []);
    expect((b.classLevel, b.maxPrice), (9, 1000));
    final c = AssistantIntent.detect(
      'short seerah for beginners in Bangla',
      [],
    );
    expect(
      (c.kind, c.language),
      (AssistantIntentKind.seerah, BookLanguage.bangla),
    );
    expect(AssistantIntent.detect('HSC ebook', []).format, BookFormat.ebook);
    expect(AssistantIntent.detect('good morning', []).searchesBooks, isFalse);
  });

  test('a Class 9 basket fits the budget, one Edition per Book', () {
    final reply = AssistantBrain.ask(
      'Books for Class 9 under ৳1,000',
      const [],
      'en',
    );
    final basket = reply['basket'] as Map<String, dynamic>;
    final ids = (basket['editionIds'] as List).cast<String>();
    expect(ids, isNotEmpty);
    var total = 0;
    for (final id in ids) {
      final book = BookFixtures.all.firstWhere(
        (b) => b.editions.any((e) => e.id == id),
      );
      expect(book.classes, contains(9));
      total += book.editions.firstWhere((e) => e.id == id).priceBdt;
    }
    expect(basket['totalBdt'], total);
    expect(total, lessThanOrEqualTo(1000));
  });

  test('a Bangla seerah request picks a Bangla Edition', () {
    final reply = AssistantBrain.ask(
      'short seerah for beginners in Bangla',
      const [],
      'en',
    );
    final ids = (reply['bookIds'] as List).cast<String>();
    expect(ids, isNotEmpty);
    for (final id in ids) {
      final book = BookFixtures.all.firstWhere((b) => b.id == id);
      expect(
        book.editions.any((e) => e.language == BookLanguage.bangla),
        isTrue,
      );
    }
    expect(reply['text'], contains('in Bangla'));
  });

  testWidgets('the basket goes in the cart in one tap', (tester) async {
    await openApp(tester, AiAssistantRoutes.aiChat, role: 'reader');
    await tester.tap(find.text('Books for Class 9 under ৳1,000'));
    await settle(tester);
    await settle(tester);
    expect(find.textContaining('basket of books for Class 9'), findsOneWidget);
    await tester.ensureVisible(find.text('Add all to cart'));
    await tester.tap(find.text('Add all to cart'));
    // One cart call per Book; the snackbar comes after the last.
    final added = find.textContaining('added to your cart');
    for (var i = 0; i < 10 && added.evaluate().isEmpty; i++) {
      await tester.pump(const Duration(milliseconds: 500));
    }
    expect(added, findsOneWidget);
  });
}
