// The fake backend keeps ratings with the marketplace's people.
import '../../../p2p/data/sources/p2p_ratings.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/rating_rules.dart';
import 'inbox_fake_actions.dart';
import 'inbox_fake_records.dart';
import 'inbox_fake_store.dart';

/// Rating the other person after a sale, on the fake backend. Answers the
/// thread, or `null` before the sale, after rating once, or for stars
/// outside 1 to 5.
extension InboxFakeRating on InboxFakeStore {
  FakeThread? rate(String threadId, int stars, String? comment) {
    final thread = threads[threadId];
    if (thread == null) return null;
    final listing = p2p.find(thread.listingId)!;
    final sold =
        listing.status == P2pListingStatus.sold &&
        p2p.buyerOf(listing.id) == thread.buyerId;
    final text = comment?.trim() ?? '';
    if (!sold ||
        p2p.ratingBy(listing.id, InboxFakeStore.me) != null ||
        RatingRules.check(stars: stars, comment: text) != null) {
      return null;
    }
    p2p.ratings.add(
      P2pRating(
        fromId: InboxFakeStore.me,
        toId: thread.otherOf(InboxFakeStore.me),
        stars: stars,
        at: now(),
        listingId: listing.id,
        comment: text.isEmpty ? null : text,
      ),
    );
    return readUp(thread);
  }
}
