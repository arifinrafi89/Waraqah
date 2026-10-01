import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/seller_profile.dart';
import 'p2p_listing_model.dart';

part 'seller_profile_model.freezed.dart';
part 'seller_profile_model.g.dart';

@freezed
abstract class SellerReviewModel with _$SellerReviewModel {
  const factory SellerReviewModel({
    required String fromName,
    required int stars,
    required DateTime at,
    String? comment,
  }) = _SellerReviewModel;

  factory SellerReviewModel.fromJson(Map<String, dynamic> json) =>
      _$SellerReviewModelFromJson(json);
}

/// JSON shape of a [SellerProfile].
@freezed
abstract class SellerProfileModel with _$SellerProfileModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory SellerProfileModel({
    required String id,
    required String name,
    required String area,
    required String district,
    required DateTime memberSince,
    @Default(0) int booksSold,
    @Default(0) int ratingCount,
    double? ratingAverage,
    @Default(<SellerReviewModel>[]) List<SellerReviewModel> reviews,
    @Default(<P2pListingModel>[]) List<P2pListingModel> listings,
  }) = _SellerProfileModel;

  factory SellerProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SellerProfileModelFromJson(json);
}

extension SellerProfileModelX on SellerProfileModel {
  SellerProfile toEntity() => SellerProfile(
    id: id,
    name: name,
    area: area,
    district: district,
    memberSince: memberSince,
    booksSold: booksSold,
    ratingCount: ratingCount,
    ratingAverage: ratingAverage,
    reviews: [
      for (final review in reviews)
        SellerReview(
          fromName: review.fromName,
          stars: review.stars,
          at: review.at,
          comment: review.comment,
        ),
    ],
    listings: [for (final listing in listings) listing.toEntity()],
  );
}
