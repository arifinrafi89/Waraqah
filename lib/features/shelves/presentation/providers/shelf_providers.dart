import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/state/selection_notifier.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/shelf_repository_impl.dart';
import '../../data/sources/shelf_remote_source.dart';
import '../../domain/entities/shelf_entry.dart';
import '../../domain/repositories/shelf_repository.dart';
import '../../domain/usecases/get_shelves.dart';
import '../../domain/usecases/move_to_shelf.dart';

final shelfRepositoryProvider = Provider<ShelfRepository>(
  (ref) => ShelfRepositoryImpl(ShelfRemoteSource(ref.watch(dioProvider))),
);

final getShelvesProvider = Provider<GetShelves>(
  (ref) => GetShelves(ref.watch(shelfRepositoryProvider)),
);

final moveToShelfProvider = Provider<MoveToShelf>(
  (ref) => MoveToShelf(ref.watch(shelfRepositoryProvider)),
);

/// Every Book on the reader's shelves, newest first. Guests have none.
final shelvesProvider = FutureProvider<List<ShelfEntry>>((ref) async {
  if (ref.watch(sessionProvider) == null) return const [];
  return ref.watch(getShelvesProvider).call(const NoParams());
});

/// The shelf a Book is on, or `null`.
final shelfOfProvider = Provider.family<Shelf?, String>(
  (ref, bookId) => ref
      .watch(shelvesProvider)
      .value
      ?.where((e) => e.book.id == bookId)
      .firstOrNull
      ?.shelf,
);

/// How many Books the reader finished; `null` until the shelves load.
final finishedCountProvider = Provider<int?>(
  (ref) => ref
      .watch(shelvesProvider)
      .value
      ?.where((e) => e.shelf == Shelf.finished)
      .length,
);

/// The shelf the shelves page shows.
final shownShelfProvider = selectionProvider<Shelf>(Shelf.reading);
