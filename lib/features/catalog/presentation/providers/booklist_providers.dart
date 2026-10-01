import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/booklist_repository_impl.dart';
import '../../data/sources/booklist_remote_source.dart';
import '../../domain/entities/booklist.dart';
import '../../domain/entities/catalog_filters.dart';
import '../../domain/repositories/booklist_repository.dart';
import '../../domain/usecases/get_booklists.dart';
import '../../domain/usecases/my_booklist.dart';
import 'catalog_providers.dart';

final booklistRepositoryProvider = Provider<BooklistRepository>(
  (ref) => BooklistRepositoryImpl(BooklistRemoteSource(ref.watch(dioProvider))),
);

/// Every Staff Booklist and the Reader's own.
final booklistsProvider = FutureProvider<List<Booklist>>(
  (ref) =>
      GetBooklists(ref.watch(booklistRepositoryProvider))(const NoParams()),
);

/// One Booklist by id; `null` when unknown.
final booklistProvider = FutureProvider.family<Booklist?, String>(
  (ref, id) => GetBooklist(ref.watch(booklistRepositoryProvider))(id),
);

/// The book picker's matches for a query: title, Author or ISBN.
final bookPickerResultsProvider = FutureProvider.autoDispose
    .family<List<Book>, String>(
      (ref, query) => ref
          .watch(bookRepositoryProvider)
          .searchCatalog(CatalogFilters(query: query)),
    );

/// A Reader's changes to their own lists. Each reloads the lists after.
class MyBooklistActions {
  MyBooklistActions(this._ref);

  final Ref _ref;

  BooklistRepository get _repository => _ref.read(booklistRepositoryProvider);

  Future<Booklist> save(MyBooklistChange change) async {
    final saved = await SaveMyBooklist(_repository)(change);
    _refresh();
    return saved;
  }

  Future<void> delete(String id) async {
    await DeleteMyBooklist(_repository)(id);
    _refresh();
  }

  void _refresh() => _ref
    ..invalidate(booklistsProvider)
    ..invalidate(booklistProvider);
}

final myBooklistActionsProvider = Provider<MyBooklistActions>(
  MyBooklistActions.new,
);
