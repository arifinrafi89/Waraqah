import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/dio_provider.dart';
import '../../data/repositories/book_details_repository_impl.dart';
import '../../data/sources/book_details_source.dart';
import '../../domain/entities/book_details.dart';
import '../../domain/repositories/book_details_repository.dart';
import 'catalog_providers.dart';

final bookDetailsRepositoryProvider = Provider<BookDetailsRepository>(
  (ref) => BookDetailsRepositoryImpl(
    ref.watch(bookRepositoryProvider),
    BookDetailsSource(ref.watch(dioProvider)),
  ),
);

/// The catalog summary and the detail data for one title, loaded together.
typedef BookDetailData = ({Book book, BookDetails details});

/// Everything the book detail page needs. `null` means the id is unknown.
final bookDetailProvider = FutureProvider.family<BookDetailData?, String>((
  ref,
  id,
) async {
  // Both can wait on the network, so fetch them side by side.
  final (book, details) = await (
    ref.watch(bookRepositoryProvider).findById(id),
    ref.watch(bookDetailsRepositoryProvider).fetchDetails(id),
  ).wait;
  if (book == null || details == null) return null;
  return (book: book, details: details);
});
