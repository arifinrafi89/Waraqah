// The dashboard sums up other features' records, so it reads their fake
// stores directly (the Go backend runs these as queries).
import '../../../book_request/data/sources/book_request_demand.dart';
import '../../../book_request/data/sources/book_request_fake_store.dart';
import '../../../handled_sale/data/sources/handled_sale_fake_money.dart';
import '../../../handled_sale/data/sources/handled_sale_fake_store.dart';
import '../../../moderation/data/sources/moderation_fake_reports.dart';
import '../../../moderation/data/sources/moderation_fake_store.dart';
import '../../../orders/data/sources/order_fake_store.dart';
import '../../../orders/domain/entities/order_status.dart';
import '../../../p2p/data/sources/p2p_fake_store.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import 'search_log.dart';

/// Today's numbers for Staff: orders and sales, what waits for a
/// moderator, and what readers look for.
class DashboardFakeStore {
  DashboardFakeStore({
    required this.orders,
    required this.p2p,
    required this.moderation,
    required this.sales,
    required this.requests,
    required this.searches,
  });

  final OrderFakeStore orders;
  final P2pFakeStore p2p;
  final ModerationFakeStore moderation;
  final HandledSaleFakeStore sales;
  final BookRequestFakeStore requests;
  final SearchLog searches;

  Map<String, dynamic> json() {
    final now = orders.now();
    final today = [
      for (final o in orders.all)
        if (o.placedAt.year == now.year &&
            o.placedAt.month == now.month &&
            o.placedAt.day == now.day &&
            o.status != OrderStatus.cancelled)
          o,
    ];
    return {
      'ordersToday': today.length,
      'salesTodayBdt': today.fold(0, (sum, o) => sum + o.totalBdt),
      'ordersToShip': orders.all
          .where((o) => o.status.index < OrderStatus.shipped.index)
          .length,
      'listingsWaiting': p2p.all
          .where((l) => l.status == P2pListingStatus.inReview)
          .length,
      'openReports': moderation.openReportsJson().length,
      'openDisputes': sales.disputesJson().length,
      'topSearches': searches.top(),
      'topRequested': requests.demand().take(5).toList(),
    };
  }
}
