import 'package:freezed_annotation/freezed_annotation.dart';

part 'p2p_listing.freezed.dart';
part 'p2p_listing.g.dart';

/// Condition grades a seller can pick when listing a second-hand book.
enum BookCondition { likeNew, good, fair }

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
}
