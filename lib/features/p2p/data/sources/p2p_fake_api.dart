import 'package:dio/dio.dart';

import '../../domain/entities/p2p_listing.dart';
import '../models/p2p_listing_model.dart';
import 'p2p_fake_store.dart';
import 'p2p_people.dart';
import 'p2p_seller_json.dart';

/// The used marketplace's fake endpoints, merged into `FakeApiInterceptor`
/// by `app/fake_api_routes.dart`. The inbox changes the same store.
abstract final class P2pFakeApi {
  /// Listings on sale or reserved, newest first. `?available=true` keeps
  /// only those others can buy now; `?limit=4` caps the list.
  static const String listings = '/p2p/listings';

  /// The signed-in reader's own listings, in any status.
  static const String mine = '/p2p/listings/mine';

  /// `?bookId=bk-cleancode`: copies of a catalog book others are selling.
  static const String forBook = '/p2p/listings/for-book';

  /// `?id=p2p-1`; answers the listing or `null`.
  static const String listing = '/p2p/listing';

  /// `?id=p-nabila`: a reader's seller page, or `null`.
  static const String seller = '/p2p/seller';

  static Map<String, Object? Function(RequestOptions)> routes(
    P2pFakeStore store,
  ) {
    List<Object?> answer(Iterable<P2pListingModel> listings) => [
      for (final listing in listings) store.json(listing),
    ];
    return {
      listings: (options) {
        final query = options.queryParameters;
        final onlyAvailable = query['available'] == 'true';
        final found = store.all.where(
          (l) => onlyAvailable
              ? l.status == P2pListingStatus.live && l.sellerId != P2pPeople.me
              : l.toEntity().isOpen,
        );
        final limit = int.tryParse('${query['limit']}');
        return answer(limit == null ? found : found.take(limit));
      },
      mine: (_) => answer(store.all.where((l) => l.sellerId == P2pPeople.me)),
      forBook: (options) => answer(
        store.all.where(
          (l) =>
              l.bookId == options.queryParameters['bookId'] &&
              l.status == P2pListingStatus.live &&
              l.sellerId != P2pPeople.me,
        ),
      ),
      seller: (options) =>
          store.sellerJson(options.queryParameters['id'] as String? ?? ''),
      listing: (options) {
        final found = store.find(
          options.queryParameters['id'] as String? ?? '',
        );
        return found == null ? null : store.json(found);
      },
    };
  }
}
