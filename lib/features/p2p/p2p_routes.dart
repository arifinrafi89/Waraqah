import 'package:go_router/go_router.dart';

import 'presentation/pages/p2p_add_listing_page.dart';
import 'presentation/pages/p2p_listing_detail_page.dart';
import 'presentation/pages/p2p_my_listings_page.dart';
import 'presentation/pages/p2p_page.dart';
import 'presentation/pages/seller_page.dart';

abstract final class P2pRoutes {
  static const String p2p = '/p2p';
  static const String addListing = '/p2p/add-listing';
  static const String myListings = '/p2p/my-listings';
  static const String listingDetail = '/p2p/listing/:id';

  static String listingDetailFor(String id) => '/p2p/listing/$id';

  /// A reader's seller page: who they are, ratings, what's on sale.
  static String sellerFor(String id) => '/p2p/seller/$id';

  static final List<RouteBase> routes = [
    GoRoute(path: addListing, builder: (_, _) => const P2pAddListingPage()),
    GoRoute(path: myListings, builder: (_, _) => const P2pMyListingsPage()),
    GoRoute(
      path: listingDetail,
      builder: (_, state) =>
          P2pListingDetailPage(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/p2p/seller/:id',
      builder: (_, state) => SellerPage(id: state.pathParameters['id'] ?? ''),
    ),
  ];

  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [GoRoute(path: p2p, builder: (_, _) => const P2pPage())],
  );
}
