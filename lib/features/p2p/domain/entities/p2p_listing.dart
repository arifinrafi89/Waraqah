import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';

part 'p2p_listing.freezed.dart';

enum BookCondition { likeNew, veryGood, good, acceptable }

/// Where a listing is in its life. A moderator takes it from [inReview] to
/// [live]; accepting a buyer's offer makes it [reserved] for that buyer,
/// and the seller marks it [sold] after the handover (or makes it [live]
/// again if the deal falls through).
enum P2pListingStatus {
  draft,
  inReview,
  changesRequested,
  rejected,
  live,
  reserved,
  sold,
}

/// How the seller would rather hand the book over. Buyers can still
/// suggest the other way in their offer.
enum HandoverMethod { meetInPerson, delivery }

/// A used book a Reader offers for sale.
@freezed
abstract class P2pListing with _$P2pListing {
  const factory P2pListing({
    required String id,
    required String title,
    required String sellerId,
    required String sellerName,
    required int priceBdt,
    @Default(BookCondition.good) BookCondition condition,
    @Default(<String>[]) List<String> flags,
    @Default(<String>[]) List<String> photos,
    @Default(false) bool isNegotiable,
    @Default(HandoverMethod.meetInPerson) HandoverMethod handover,
    @Default(P2pListingStatus.live) P2pListingStatus status,

    /// The signed-in reader is the seller. The server works this out.
    @Default(false) bool isMine,

    /// Reserved for, or sold to, the signed-in reader.
    @Default(false) bool isMyDeal,
    String? rejectionReason,
    String? bookId,
    @Default(0) int coverSeed,
    String? district,
    String? area,

    /// The catalog Category, and its Section, the server files it under.
    String? categoryId,
    Section? section,
    int? newPriceBdt,

    /// The seller's own words about the copy.
    String? note,
  }) = _P2pListing;
}

extension P2pListingX on P2pListing {
  /// Buyers can make offers.
  bool get isAvailable => status == P2pListingStatus.live;

  bool get isReserved => status == P2pListingStatus.reserved;

  bool get isSold => status == P2pListingStatus.sold;

  /// Shown in the marketplace: on sale, or reserved and maybe back soon.
  bool get isOpen => isAvailable || isReserved;

  /// "Dhanmondi, Dhaka".
  String get place => [?area, ?district].join(', ');

  int? get saveAmount => (newPriceBdt != null && newPriceBdt! > priceBdt)
      ? newPriceBdt! - priceBdt
      : null;
}
