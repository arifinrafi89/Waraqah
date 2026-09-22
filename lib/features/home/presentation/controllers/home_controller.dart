import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/providers/book_providers.dart';

final homeBookFilterProvider =
    StateProvider<BookFilter>((ref) => BookFilter.all);

final homeBookSortProvider =
    StateProvider<BookSort>((ref) => BookSort.none);

/// New Books grid, filtered and sorted by the active selections.
final filteredBooksProvider = Provider<List<Book>>((ref) {
  final filter = ref.watch(homeBookFilterProvider);
  final sort = ref.watch(homeBookSortProvider);
  final books = ref.watch(booksProvider);
  return sortBooks(filterBooks(books, filter), sort);
});
