import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/book_details.dart';
import 'catalog_providers.dart';

/// The catalog summary and the detail data for one title, loaded together.
typedef BookDetailData = ({Book book, BookDetails details});

/// Everything the book detail page needs. `null` means the id is unknown.
final bookDetailProvider = FutureProvider.family<BookDetailData?, String>((
  ref,
  id,
) async {
  final repository = ref.watch(bookRepositoryProvider);
  // Both can wait on the network, so fetch them side by side.
  final (book, details) = await (
    repository.findById(id),
    repository.fetchDetails(id),
  ).wait;
  if (book == null || details == null) return null;
  return (book: book, details: details);
});
