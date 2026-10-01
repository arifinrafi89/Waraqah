import '../../domain/entities/coupon.dart';
import '../models/coupon_model.dart';
import '../models/saved_address_model.dart';

/// Demo addresses and coupons for the fake API. Addresses move to the
/// profile's saved addresses once Niloy's work lands. Coupons are only the
/// starting set: staff add more in the Admin area (see `CouponFakeStore`).
abstract final class CheckoutFixtures {
  static const List<SavedAddressModel> addresses = [
    SavedAddressModel(
      id: 'addr-home',
      label: 'Home',
      recipient: 'Rahim Uddin',
      phone: '01711-000000',
      line: 'House 12, Road 5, Dhanmondi',
      upazila: 'Dhanmondi',
      district: 'Dhaka',
      division: 'Dhaka',
    ),
    SavedAddressModel(
      id: 'addr-family',
      label: 'Family home',
      recipient: 'Rahim Uddin',
      phone: '01711-000000',
      line: 'Mira Bazar, Zindabazar',
      upazila: 'Sylhet Sadar',
      district: 'Sylhet',
      division: 'Sylhet',
    ),
  ];

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

  static SavedAddressModel? address(String id) =>
      addresses.where((a) => a.id == id).firstOrNull;
}
