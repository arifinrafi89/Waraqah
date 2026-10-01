import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog/data/sources/book_edition_filter.dart';

Edition _ed(
  String id,
  BookFormat format,
  BookLanguage language,
  int price, {
  int stock = 5,
  bool preorder = false,
}) => Edition(
  id: id,
  format: format,
  language: language,
  priceBdt: price,
  stock: stock,
  isPreorder: preorder,
);

Book _book(String id, List<Edition> editions, {double rating = 4}) => Book(
  id: id,
  title: id,
  author: 'A',
  categoryId: 'c',
  authorId: 'a',
  publisherId: 'p',
  section: Section.literature,
  originalLanguage: BookLanguage.bangla,
  editions: editions,
  addedAt: DateTime(2026),
  rating: rating,
);

List<String> _ids(Iterable<Book> books, Map<String, dynamic> params) => [
  for (final b in BookEditionFilter.apply(books, params)) b.id,
];

void main() {
  // Bangla paperback and English eBook: no single Edition is Bangla + eBook.
  final split = _book('split', [
    _ed('s1', BookFormat.paperback, BookLanguage.bangla, 400),
    _ed('s2', BookFormat.ebook, BookLanguage.english, 300),
  ]);
  final match = _book('match', [
    _ed('m1', BookFormat.ebook, BookLanguage.bangla, 450),
  ], rating: 3.5);
  final preorder = _book('pre', [
    _ed(
      'p1',
      BookFormat.hardcover,
      BookLanguage.arabic,
      900,
      stock: 0,
      preorder: true,
    ),
  ], rating: 4.8);
  final all = [split, match, preorder];

  test('no params keeps every Book', () {
    expect(_ids(all, {}), ['split', 'match', 'pre']);
  });

  test('format, language and rating filter', () {
    expect(_ids(all, {'format': 'ebook,hardcover'}), ['split', 'match', 'pre']);
    expect(_ids(all, {'language': 'arabic'}), ['pre']);
    expect(_ids(all, {'minRating': 4.0}), ['split', 'pre']);
  });

  test('price: min included, max excluded', () {
    expect(_ids(all, {'minPrice': 450, 'maxPrice': 900}), ['match']);
    expect(_ids(all, {'maxPrice': 300}), <String>[]);
    expect(_ids(all, {'minPrice': 900}), ['pre']);
  });

  test('in stock excludes pre-order-only Books', () {
    expect(_ids(all, {'inStock': true}), ['split', 'match']);
  });

  test('format, language and price hold for one single Edition', () {
    final params = {'language': 'bangla', 'format': 'ebook', 'maxPrice': 500};
    expect(_ids(all, params), ['match']);
    // The split Book has each part, but only across two Editions.
    expect(_ids([split], params), <String>[]);
  });
}
