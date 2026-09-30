import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog/domain/repositories/book_repository.dart';
import 'package:waraqah/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:waraqah/features/home/domain/entities/benefit_filter.dart';
import 'package:waraqah/features/home/presentation/providers/home_providers.dart';

class _FakeBookRepository implements BookRepository {
  _FakeBookRepository(this.books);

  final List<Book> books;

  @override
  Future<List<Book>> fetchNewArrivals() async => books.take(4).toList();

  @override
  Future<List<Book>> searchCatalog({
    String? category,
    Section? section,
    String query = '',
  }) async {
    final sorted = [...books];
    sorted.sort((a, b) {
      final byPrice = a.fromPriceBdt.compareTo(b.fromPriceBdt);
      return byPrice != 0 ? byPrice : b.rating.compareTo(a.rating);
    });
    return sorted;
  }

  @override
  Future<Book?> findById(String id) async =>
      books.where((b) => b.id == id).firstOrNull;
}

Book _book(
  String id, {
  required bool beneficial,
  required int price,
  double rating = 4.5,
}) {
  return Book(
    id: id,
    title: id,
    author: 'Author',
    categoryId: 'cat-academic',
    authorId: 'au-x',
    publisherId: 'pub-x',
    section: Section.academic,
    originalLanguage: BookLanguage.english,
    editions: [
      Edition(
        id: '$id-pb',
        format: BookFormat.paperback,
        language: BookLanguage.english,
        priceBdt: price,
        stock: 5,
      ),
    ],
    rating: rating,
    isBeneficial: beneficial,
  );
}

void main() {
  group('homeNewArrivalsProvider', () {
    late List<Book> books;

    setUp(() {
      books = [
        for (var i = 0; i < 10; i++)
          _book('ben-$i', beneficial: true, price: 100 + i),
        for (var i = 0; i < 10; i++)
          _book('non-$i', beneficial: false, price: 200 + i),
      ];
    });

    ProviderContainer containerFor(List<Book> books) {
      final container = ProviderContainer(
        overrides: [
          bookRepositoryProvider.overrideWithValue(_FakeBookRepository(books)),
        ],
      );
      addTearDown(container.dispose);
      return container;
    }

    test('all shows up to 8, cheapest first', () async {
      final container = containerFor(books);
      final result = await container.read(homeNewArrivalsProvider.future);
      expect(result.length, 8);
      expect(
        result.map((b) => b.fromPriceBdt).toList(),
        List.generate(8, (i) => 100 + i),
      );
    });

    test('beneficial only shows matching books, at most 8', () async {
      final container = containerFor(books);
      container
          .read(benefitFilterProvider.notifier)
          .select(BenefitFilter.beneficial);
      final result = await container.read(homeNewArrivalsProvider.future);
      expect(result, everyElement(predicate((Book b) => b.isBeneficial)));
      expect(result.length, 8);
    });

    test('non-beneficial only shows matching books, at most 8', () async {
      final container = containerFor(books);
      container
          .read(benefitFilterProvider.notifier)
          .select(BenefitFilter.nonBeneficial);
      final result = await container.read(homeNewArrivalsProvider.future);
      expect(result, everyElement(predicate((Book b) => !b.isBeneficial)));
      expect(result.length, 8);
    });

    test('filter with fewer than 8 matches returns all of them', () async {
      final container = containerFor([
        _book('only-1', beneficial: true, price: 100),
        _book('only-2', beneficial: false, price: 50),
      ]);
      container
          .read(benefitFilterProvider.notifier)
          .select(BenefitFilter.beneficial);
      final result = await container.read(homeNewArrivalsProvider.future);
      expect(result.map((b) => b.id).toList(), ['only-1']);
    });
  });
}
