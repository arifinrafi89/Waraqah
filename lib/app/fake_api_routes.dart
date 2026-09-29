import 'package:dio/dio.dart';

import '../core/network/api_config.dart';
import '../core/network/fake_api_interceptor.dart';
import '../features/catalog/data/sources/book_fixtures.dart';
import '../features/home/data/sources/ayah_fixtures.dart';

/// The composition root's route table for [FakeApiInterceptor].
///
/// This is the only place allowed to import both `core/network` and feature
/// fixtures — `core/` itself must never import a feature.
abstract final class FakeApiRoutes {
  static FakeApiInterceptor interceptor() => FakeApiInterceptor({
    ApiRoutes.books: _books,
    ApiRoutes.ayahOfTheDay: _ayahOfTheDay,
  });

  static Object _books(RequestOptions options) {
    final category = options.queryParameters['category'] as String?;
    final query = (options.queryParameters['q'] as String? ?? '')
        .trim()
        .toLowerCase();
    final books = BookFixtures.all.where((book) {
      final matchesCategory =
          category == null ||
          book.category == category ||
          // ponytail: the Academic chip is a Section now; ticket 2 replaces the chips.
          book.section?.name == category.toLowerCase();
      final matchesQuery =
          query.isEmpty ||
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    });
    return books.map((book) => book.toJson()).toList();
  }

  static Object _ayahOfTheDay(RequestOptions options) =>
      AyahFixtures.forDate(DateTime.now()).toJson();
}
