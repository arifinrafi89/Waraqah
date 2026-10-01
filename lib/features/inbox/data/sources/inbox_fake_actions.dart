// The fake backend changes the listings the marketplace reads.
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/offer_rules.dart';
import 'inbox_fake_records.dart';
import 'inbox_fake_replies.dart';
import 'inbox_fake_store.dart';

/// What the buyer does on the fake backend. Each answers the thread, or
/// `null` when it isn't allowed, the way the real server would refuse.
extension InboxFakeBuying on InboxFakeStore {
  static const String _me = InboxFakeStore.me;

  /// The buyer's thread about a listing, started if needed. A sold book
  /// can't start a new conversation, and sellers don't message themselves.
  FakeThread? openFor(String listingId) {
    final listing = p2p.find(listingId);
    if (listing == null || listing.sellerId == _me) return null;
    final existing = about(listingId).where((t) => t.buyerId == _me);
    if (existing.isNotEmpty) return existing.first;
    if (listing.status != P2pListingStatus.live &&
        listing.status != P2pListingStatus.reserved) {
      return null;
    }
    final thread = FakeThread(
      id: nextId('th'),
      listingId: listingId,
      buyerId: _me,
      sellerId: listing.sellerId,
    );
    return threads[thread.id] = thread;
  }

  FakeThread? send(String threadId, String text) {
    final thread = threads[threadId];
    final trimmed = text.trim();
    if (thread == null ||
        trimmed.isEmpty ||
        trimmed.length > OfferRules.maxMessageLength) {
      return null;
    }
    post(thread, _me, text: trimmed);
    readUp(thread);
    replyLater(thread, replyToMessage(thread));
    return thread;
  }

  FakeThread? offer(String listingId, int amount, OfferHandover handover) {
    final listing = p2p.find(listingId);
    if (listing == null || listing.status != P2pListingStatus.live) {
      return null;
    }
    final problem = OfferRules.check(
      amountBdt: amount,
      askingBdt: listing.priceBdt,
      negotiable: listing.isNegotiable,
    );
    final thread = openFor(listingId);
    if (problem != null || thread == null || thread.pendingOffer != null) {
      return null;
    }
    post(thread, _me, offer: FakeOffer(nextId('o'), amount, handover));
    readUp(thread);
    replyLater(thread, InboxFakeReplies.replyToOffer);
    return thread;
  }

  /// The reader has seen everything in the thread.
  FakeThread? readUp(FakeThread? thread) {
    if (thread == null) return null;
    thread.readByMe = thread.messages.length;
    changed(thread);
    return thread;
  }
}
