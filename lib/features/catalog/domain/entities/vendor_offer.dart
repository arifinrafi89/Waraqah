import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/edition.dart';

part 'vendor_offer.freezed.dart';
part 'vendor_offer.g.dart';

/// One vendor's price for a title. The proposal's "Book Listings" table:
/// the same book can be listed by several vendors in different editions.
@freezed
abstract class VendorOffer with _$VendorOffer {
  const factory VendorOffer({
    required String vendor,
    required int priceBdt,
    @Default(BookFormat.paperback) BookFormat format,
    @Default(3) int deliveryDays,
    @Default(true) bool inStock,
  }) = _VendorOffer;

  factory VendorOffer.fromJson(Map<String, dynamic> json) =>
      _$VendorOfferFromJson(json);
}
