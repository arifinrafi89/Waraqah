/// The money in a Waraqah-handled sale.
abstract final class SaleMath {
  /// Courier delivery, paid by the buyer.
  static const int deliveryBdt = 80;

  /// Waraqah's share, taken from the seller's price.
  static const double feeShare = 0.05;
  static const int minFeeBdt = 10;

  static const int maxDisputeNote = 300;
  static const int maxDisputePhotos = 3;

  static int feeFor(int priceBdt) {
    final fee = (priceBdt * feeShare).round();
    return fee < minFeeBdt ? minFeeBdt : fee;
  }

  static int sellerGets(int priceBdt) => priceBdt - feeFor(priceBdt);

  static int buyerPays(int priceBdt) => priceBdt + deliveryBdt;
}
