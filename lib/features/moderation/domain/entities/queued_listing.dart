import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';

part 'queued_listing.freezed.dart';

/// What a moderator decides about a Listing waiting for approval.
enum ListingDecision { approve, requestChanges, reject }

/// A Listing waiting in the Moderation Center, with what a moderator needs
/// to judge it: photos, condition, flags, price and the seller's record.
@freezed
abstract class QueuedListing with _$QueuedListing {
  const factory QueuedListing({
    required String id,
    required String title,
    required String sellerId,
    required String sellerName,
    required int priceBdt,
    required BookCondition condition,
    @Default(<String>[]) List<String> flags,

    /// Which photos the seller added: front, back, spine, inside, damage.
    @Default(<String>[]) List<String> photos,
    @Default(0) int coverSeed,
    @Default(0) int sellerStrikes,
    int? newPriceBdt,
    String? note,
  }) = _QueuedListing;
}
