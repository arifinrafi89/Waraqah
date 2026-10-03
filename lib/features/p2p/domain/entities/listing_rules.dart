import 'p2p_listing.dart';

enum ListingProblem {
  noTitle,
  titleTooLong,
  noteTooLong,
  noPrice,
  priceTooHigh,
  needFront,
  needBack,
  needDamagePhoto,
}

/// What a Listing needs before it's saved or sent for review, checked in
/// the app and by the server.
abstract final class ListingRules {
  static const int maxTitle = 120;
  static const int maxNote = 500;
  static const int maxPrice = 50000;

  /// The flags a seller can tick, as the API names them.
  static const List<String> flags = ['highlighting', 'notes', 'damage'];

  /// The photos a seller can add, in order. Front and back are needed.
  static const List<String> photoSlots = [
    'front',
    'back',
    'spine',
    'inside',
    'damage',
  ];

  /// The seller can still change it: not yet sent, or sent back.
  static bool canEdit(P2pListingStatus status) => switch (status) {
    P2pListingStatus.draft ||
    P2pListingStatus.changesRequested ||
    P2pListingStatus.rejected => true,
    _ => false,
  };

  /// Whether [slot] must have a photo before [listing] goes for review.
  static bool needsPhoto(P2pListing listing, String slot) =>
      slot == 'front' ||
      slot == 'back' ||
      (slot == 'damage' && listing.flags.contains('damage'));

  /// `null` when [listing] can be saved; a draft needs only its title.
  static ListingProblem? check(P2pListing listing, {required bool submit}) {
    final title = listing.title.trim();
    if (title.isEmpty) return ListingProblem.noTitle;
    if (title.length > maxTitle) return ListingProblem.titleTooLong;
    if ((listing.note?.trim().length ?? 0) > maxNote) {
      return ListingProblem.noteTooLong;
    }
    if (listing.priceBdt > maxPrice) return ListingProblem.priceTooHigh;
    if (!submit) return null;
    if (listing.priceBdt <= 0) return ListingProblem.noPrice;
    for (final (slot, problem) in [
      ('front', ListingProblem.needFront),
      ('back', ListingProblem.needBack),
      ('damage', ListingProblem.needDamagePhoto),
    ]) {
      if (needsPhoto(listing, slot) && !listing.photos.contains(slot)) {
        return problem;
      }
    }
    return null;
  }
}
