import 'package:freezed_annotation/freezed_annotation.dart';

part 'p2p_listing.freezed.dart';
part 'p2p_listing.g.dart';

enum BookCondition { likeNew, veryGood, good, acceptable }

enum P2pListingStatus {
  draft,
  inReview,
  changesRequested,
  rejected,
  live,
  sold,
}

enum HandoverMethod { meetInPerson, delivery }

enum P2pFilter { all, likeNew, veryGood, good, acceptable }

extension P2pFilterX on P2pFilter {
  String get label => switch (this) {
    P2pFilter.all => 'All',
    P2pFilter.likeNew => 'Like New',
    P2pFilter.veryGood => 'Very Good',
    P2pFilter.good => 'Good',
    P2pFilter.acceptable => 'Acceptable',
  };
}

@freezed
abstract class P2pListing with _$P2pListing {
  const factory P2pListing({
    required String id,
    required String title,
    required String sellerName,
    required String sellerBatch,
    required int priceBdt,
    @Default(BookCondition.good) BookCondition condition,
    @Default([]) List<String> flags,
    @Default([]) List<String> photos,
    @Default(false) bool isNegotiable,
    @Default(HandoverMethod.meetInPerson) HandoverMethod handover,
    @Default(P2pListingStatus.live) P2pListingStatus status,
    String? rejectionReason,
    String? bookId,
    @Default(0) int coverSeed,
  }) = _P2pListing;

  factory P2pListing.fromJson(Map<String, dynamic> json) =>
      _$P2pListingFromJson(json);
}

extension P2pListingX on P2pListing {
  String get sellerLine => '$sellerName · $sellerBatch';

  String get conditionLabel => switch (condition) {
    BookCondition.likeNew => 'Like New',
    BookCondition.veryGood => 'Very Good',
    BookCondition.good => 'Good',
    BookCondition.acceptable => 'Acceptable',
  };

  String get statusLabel => switch (status) {
    P2pListingStatus.draft => 'Draft',
    P2pListingStatus.inReview => 'In review',
    P2pListingStatus.changesRequested => 'Changes requested',
    P2pListingStatus.rejected => 'Rejected',
    P2pListingStatus.live => 'Live',
    P2pListingStatus.sold => 'Sold',
  };

  bool get isAvailable => status == P2pListingStatus.live;

  String get availabilityLabel => isAvailable ? 'Available' : 'Sold';

  bool matchesFilter(P2pFilter filter, String query) {
    final normalizedQuery = query.trim().toLowerCase();
    final queryMatches =
        normalizedQuery.isEmpty ||
        title.toLowerCase().contains(normalizedQuery) ||
        sellerName.toLowerCase().contains(normalizedQuery) ||
        sellerBatch.toLowerCase().contains(normalizedQuery);

    if (!queryMatches) return false;

    return switch (filter) {
      P2pFilter.all => true,
      P2pFilter.likeNew => condition == BookCondition.likeNew,
      P2pFilter.veryGood => condition == BookCondition.veryGood,
      P2pFilter.good => condition == BookCondition.good,
      P2pFilter.acceptable => condition == BookCondition.acceptable,
    };
  }
}
