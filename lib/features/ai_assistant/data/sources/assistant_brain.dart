import 'assistant_catalog.dart';
import 'assistant_intent.dart';
import 'assistant_replies.dart';

/// The fake backend's assistant: works out what the reader asked for,
/// searches the catalog for it, and answers in their language.
abstract final class AssistantBrain {
  static int _turn = 0;

  static Map<String, dynamic> greeting(String lang) =>
      _reply(AssistantReplies.greeting(lang == 'bn'));

  static Map<String, dynamic> ask(
    String prompt,
    List<String> history,
    String lang,
  ) {
    final bn = lang == 'bn';
    final words = prompt.toLowerCase();
    bool has(List<String> terms) => terms.any(words.contains);
    // Selling is about the reader's own books, not the catalog.
    if (has(['sell', 'বিক্রি'])) return _reply(AssistantReplies.sell(bn));
    final intent = AssistantIntent.detect(prompt, history);
    if (intent.searchesBooks) {
      final picks = assistantPicksFor(intent);
      if (picks.isEmpty) return _reply(AssistantReplies.none(bn));
      final ids = [for (final p in picks) p.book.id];
      if (!intent.basket) {
        return _reply(AssistantReplies.found(bn, intent), ids);
      }
      final total = picks.fold(0, (sum, p) => sum + p.edition.priceBdt);
      return {
        ..._reply(
          AssistantReplies.basket(bn, intent, picks.length, total),
          ids,
        ),
        'basket': {
          'editionIds': [for (final p in picks) p.edition.id],
          'totalBdt': total,
        },
      };
    }
    return _reply(switch (true) {
      _ when has(['hello', 'hi ', 'salam', 'সালাম']) => AssistantReplies.hello(
        bn,
      ),
      _ when has(['exam', 'study', 'prep', 'পরীক্ষা']) =>
        AssistantReplies.study(bn),
      _ when has(['thank', 'ধন্যবাদ']) => AssistantReplies.thanks(bn),
      _ => AssistantReplies.fallback(bn),
    });
  }

  static Map<String, dynamic> _reply(
    String text, [
    List<String> bookIds = const [],
  ]) => {'id': 'ai-${++_turn}', 'text': _digits(text), 'bookIds': bookIds};

  /// Bangla replies write numbers in Bangla digits.
  static String _digits(String text) => RegExp('[অ-হ]').hasMatch(text)
      ? text.replaceAllMapped(
          RegExp('[0-9]'),
          (m) => '০১২৩৪৫৬৭৮৯'[int.parse(m[0]!)],
        )
      : text;
}
