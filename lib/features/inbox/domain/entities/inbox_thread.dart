import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';
import 'inbox_message.dart';

part 'inbox_thread.freezed.dart';

/// Whether the signed-in reader is buying or selling in a thread.
enum ThreadRole { buyer, seller }

/// The listing a thread is about, as it is right now.
@freezed
abstract class ThreadListing with _$ThreadListing {
  const factory ThreadListing({
    required String id,
    required String title,
    required int priceBdt,
    required P2pListingStatus status,
    @Default(0) int coverSeed,
    @Default(false) bool isNegotiable,
    @Default(HandoverMethod.meetInPerson) HandoverMethod handover,
  }) = _ThreadListing;
}

/// One buyer and one seller talking about one listing. There's one thread
/// per buyer per listing; offers, replies and status changes all land here.
@freezed
abstract class InboxThread with _$InboxThread {
  const factory InboxThread({
    required String id,
    required ThreadRole role,
    required String otherId,
    required String otherName,
    required ThreadListing listing,

    /// The listing is reserved for, or sold to, this thread's buyer.
    @Default(false) bool dealHere,

    /// Offers and messages from the other person not read yet.
    @Default(0) int unread,

    /// Oldest first. The inbox list only carries the latest one.
    @Default(<InboxMessage>[]) List<InboxMessage> messages,

    /// Stars the reader gave the other person after the sale.
    int? myRating,

    /// Stars the other person gave the reader.
    int? theirRating,
  }) = _InboxThread;
}

extension InboxThreadX on InboxThread {
  bool get isBuying => role == ThreadRole.buyer;

  InboxMessage? get lastMessage => messages.lastOrNull;

  /// The offer waiting for the seller, if there is one.
  Offer? get pendingOffer => messages.reversed
      .map((message) => message.offer)
      .where((offer) => offer?.status == OfferStatus.pending)
      .firstOrNull;

  /// The buyer can send an offer: the book is on sale and none is waiting.
  bool get canMakeOffer =>
      isBuying &&
      listing.status == P2pListingStatus.live &&
      pendingOffer == null;

  bool get isReservedHere =>
      dealHere && listing.status == P2pListingStatus.reserved;

  bool get isSoldHere => dealHere && listing.status == P2pListingStatus.sold;

  /// After the sale, buyer and seller rate each other, once.
  bool get canRate => isSoldHere && myRating == null;

  /// Reserved for, or sold to, a different buyer.
  bool get isTakenElsewhere =>
      !dealHere &&
      (listing.status == P2pListingStatus.reserved ||
          listing.status == P2pListingStatus.sold);
}
