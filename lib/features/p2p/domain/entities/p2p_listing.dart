import 'package:freezed_annotation/freezed_annotation.dart';

part 'p2p_listing.freezed.dart';
part 'p2p_listing.g.dart';

/// Condition grades a seller can pick when listing a second-hand book.
enum BookCondition { likeNew, good, fair }

enum P2pFilter { all, likeNew, good, fair }

extension P2pFilterX on P2pFilter {
  String get label => switch (this) {
    P2pFilter.all => 'All',
    P2pFilter.likeNew => 'Like New',
    P2pFilter.good => 'Good',
    P2pFilter.fair => 'Fair',
  };
}

/// A student-to-student resale listing.
@freezed
abstract class P2pListing with _$P2pListing {
  const factory P2pListing({
    required String id,
    required String title,
    required String sellerName,
    required String sellerBatch,
    required int priceBdt,
    @Default(BookCondition.good) BookCondition condition,
    @Default(true) bool isAvailable,
    @Default(0) int coverSeed,
  }) = _P2pListing;

  factory P2pListing.fromJson(Map<String, dynamic> json) =>
      _$P2pListingFromJson(json);
}

extension P2pListingX on P2pListing {
  String get sellerLine => '$sellerName · $sellerBatch';

  String get conditionLabel => switch (condition) {
    BookCondition.likeNew => 'Like New',
    BookCondition.good => 'Good',
    BookCondition.fair => 'Fair',
  };

  String get availabilityLabel => isAvailable ? 'Available' : 'Sold';

  bool matchesFilter(P2pFilter filter, String query) {
    final normalizedQuery = query.trim().toLowerCase();
    final queryMatches = normalizedQuery.isEmpty ||
        title.toLowerCase().contains(normalizedQuery) ||
        sellerName.toLowerCase().contains(normalizedQuery) ||
        sellerBatch.toLowerCase().contains(normalizedQuery);

    if (!queryMatches) return false;

    return switch (filter) {
      P2pFilter.all => true,
      P2pFilter.likeNew => condition == BookCondition.likeNew,
      P2pFilter.good => condition == BookCondition.good,
      P2pFilter.fair => condition == BookCondition.fair,
    };
  }
}
