import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_book_repository.dart';
import '../models/book.dart';
import '../repositories/book_repository.dart';

final bookRepositoryProvider =
    Provider<BookRepository>((ref) => DummyBookRepository());

final booksProvider = Provider<List<Book>>(
  (ref) => ref.watch(bookRepositoryProvider).getBooks(),
);
