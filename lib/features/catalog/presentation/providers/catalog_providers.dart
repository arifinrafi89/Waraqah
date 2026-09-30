import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../data/repositories/book_repository_impl.dart';
import '../../data/repositories/catalog_records_repository_impl.dart';
import '../../data/sources/book_remote_source.dart';
import '../../data/sources/catalog_records_source.dart';
import '../../domain/entities/publisher.dart';
import '../../domain/repositories/book_repository.dart';
import '../../domain/repositories/catalog_records_repository.dart';

/// The catalog block's public Riverpod surface. Other features (home, the AI
/// assistant) read [bookRepositoryProvider] and never see the data layer.
final bookRepositoryProvider = Provider<BookRepository>(
  (ref) => BookRepositoryImpl(BookRemoteSource(ref.watch(dioProvider))),
);

/// Which category pill is selected, by Category id; `null` is the "All" pill.
final catalogCategoryProvider = selectionProvider<String?>(null);

/// Current search text.
final catalogQueryProvider = selectionProvider<String>('');

/// The filtered, sorted result list the catalog screen renders.
final catalogResultsProvider = FutureProvider<List<Book>>((ref) async {
  final repository = ref.watch(bookRepositoryProvider);
  return repository.searchCatalog(
    category: ref.watch(catalogCategoryProvider),
    query: ref.watch(catalogQueryProvider),
  );
});

/// Total catalog size, shown in the app bar subtitle.
final catalogTotalProvider = FutureProvider<int>((ref) async {
  final books = await ref.watch(bookRepositoryProvider).searchCatalog();
  return books.length;
});

final catalogRecordsRepositoryProvider = Provider<CatalogRecordsRepository>(
  (ref) => CatalogRecordsRepositoryImpl(
    CatalogRecordsSource(ref.watch(dioProvider)),
  ),
);

/// One Publisher by id; `null` when unknown.
final publisherProvider = FutureProvider.family<Publisher?, String>(
  (ref, id) => ref.watch(catalogRecordsRepositoryProvider).publisher(id),
);
