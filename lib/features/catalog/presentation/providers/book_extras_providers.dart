import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/dio_provider.dart';
import '../../data/repositories/book_extras_repository_impl.dart';
import '../../data/sources/book_extras_source.dart';
import '../../domain/entities/book_series.dart';
import '../../domain/entities/look_inside.dart';
import '../../domain/repositories/book_extras_repository.dart';
import '../../domain/usecases/get_look_inside.dart';
import '../../domain/usecases/get_lowest_price_editions.dart';
import '../../domain/usecases/get_series.dart';

final bookExtrasRepositoryProvider = Provider<BookExtrasRepository>(
  (ref) => BookExtrasRepositoryImpl(BookExtrasSource(ref.watch(dioProvider))),
);

final getLookInsideProvider = Provider<GetLookInside>(
  (ref) => GetLookInside(ref.watch(bookExtrasRepositoryProvider)),
);

final getSeriesProvider = Provider<GetSeries>(
  (ref) => GetSeries(ref.watch(bookExtrasRepositoryProvider)),
);

final getLowestPriceEditionsProvider = Provider<GetLowestPriceEditions>(
  (ref) => GetLowestPriceEditions(ref.watch(bookExtrasRepositoryProvider)),
);

/// Edition ids of [Book] at their lowest price in 30 days.
final lowestPriceEditionsProvider = FutureProvider.family<Set<String>, Book>(
  (ref, book) => ref.watch(getLowestPriceEditionsProvider).call(book),
);

/// A book's contents and sample pages, by book id; `null` when there are
/// none.
final lookInsideProvider = FutureProvider.family<LookInside?, String>(
  (ref, bookId) => ref.watch(getLookInsideProvider).call(bookId),
);

/// The series a book is in, by book id; `null` when it isn't in one.
final seriesProvider = FutureProvider.family<BookSeries?, String>(
  (ref, bookId) => ref.watch(getSeriesProvider).call(bookId),
);
