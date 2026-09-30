import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog/domain/entities/catalog_filters.dart';
import 'package:waraqah/features/catalog/domain/repositories/book_repository.dart';
import 'package:waraqah/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:waraqah/features/home/presentation/providers/home_providers.dart';

class _FakeBookRepository implements BookRepository {
  _FakeBookRepository(this.books);

  final List<Book> books;

  @override
  Future<List<Book>> fetchNewArrivals() async => books.take(4).toList();

  @override
  Future<List<Book>> searchCatalog([
    CatalogFilters filters = const CatalogFilters(),
  ]) async {
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

Book _book(String id, {required int price, double rating = 4.5}) {
  return Book(
    addedAt: DateTime(2026, 1, 1),
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
  );
}

void main() {
  group('homeNewArrivalsProvider', () {
    late List<Book> books;

    setUp(() {
      books = [for (var i = 0; i < 20; i++) _book('book-$i', price: 100 + i)];
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

    test('shows up to 8, cheapest first', () async {
      final container = containerFor(books);
      final result = await container.read(homeNewArrivalsProvider.future);
      expect(result.length, 8);
      expect(
        result.map((b) => b.fromPriceBdt).toList(),
        List.generate(8, (i) => 100 + i),
      );
    });
  });
}
