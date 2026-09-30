import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';

part 'used_options.freezed.dart';

/// One used copy of a book: a Certified Used copy Waraqah resells, or a
/// reader's listing (then [sellerName] and [area] are set).
@freezed
abstract class UsedCopy with _$UsedCopy {
  const factory UsedCopy({
    required String id,
    required int priceBdt,
    required BookCondition condition,
    String? sellerName,
    String? area,
  }) = _UsedCopy;
}

/// Every second-hand way to get a book, plus what it resells for.
///
/// "Used options for a book" is Arifin's shared piece; until it lands, the
/// book page fakes it here with the same fields, and switches over then.
@freezed
abstract class UsedOptions with _$UsedOptions {
  const factory UsedOptions({
    UsedCopy? certifiedUsed,
    @Default(<UsedCopy>[]) List<UsedCopy> listings,

    /// What a used copy usually sells back for, if we know.
    int? resaleValueBdt,
  }) = _UsedOptions;
}

extension UsedOptionsX on UsedOptions {
  /// The cheapest reader listing, or `null` when there are none.
  UsedCopy? get cheapestListing => listings.isEmpty
      ? null
      : listings.reduce((a, b) => b.priceBdt < a.priceBdt ? b : a);

  bool get hasCopies => certifiedUsed != null || listings.isNotEmpty;
}
