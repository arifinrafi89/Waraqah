import 'dart:math';

import '../../../checkout/domain/entities/payment_method.dart';
import 'order.dart';

/// What goes back into the reader's wallet, worked out the same way on the
/// phone and on the server.
extension OrderRefunds on Order {
  /// Cancelling gives back what was paid: the wallet part always, and the
  /// rest only if it was paid up front (cash on delivery was never paid).
  int get cancelRefundBdt => walletUsedBdt + (payment.isPrepaid ? totalBdt : 0);

  /// An approved return gives back what the books cost, whether paid by
  /// wallet, up front or at the door; delivery and gift wrap stay paid.
  int get returnRefundBdt =>
      max(0, totalBdt + walletUsedBdt - deliveryFeeBdt - giftWrapBdt);
}
