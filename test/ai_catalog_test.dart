import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/ai_assistant/data/sources/assistant_intent.dart';
import 'package:waraqah/features/ai_assistant/data/sources/waraqah_chatbot.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';

void main() {
  test(
    'local assistant recommends Waraqah books with catalog prices',
    () async {
      final book = BookFixtures.all.firstWhere(
        (book) => book.id == 'bk-atomic',
      );
      final intent = AssistantIntent.detect(
        'recommend books under 600 taka',
        const [],
      );
      final reply = await WaraqahChatbot().replyTo(
        'recommend books under 600 taka',
        intent: intent,
        books: [book],
      );

      expect(reply.text, contains('Waraqah catalog'));
      expect(reply.text, contains('৳${book.fromPriceBdt}'));
      expect(reply.text, isNot(contains('Rokomari')));
      expect(reply.text, isNot(contains('Wafilife')));
      expect(reply.recommendedBookIds, contains(book.id));
    },
  );
}
