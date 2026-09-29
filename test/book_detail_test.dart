import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/models/edition.dart';
import 'package:waraqah/features/catalog/data/repositories/book_details_repository_impl.dart';
import 'package:waraqah/features/catalog/data/repositories/book_repository_impl.dart';
import 'package:waraqah/features/catalog/data/sources/book_details_source.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/book_remote_source.dart';

/// A Dio that fails every request at once, so sources take their seed path.
Dio _offlineDio() => Dio()
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) =>
          handler.reject(DioException(requestOptions: options)),
    ),
  );

/// Serves a fixed book list, so these tests don't depend on how the catalog
/// source reaches its data (seed fallback today, a fake API later).
class _StaticBookSource extends BookRemoteSource {
  _StaticBookSource(this.books) : super(_offlineDio());
  final List<Book> books;

  @override
  Future<List<Book>> fetchBooks({String? category, String query = ''}) async =>
      books;
}

BookDetailsRepositoryImpl _repository([List<Book>? books]) =>
    BookDetailsRepositoryImpl(
      BookRepositoryImpl(_StaticBookSource(books ?? BookFixtures.all)),
      BookDetailsSource(_offlineDio()),
    );

void main() {
  group('BookDetailsRepository.fetchDetails', () {
    test('returns the seeded reviews and publication facts', () async {
      final details = await _repository().fetchDetails('bk-atomic');
      expect(details!.reviews, isNotEmpty);
      expect(details.publisher, isNotNull);
    });

    test('returns null for an id that is not in the catalog', () async {
      expect(await _repository().fetchDetails('does-not-exist'), isNull);
    });

    test('without seed data, returns empty details for a known book', () async {
      final book = Book(
        id: 'bk-unseeded',
        title: 'Unseeded',
        author: 'Someone',
        category: 'C',
        section: Section.academic,
        originalLanguage: BookLanguage.english,
        editions: [
          Edition(
            id: 'bk-unseeded-pb',
            format: BookFormat.paperback,
            language: BookLanguage.english,
            priceBdt: 300,
            stock: 5,
          ),
        ],
      );
      final details = await _repository([book]).fetchDetails(book.id);
      expect(details!.reviews, isEmpty);
      expect(details.description, isNull);
    });
  });
}
