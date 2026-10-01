import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/dio_provider.dart';
import '../../data/repositories/book_repository_impl.dart';
import '../../data/repositories/catalog_records_repository_impl.dart';
import '../../data/sources/book_remote_source.dart';
import '../../data/sources/catalog_records_source.dart';
import '../../domain/entities/author.dart';
import '../../domain/entities/catalog_filters.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/collection.dart';
import '../../domain/entities/publisher.dart';
import '../../domain/entities/subject.dart';
import '../../domain/repositories/book_repository.dart';
import '../../domain/usecases/get_collections.dart';
import '../../domain/repositories/catalog_records_repository.dart';
import 'section_filters_provider.dart';

/// The catalog block's public Riverpod surface. Other features (home, the AI
/// assistant) read [bookRepositoryProvider] and never see the data layer.
final bookRepositoryProvider = Provider<BookRepository>(
  (ref) => BookRepositoryImpl(BookRemoteSource(ref.watch(dioProvider))),
);

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

/// A Section's Categories.
final sectionCategoriesProvider =
    FutureProvider.family<List<Category>, Section>(
      (ref, section) =>
          ref.watch(catalogRecordsRepositoryProvider).categories(section),
    );

/// Every Book in one Category, newest first.
final categoryBooksProvider = FutureProvider.family<List<Book>, String>(
  (ref, id) => ref
      .watch(bookRepositoryProvider)
      .searchCatalog(CatalogFilters(categoryId: id)),
);

/// One Author by id; `null` when unknown.
final authorProvider = FutureProvider.family<Author?, String>(
  (ref, id) => ref.watch(catalogRecordsRepositoryProvider).author(id),
);

/// Every Book by one Author, newest first.
final authorBooksProvider = FutureProvider.family<List<Book>, String>(
  (ref, id) => ref
      .watch(bookRepositoryProvider)
      .searchCatalog(CatalogFilters(authorId: id)),
);

/// One Publisher by id; `null` when unknown.
final publisherProvider = FutureProvider.family<Publisher?, String>(
  (ref, id) => ref.watch(catalogRecordsRepositoryProvider).publisher(id),
);

/// Every Book from one Publisher, newest first.
final publisherBooksProvider = FutureProvider.family<List<Book>, String>(
  (ref, id) => ref
      .watch(bookRepositoryProvider)
      .searchCatalog(CatalogFilters(publisherId: id)),
);

/// The Books in one Section with its page's Class, Exam and Subject picks,
/// newest first.
final sectionBooksProvider = FutureProvider.autoDispose
    .family<List<Book>, Section>(
      (ref, section) => ref
          .watch(bookRepositoryProvider)
          .searchCatalog(ref.watch(sectionFiltersProvider(section))),
    );

/// Subjects with Books in a Section.
final sectionSubjectsProvider = FutureProvider.family<List<Subject>, Section>(
  (ref, section) =>
      ref.watch(catalogRecordsRepositoryProvider).subjects(section),
);

/// Every Collection (`null`), or one Section's, Expert Picks included.
final collectionsProvider = FutureProvider.family<List<Collection>, Section?>(
  (ref, section) => GetCollections(ref.watch(catalogRecordsRepositoryProvider))(
    (section: section, hasExpert: null),
  ),
);

/// One Collection by id; `null` when unknown.
final collectionProvider = FutureProvider.family<Collection?, String>(
  (ref, id) => GetCollection(ref.watch(catalogRecordsRepositoryProvider))(id),
);
