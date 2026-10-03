import 'dart:async';

// The fake backend keeps ratings with the marketplace's people.
import '../../../p2p/data/sources/p2p_ratings.dart';
import 'inbox_fake_records.dart';
import 'inbox_fake_store.dart';

/// Demo only: the other person answers once per thread, a few seconds
/// after the reader first writes, so live updates can be seen on one
/// device. The real server just passes on what real people send.
extension InboxFakeReplies on InboxFakeStore {
  static const String replyToOffer =
      "Thanks for the offer! Let me think about it, I'll reply soon.";
  static const String replyToAccept =
      'Great, thank you! When and where suits you?';

  String replyToMessage(FakeThread thread) =>
      thread.buyerId == InboxFakeStore.me
      ? "Hi! Yes, it's still available. Ask me anything."
      : 'Thanks for getting back to me!';

  /// After a sale, the demo's other person rates the reader.
  void rateLater(FakeThread thread) => Timer(replyDelay, () {
    p2p.ratings.add(
      P2pRating(
        fromId: thread.otherOf(InboxFakeStore.me),
        toId: InboxFakeStore.me,
        stars: 5,
        at: now(),
        listingId: thread.listingId,
        comment: 'Smooth handover, thank you!',
      ),
    );
    changed(thread);
  });

  void replyLater(FakeThread thread, String text) {
    if (thread.replied) return;
    thread.replied = true;
    Timer(replyDelay, () {
      // A reader the signed-in one blocked can't write to them.
      if (blockedIn(thread)) return;
      post(thread, thread.otherOf(InboxFakeStore.me), text: text);
      changed(thread);
    });
  }
}
