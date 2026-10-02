import 'package:characters/characters.dart';

/// Why a Bite, comment or quote can't be saved.
enum BiteProblem { empty, tooLong, spoilerNeedsBook }

/// Limits the composer shows and the server checks. Lengths count
/// graphemes, so a Bangla conjunct like ক্ষ is one character.
abstract final class BiteRules {
  static const int maxLength = 500;
  static const int maxComment = 300;
  static const int maxQuote = 300;

  static int length(String text) => text.trim().characters.length;

  /// A Bite: 1–[maxLength] characters; a spoiler must tag a Book.
  static BiteProblem? check(
    String text, {
    String? bookId,
    bool spoiler = false,
  }) =>
      _limit(text, maxLength) ??
      (spoiler && (bookId ?? '').isEmpty ? BiteProblem.spoilerNeedsBook : null);

  /// A comment or reply: 1–[maxComment] characters.
  static BiteProblem? checkComment(String text) => _limit(text, maxComment);

  /// A quote card's text: 1–[maxQuote] characters.
  static BiteProblem? checkQuote(String text) => _limit(text, maxQuote);

  static BiteProblem? _limit(String text, int max) {
    final n = length(text);
    if (n == 0) return BiteProblem.empty;
    return n > max ? BiteProblem.tooLong : null;
  }
}
