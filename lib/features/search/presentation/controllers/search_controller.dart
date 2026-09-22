import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/providers/book_providers.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

/// Case-insensitive substring match on title, author and genre. Empty for
/// an empty query — the page shows the idle state instead.
final searchResultsProvider = FutureProvider<List<Book>>((ref) async {
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();
  if (query.isEmpty) return const [];
  final books = await ref.watch(booksProvider.future);
  return books.where((book) {
    return book.title.toLowerCase().contains(query) ||
        book.author.toLowerCase().contains(query) ||
        book.genre.toLowerCase().contains(query);
  }).toList();
});
