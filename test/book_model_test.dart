import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog/data/sources/author_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/category_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/publisher_fixtures.dart';

Edition _ed(
  String id,
  int price, {
  int stock = 5,
  int? list,
  bool preorder = false,
  BookLanguage language = BookLanguage.english,
}) => Edition(
  id: id,
  format: BookFormat.paperback,
  language: language,
  priceBdt: price,
  listPriceBdt: list,
  stock: stock,
  isPreorder: preorder,
);

Book _book(List<Edition> editions) => Book(
  id: 'b',
  title: 'T',
  author: 'A',
  categoryId: 'cat-academic',
  authorId: 'au-x',
  publisherId: 'pub-x',
  section: Section.academic,
  originalLanguage: BookLanguage.english,
  editions: editions,
);

void main() {
  test('a Book with no Editions fails the assert', () {
    expect(() => _book([]), throwsAssertionError);
  });

  group('from-edition', () {
    test('skips out-of-stock Editions', () {
      final book = _book([_ed('a', 100, stock: 0), _ed('b', 300)]);
      expect(book.fromEdition.id, 'b');
      expect(book.fromPriceBdt, 300);
    });

    test('falls back to the cheapest when all are out of stock', () {
      final book = _book([_ed('a', 200, stock: 0), _ed('b', 150, stock: 0)]);
      expect(book.fromEdition.id, 'b');
    });

    test('counts a Pre-order as available', () {
      final book = _book([
        _ed('a', 100, stock: 0),
        _ed('b', 250, stock: 0, preorder: true),
        _ed('c', 400),
      ]);
      expect(book.fromEdition.id, 'b');
    });

    test('discount follows the from-edition List price', () {
      final book = _book([_ed('a', 100, stock: 0, list: 200), _ed('b', 300)]);
      expect(book.isFromEditionDiscounted, isFalse);
      expect(
        _book([_ed('a', 100, list: 200), _ed('b', 300)])
            .isFromEditionDiscounted,
        isTrue,
      );
    });
  });

  group('card stock status', () {
    test('in stock when any Edition has stock', () {
      expect(
        _book([_ed('a', 1, stock: 0, preorder: true), _ed('b', 1)])
            .cardStockStatus,
        CardStockStatus.inStock,
      );
    });

    test('pre-order when none in stock but one is a Pre-order', () {
      expect(
        _book([_ed('a', 1, stock: 0), _ed('b', 1, stock: 0, preorder: true)])
            .cardStockStatus,
        CardStockStatus.preorder,
      );
    });

    test('out of stock otherwise', () {
      expect(
        _book([_ed('a', 1, stock: 0)]).cardStockStatus,
        CardStockStatus.outOfStock,
      );
    });
  });

  test('a Translation differs from the original language', () {
    final bn = _ed('a', 1, language: BookLanguage.bangla);
    final book = _book([bn]);
    expect(book.isTranslation(bn), isTrue);
    expect(book.isTranslation(_ed('b', 1)), isFalse);
  });

  group('seed catalog', () {
    final books = BookFixtures.all;
    final editions = [for (final b in books) ...b.editions];

    test('every Book has Editions, a Section, a Category and a language', () {
      for (final b in books) {
        expect(b.editions, isNotEmpty, reason: b.id);
        expect(b.section, isNotNull, reason: b.id);
        expect(b.originalLanguage, isNotNull, reason: b.id);
      }
    });

    test(
      'every Book\'s Category, Author and Publisher exist, in its Section',
      () {
        final categories = {for (final c in CategoryFixtures.all) c.id: c};
        final authors = AuthorFixtures.all.map((a) => a.id).toSet();
        final publishers = PublisherFixtures.all.map((p) => p.id).toSet();
        for (final b in books) {
          expect(categories[b.categoryId]?.section, b.section, reason: b.id);
          expect(authors, contains(b.authorId), reason: b.id);
          expect(publishers, contains(b.publisherId), reason: b.id);
        }
      },
    );

    test('Edition ids are unique across the catalog', () {
      final ids = editions.map((e) => e.id);
      expect(ids.toSet().length, ids.length);
    });

    test('covers every case the UI needs to show', () {
      expect(editions.any((e) => e.format == BookFormat.hardcover), isTrue);
      expect(editions.any((e) => e.format == BookFormat.ebook), isTrue);
      expect(
        books.any(
          (b) =>
              b.editions.any(b.isTranslation) &&
              b.editions.any((e) => e.language == BookLanguage.bangla),
        ),
        isTrue,
      );
      expect(editions.any((e) => e.stock > 0 && e.stock <= 3), isTrue);
      expect(editions.any((e) => e.stock == 0 && !e.isPreorder), isTrue);
      expect(editions.any((e) => e.isPreorder), isTrue);
      expect(editions.any((e) => e.isDiscounted), isTrue);
    });
  });
}
