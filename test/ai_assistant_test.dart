import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/ai_assistant/ai_assistant_routes.dart';
import 'package:waraqah/features/ai_assistant/data/sources/assistant_brain.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  List<String> books(Map<String, dynamic> reply) =>
      (reply['bookIds'] as List).cast<String>();

  test('the assistant recommends only catalog Books that fit', () {
    final hadith = AssistantBrain.ask('Hadith collections', const [], 'en');
    expect(books(hadith), isNotEmpty);
    for (final id in books(hadith)) {
      final book = BookFixtures.all.firstWhere((b) => b.id == id);
      expect(book.categoryId, 'cat-islamic-studies');
      expect(book.hidden, isFalse);
    }

    final cheap = AssistantBrain.ask('Books under ৳500', const [], 'en');
    expect(books(cheap), isNotEmpty);
    for (final id in books(cheap)) {
      expect(
        BookFixtures.all.firstWhere((b) => b.id == id).fromPriceBdt,
        lessThanOrEqualTo(500),
      );
    }
    expect(cheap['text'], contains("Waraqah's catalog"));
  });

  test('it answers small talk without Books, in Bangla too', () {
    final hi = AssistantBrain.ask('salam!', const [], 'en');
    expect(books(hi), isEmpty);
    expect(hi['text'], startsWith('Wa alaikum'));
    expect(AssistantBrain.greeting('bn')['text'], contains('ওয়ারাকাহ'));
    expect(
      AssistantBrain.ask('sell my old books', const [], 'en')['text'],
      contains('P2P'),
    );
  });

  testWidgets('a prompt chip brings back catalog Books with price and stock', (
    tester,
  ) async {
    await openApp(tester, AiAssistantRoutes.aiChat, role: 'reader');
    expect(find.textContaining('Assalamu Alaikum'), findsOneWidget);
    await tester.ensureVisible(find.text('Seerah for beginners'));
    await tester.pump();
    await tester.tap(find.text('Seerah for beginners'));
    await settle(tester);
    await settle(tester);
    expect(find.textContaining('books on the Seerah'), findsOneWidget);
    expect(find.textContaining('In stock'), findsWidgets);
    expect(find.textContaining('Rokomari'), findsNothing);
  });
}
