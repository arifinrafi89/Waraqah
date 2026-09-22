import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/providers/book_providers.dart';

final catalogBookFilterProvider =
    StateProvider<BookFilter>((ref) => BookFilter.all);

final catalogBookSortProvider =
    StateProvider<BookSort>((ref) => BookSort.none);

/// Catalog grid, filtered and sorted by the active selections.
final filteredCatalogBooksProvider = FutureProvider<List<Book>>((ref) async {
  final filter = ref.watch(catalogBookFilterProvider);
  final sort = ref.watch(catalogBookSortProvider);
  final books = await ref.watch(booksProvider.future);
  return sortBooks(filterBooks(books, filter), sort);
});
