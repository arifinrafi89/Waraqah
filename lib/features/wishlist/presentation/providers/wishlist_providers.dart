import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repositories/wishlist_repository_impl.dart';
import '../../data/sources/wishlist_remote_source.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../../domain/usecases/get_wishlist.dart';
import '../../domain/usecases/set_wishlisted.dart';

final wishlistRepositoryProvider = Provider<WishlistRepository>(
  (ref) => WishlistRepositoryImpl(WishlistRemoteSource(ref.watch(dioProvider))),
);

final getWishlistProvider = Provider<GetWishlist>(
  (ref) => GetWishlist(ref.watch(wishlistRepositoryProvider)),
);

final setWishlistedProvider = Provider<SetWishlisted>(
  (ref) => SetWishlisted(ref.watch(wishlistRepositoryProvider)),
);

/// The reader's saved books, newest first. Pages change it through
/// `ref.setWishlisted(...)` (see `wishlist_action.dart`).
class WishlistNotifier extends AsyncNotifier<List<Book>> {
  @override
  Future<List<Book>> build() =>
      ref.read(getWishlistProvider).call(const NoParams());

  /// Saves or removes a book. With [book] at hand the change shows straight
  /// away; either way the old list comes back if the request fails.
  Future<void> set(String bookId, {required bool saved, Book? book}) async {
    final previous = state.value;
    if (previous != null && (!saved || book != null)) {
      final others = previous.where((b) => b.id != bookId);
      state = AsyncData([if (saved) book!, ...others]);
    }
    try {
      state = AsyncData(
        await ref
            .read(setWishlistedProvider)
            .call(SetWishlistedParams(bookId: bookId, saved: saved)),
      );
    } catch (_) {
      if (previous != null) state = AsyncData(previous);
      rethrow;
    }
  }
}

final wishlistProvider = AsyncNotifierProvider<WishlistNotifier, List<Book>>(
  WishlistNotifier.new,
);

/// Whether one book is saved, for its heart button.
final isWishlistedProvider = Provider.family<bool, String>(
  (ref, bookId) =>
      ref.watch(wishlistProvider).value?.any((b) => b.id == bookId) ?? false,
);

final wishlistCountProvider = Provider<int>(
  (ref) => ref.watch(wishlistProvider).value?.length ?? 0,
);
