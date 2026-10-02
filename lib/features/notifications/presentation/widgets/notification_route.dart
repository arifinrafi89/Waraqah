import '../../../bites/bites_routes.dart';
import '../../../catalog/catalog_routes.dart';
import '../../../handled_sale/handled_sale_routes.dart';
import '../../../orders/orders_routes.dart';
import '../../../p2p/p2p_routes.dart';
import '../../../readers/readers_routes.dart';
import '../../../sell_back/sell_back_routes.dart';
import '../../domain/entities/app_notification.dart';
import '../../domain/entities/notification_kind.dart';

/// The page a notification's [target] opens.
String notificationRoute(NotificationTarget target) => switch (target.kind) {
  NotificationTargetKind.order => OrdersRoutes.detailsFor(target.id),
  NotificationTargetKind.listing => P2pRoutes.listingDetailFor(target.id),
  NotificationTargetKind.myListings => P2pRoutes.myListings,
  NotificationTargetKind.sale => HandledSaleRoutes.saleFor(target.id),
  NotificationTargetKind.sellBack => SellBackRoutes.mine,
  NotificationTargetKind.book => CatalogRoutes.bookDetailFor(target.id),
  NotificationTargetKind.bite => BitesRoutes.detailFor(target.id),
  NotificationTargetKind.reader => ReadersRoutes.readerFor(target.id),
};
