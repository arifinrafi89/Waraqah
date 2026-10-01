import 'dart:math';

import 'package:dio/dio.dart';

import '../../../../core/models/book.dart';
import 'author_fixtures.dart';
import 'book_fixtures.dart';
import 'book_search_match.dart';
import 'levenshtein.dart';

/// Search's typing helpers, matched by [BookSearchMatch.key]. Answers come in
/// the script the reader typed: a Bangla query gets Bangla titles and names
/// when there are some.
abstract final class BookSuggestFakeApi {
  /// Up to 5 Book titles and Author names for `?q=`, best first.
  static const String suggest = '/books/suggest';

  /// The one title closest to `?q=` (for "Did you mean…?"), or `null`.
  static const String didYouMean = '/books/did-you-mean';

  static final Map<String, Object? Function(RequestOptions)> routes = {
    suggest: (options) => _suggest(_query(options)),
    didYouMean: (options) => _didYouMean(_query(options)),
  };

  static String _query(RequestOptions options) =>
      (options.queryParameters['q'] as String? ?? '').trim().toLowerCase();

  static final RegExp _bangla = RegExp('[\u0980-\u09FF]');

  static Iterable<Book> get _books => BookFixtures.all.where((b) => !b.hidden);

  static List<String> _suggest(String query) {
    final sound = BookSearchMatch.key(query);
    if (sound.length < 2) return const [];
    final bangla = _bangla.hasMatch(query);
    final hits = <(int, String)>[];
    void consider(List<String?> spellings, String shown) {
      final ranks = spellings.nonNulls.map((s) => _rank(s, query, sound));
      final best = ranks.nonNulls.fold<int?>(null, (a, b) => min(a ?? b, b));
      if (best != null) hits.add((best, shown));
    }

    for (final book in _books) {
      consider([
        book.title,
        book.titleBn,
        book.shortTitle,
      ], bangla ? book.titleBn ?? book.title : book.title);
    }
    for (final author in AuthorFixtures.all) {
      consider([
        author.name,
        author.nameBn,
      ], bangla ? author.nameBn ?? author.name : author.name);
    }
    hits.sort((a, b) => a.$1 != b.$1 ? a.$1 - b.$1 : a.$2.compareTo(b.$2));
    return {for (final (_, shown) in hits) shown}.take(5).toList();
  }

  /// 0 typed as written, 1 sounds like the start, 2 sounds like a later word.
  static int? _rank(String spelling, String query, String sound) {
    if (spelling.toLowerCase().startsWith(query)) return 0;
    final key = BookSearchMatch.key(spelling);
    if (key.startsWith(sound)) return 1;
    return ' $key'.contains(' $sound') ? 2 : null;
  }

  /// Compares keys with the whole title and with its first words (as many as
  /// the query has), so "sapeinz" meets "Sapiens: A Brief History…". Up to 2
  /// edits away, 1 for keys under 5 letters; keys under 3 letters never guess.
  static String? _didYouMean(String query) {
    final sound = BookSearchMatch.key(query);
    if (sound.length < 3) return null;
    final words = sound.split(' ').length;
    var best = sound.length < 5 ? 2 : 3;
    String? title;
    for (final book in _books) {
      for (final spelling in [book.title, book.titleBn, book.shortTitle]) {
        if (spelling == null) continue;
        final key = BookSearchMatch.key(spelling);
        final start = key.split(' ').take(words).join(' ');
        final edits = min(levenshtein(sound, key), levenshtein(sound, start));
        if (edits < best) {
          best = edits;
          title = _bangla.hasMatch(query)
              ? book.titleBn ?? book.title
              : book.title;
        }
      }
    }
    return title;
  }
}
