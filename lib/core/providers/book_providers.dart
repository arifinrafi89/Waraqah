import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_book_repository.dart';
import '../models/book.dart';
import '../repositories/book_repository.dart';

/// "All Books / Beneficial / Non-Beneficial" filter chip selection.
enum BookFilter { all, beneficial, nonBeneficial }

/// Book grid sort order.
enum BookSort { none, priceLowToHigh, ratingHighToLow }

final bookRepositoryProvider =
    Provider<BookRepository>((ref) => DummyBookRepository());

final booksProvider = Provider<List<Book>>(
  (ref) => ref.watch(bookRepositoryProvider).getBooks(),
);

List<Book> filterBooks(List<Book> books, BookFilter filter) {
  switch (filter) {
    case BookFilter.all:
      return books;
    case BookFilter.beneficial:
      return books.where((book) => book.isBeneficial).toList();
    case BookFilter.nonBeneficial:
      return books.where((book) => !book.isBeneficial).toList();
  }
}

List<Book> sortBooks(List<Book> books, BookSort sort) {
  switch (sort) {
    case BookSort.none:
      return books;
    case BookSort.priceLowToHigh:
      return [...books]..sort((a, b) => a.price.compareTo(b.price));
    case BookSort.ratingHighToLow:
      return [...books]..sort((a, b) => b.rating.compareTo(a.rating));
  }
}
