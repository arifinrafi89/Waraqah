import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/shared_wishlist.dart';
import '../../domain/usecases/get_shared_wishlist.dart';
import '../../domain/usecases/share_wishlist.dart';
import 'wishlist_providers.dart';

final shareWishlistProvider = Provider<ShareWishlist>(
  (ref) => ShareWishlist(ref.watch(wishlistRepositoryProvider)),
);

final getSharedWishlistProvider = Provider<GetSharedWishlist>(
  (ref) => GetSharedWishlist(ref.watch(wishlistRepositoryProvider)),
);

/// The signed-in reader's own link, turned on when they open the share
/// sheet. Friends see them by their account name.
final myWishlistLinkProvider = FutureProvider.autoDispose<SharedWishlist>(
  (ref) => ref
      .watch(shareWishlistProvider)
      .call(ref.watch(sessionProvider)?.name ?? ''),
);

/// Someone's list from a link, or `null` if it isn't shared.
final sharedWishlistProvider = FutureProvider.autoDispose
    .family<SharedWishlist?, String>(
      (ref, id) => ref.watch(getSharedWishlistProvider).call(id),
    );
