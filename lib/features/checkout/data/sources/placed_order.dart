// The fake backend keeps orders where the orders feature reads them.
import '../../../cart/domain/entities/cart.dart';
import '../../../cart/domain/entities/cart_line.dart';
import '../../../orders/data/models/order_model.dart';
import '../../../orders/data/models/order_parts_model.dart';
import '../../../orders/domain/entities/order_status.dart';
import '../../domain/entities/checkout_totals.dart';
import '../../domain/entities/payment_method.dart';
import '../../../profile/domain/entities/saved_address.dart';

/// The order the fake server saves when checkout places one: the cart's
/// lines as they are now, the address, the payment, the totals and, for a
/// gift, who it's for.
OrderModel placedOrder({
  required String number,
  required DateTime at,
  required Cart cart,
  required SavedAddress address,
  required CheckoutTotals totals,
  required PaymentMethod payment,
  int pointsUsed = 0,
  int pointsEarned = 0,
  OrderGiftModel? gift,
  int walletUsed = 0,
}) => OrderModel(
  number: number,
  placedAt: at,
  status: OrderStatus.placed,
  lines: [for (final line in cart.lines) _line(line)],
  history: [StatusChangeModel(status: OrderStatus.placed, at: at)],
  addressLabel: address.label,
  addressLine: address.oneLine,
  payment: payment,
  subtotalBdt: totals.subtotalBdt,
  deliveryFeeBdt: totals.deliveryFeeBdt,
  discountBdt: totals.couponDiscountBdt,
  totalBdt: totals.totalBdt,
  needsDelivery: totals.needsDelivery,
  pointsUsed: pointsUsed,
  pointsEarned: pointsEarned,
  gift: gift,
  giftWrapBdt: totals.giftWrapBdt,
  walletUsedBdt: walletUsed,
);

OrderLineModel _line(CartLine line) => OrderLineModel(
  bookId: line.bookId,
  title: line.title,
  author: line.author,
  quantity: line.quantity,
  unitPriceBdt: line.unitPriceBdt,
  format: line.format,
  language: line.language,
  coverSeed: line.coverSeed,
  editionId: line.kind == CartItemKind.edition ? line.itemId : null,
);
