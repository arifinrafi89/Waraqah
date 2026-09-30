import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/catalog/data/sources/book_fake_api.dart';
import 'package:waraqah/features/catalog/data/sources/book_sort.dart';

Future<List<Book>> _books(String sort, {String q = ''}) async {
  final dio = Dio()..interceptors.add(FakeApiRoutes.interceptor());
  final res = await dio.get<List<dynamic>>(
    BookFakeApi.books,
    queryParameters: {'sort': sort, if (q.isNotEmpty) 'q': q},
  );
  return [for (final b in res.data!) Book.fromJson(b as Map<String, dynamic>)];
}

bool _ordered(List<Book> books, num Function(Book) key, {bool desc = false}) {
  for (var i = 1; i < books.length; i++) {
    final c = key(books[i - 1]).compareTo(key(books[i]));
    if (desc ? c < 0 : c > 0) return false;
  }
  return true;
}

void main() {
  test('priceLow and priceHigh sort by From-price', () async {
    final low = await _books('priceLow');
    final high = await _books('priceHigh');
    expect(low.length, greaterThan(5));
    expect(_ordered(low, (b) => b.fromPriceBdt), isTrue);
    expect(_ordered(high, (b) => b.fromPriceBdt, desc: true), isTrue);
  });

  test('newest sorts by addedAt, latest first', () async {
    final books = await _books('newest');
    for (var i = 1; i < books.length; i++) {
      expect(books[i - 1].addedAt.isBefore(books[i].addedAt), isFalse);
    }
  });

  test('bestselling sorts by 30-day sales, all Editions together', () async {
    final books = await _books('bestselling');
    expect(_ordered(books, BookSort.sold, desc: true), isTrue);
    final atomic = BookSort.sold(books.firstWhere((b) => b.id == 'bk-atomic'));
    expect(atomic, 175);
    expect(books.first.id, 'bk-atomic');
  });

  test('relevance keeps the match order of the query', () async {
    final books = await _books('relevance', q: 'sapiens');
    expect(books.first.id, 'bk-sapiens');
  });
}
