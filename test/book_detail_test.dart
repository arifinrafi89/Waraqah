import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/app/router/app_routes.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/catalog/data/repositories/book_repository_impl.dart';
import 'package:waraqah/features/catalog/data/sources/book_details_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/book_details_source.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog/data/sources/book_remote_source.dart';
import 'package:waraqah/features/catalog/domain/entities/book_details.dart';
import 'package:waraqah/features/catalog/domain/entities/vendor_offer.dart';

/// A Dio that fails every request at once, so sources take their seed path.
Dio _offlineDio() => Dio()
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) =>
          handler.reject(DioException(requestOptions: options)),
    ),
  );

class _SingleBookSource extends BookRemoteSource {
  _SingleBookSource(this.book) : super(_offlineDio());
  final Book book;

  @override
  Future<List<Book>> fetchBooks({String? category, String query = ''}) async =>
      [book];
}

BookRepositoryImpl _repository([BookRemoteSource? books]) => BookRepositoryImpl(
  books ?? BookRemoteSource(_offlineDio()),
  BookDetailsSource(_offlineDio()),
);

void main() {
  group('Book detail seed', () {
    test('every catalog book has offers that agree with its list entry', () {
      for (final book in BookFixtures.all) {
        final details = BookDetailsFixtures.find(book.id);
        expect(details, isNotNull, reason: book.id);
        final prices = details!.offers.map((offer) => offer.priceBdt);
        final cheapest = details.offers.firstWhere(
          (offer) => offer.priceBdt == prices.reduce((a, b) => a < b ? a : b),
        );
        expect(details.offers.length, book.vendorCount, reason: book.id);
        expect(cheapest.priceBdt, book.priceBdt, reason: book.id);
        expect(cheapest.vendor, book.vendor, reason: book.id);
      }
    });
  });

  group('BookRepository.fetchDetails', () {
    test('returns offers cheapest first', () async {
      final details = await _repository().fetchDetails('bk-atomic');
      final prices = details!.offers.map((offer) => offer.priceBdt).toList();
      expect(prices, [...prices]..sort());
      expect(details.bestOffer!.vendor, 'Rokomari');
    });

    test('returns null for an id that is not in the catalog', () async {
      expect(await _repository().fetchDetails('does-not-exist'), isNull);
    });

    test('without seed data, shows only the offer the catalog knows', () async {
      const book = Book(
        id: 'bk-unseeded',
        title: 'Unseeded',
        author: 'Someone',
        priceBdt: 300,
        vendor: 'Wafilife',
        vendorCount: 3,
      );
      final details = await _repository(_SingleBookSource(book))
          .fetchDetails(book.id);
      expect(details!.offers, [
        const VendorOffer(vendor: 'Wafilife', priceBdt: 300),
      ]);
      expect(details.reviews, isEmpty);
    });
  });

  group('BookDetails helpers', () {
    test('best offer and savings both skip out-of-stock vendors', () {
      const details = BookDetails(
        bookId: 'x',
        offers: [
          VendorOffer(vendor: 'A', priceBdt: 400, inStock: false),
          VendorOffer(vendor: 'B', priceBdt: 450),
          VendorOffer(vendor: 'C', priceBdt: 520),
        ],
      );
      expect(details.bestOffer!.vendor, 'B');
      expect(details.savingsBdt, 70);
    });
  });

  test('book detail route resolves to /catalog/book/:id', () {
    final router = AppRouter.create(startSignedIn: true);
    final location = router.namedLocation(
      RouteNames.bookDetail,
      pathParameters: {'id': 'bk-atomic'},
    );
    expect(location, AppRoutes.bookDetailFor('bk-atomic'));
    expect(location, '/catalog/book/bk-atomic');
  });
}
