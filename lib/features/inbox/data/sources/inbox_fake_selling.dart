// The fake backend changes the listings the marketplace reads.
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_message.dart';
import 'inbox_fake_actions.dart';
import 'inbox_fake_records.dart';
import 'inbox_fake_replies.dart';
import 'inbox_fake_store.dart';

/// What the seller does on the fake backend: decide on offers, and move
/// the listing between Available, Reserved and Sold. Each answers the
/// thread, or `null` when it isn't allowed.
extension InboxFakeSelling on InboxFakeStore {
  static const String _me = InboxFakeStore.me;

  /// Accepting reserves the book for this buyer; the seller's other
  /// threads about it are told it's reserved for someone else.
  FakeThread? decide(String threadId, String offerId, {required bool accept}) {
    final thread = _sellerThread(threadId);
    final offer = thread?.pendingOffer;
    if (thread == null || offer == null || offer.id != offerId) return null;
    final listing = p2p.find(thread.listingId)!;
    if (accept && listing.status != P2pListingStatus.live) return null;
    offer.status = accept ? OfferStatus.accepted : OfferStatus.declined;
    final event = accept
        ? ThreadEvent.offerAccepted
        : ThreadEvent.offerDeclined;
    post(thread, _me, event: event, amountBdt: offer.amountBdt);
    if (accept) {
      p2p.setStatus(
        listing.id,
        P2pListingStatus.reserved,
        buyerId: thread.buyerId,
      );
      _tellOthers(thread, ThreadEvent.reservedElsewhere);
      replyLater(thread, InboxFakeReplies.replyToAccept);
    }
    return readUp(thread);
  }

  /// The deal fell through: the book is on sale again, for everyone
  /// talking about it.
  FakeThread? release(String threadId) {
    final thread = _dealThread(threadId, P2pListingStatus.reserved);
    if (thread == null) return null;
    p2p.setStatus(thread.listingId, P2pListingStatus.live);
    for (final other in about(thread.listingId)) {
      if (other.messages.isEmpty) continue;
      post(other, _me, event: ThreadEvent.madeAvailable);
      if (other != thread) changed(other);
    }
    return readUp(thread);
  }

  /// After the handover. Other buyers' waiting offers are closed.
  FakeThread? markSold(String threadId) {
    final thread = _dealThread(threadId, P2pListingStatus.reserved);
    if (thread == null) return null;
    p2p.setStatus(
      thread.listingId,
      P2pListingStatus.sold,
      buyerId: thread.buyerId,
    );
    post(thread, _me, event: ThreadEvent.sold);
    _tellOthers(thread, ThreadEvent.soldElsewhere, closeOffers: true);
    return readUp(thread);
  }

  FakeThread? _sellerThread(String id) {
    final thread = threads[id];
    return thread?.sellerId == _me ? thread : null;
  }

  /// The seller's thread with the buyer the listing is [status] for.
  FakeThread? _dealThread(String id, P2pListingStatus status) {
    final thread = _sellerThread(id);
    if (thread == null) return null;
    final listing = p2p.find(thread.listingId)!;
    final isDeal = p2p.buyerOf(listing.id) == thread.buyerId;
    return listing.status == status && isDeal ? thread : null;
  }

  void _tellOthers(
    FakeThread deal,
    ThreadEvent event, {
    bool closeOffers = false,
  }) {
    for (final other in about(deal.listingId)) {
      if (other == deal || other.messages.isEmpty) continue;
      if (closeOffers) other.pendingOffer?.status = OfferStatus.closed;
      post(other, FakeMessage.system, event: event);
      changed(other);
    }
  }
}
