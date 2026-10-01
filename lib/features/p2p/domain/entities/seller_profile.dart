import 'package:freezed_annotation/freezed_annotation.dart';

import 'p2p_listing.dart';

part 'seller_profile.freezed.dart';

/// What another reader said after a sale.
@freezed
abstract class SellerReview with _$SellerReview {
  const factory SellerReview({
    required String fromName,
    required int stars,
    required DateTime at,
    String? comment,
  }) = _SellerReview;
}

/// A reader as others see them on the used marketplace: who they are,
/// how long they've been here, how many books they've sold, how the
/// people they dealt with rated them, and what they're selling now.
@freezed
abstract class SellerProfile with _$SellerProfile {
  const factory SellerProfile({
    required String id,
    required String name,
    required String area,
    required String district,
    required DateTime memberSince,
    @Default(0) int booksSold,
    @Default(0) int ratingCount,

    /// Average stars, `null` before anyone has rated them.
    double? ratingAverage,

    /// Newest first.
    @Default(<SellerReview>[]) List<SellerReview> reviews,

    /// On sale now.
    @Default(<P2pListing>[]) List<P2pListing> listings,
  }) = _SellerProfile;
}
