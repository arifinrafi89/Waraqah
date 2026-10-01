import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';

/// Reader-facing words for used listings, in the current language.
extension P2pLabels on AppL10n {
  /// What buyers see: Available, Reserved or Sold.
  String marketStatus(P2pListingStatus status) => switch (status) {
    P2pListingStatus.live => usedStatusAvailable,
    P2pListingStatus.reserved => usedStatusReserved,
    P2pListingStatus.sold => listingStatusSold,
    _ => listingStatus(status),
  };

  /// What the seller sees on their own listing, from draft to sold.
  String listingStatus(P2pListingStatus status) => switch (status) {
    P2pListingStatus.draft => listingStatusDraft,
    P2pListingStatus.inReview => listingStatusInReview,
    P2pListingStatus.changesRequested => listingStatusChangesRequested,
    P2pListingStatus.rejected => listingStatusRejected,
    P2pListingStatus.live => listingStatusLive,
    P2pListingStatus.reserved => usedStatusReserved,
    P2pListingStatus.sold => listingStatusSold,
  };

  String handoverPreference(HandoverMethod method) => switch (method) {
    HandoverMethod.meetInPerson => usedPrefersMeetup,
    HandoverMethod.delivery => usedPrefersCourier,
  };
}
