import '../../domain/entities/coupon.dart';
import '../models/coupon_model.dart';

/// Demo coupons for the fake API. They are only the starting set: staff add
/// more in the Admin area (see `CouponFakeStore`).
abstract final class CheckoutFixtures {
  /// WELCOME10: 10% off, up to ৳150. EID100: ৳100 off orders of ৳1,000+.
  /// FREESHIP: free delivery on orders of ৳500+.
  static const List<CouponModel> coupons = [
    CouponModel(
      code: 'WELCOME10',
      kind: CouponKind.percentOff,
      value: 10,
      maxDiscountBdt: 150,
    ),
    CouponModel(
      code: 'EID100',
      kind: CouponKind.amountOff,
      value: 100,
      minOrderBdt: 1000,
    ),
    CouponModel(
      code: 'FREESHIP',
      kind: CouponKind.freeDelivery,
      minOrderBdt: 500,
    ),
  ];
}
