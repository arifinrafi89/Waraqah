import 'dart:async';

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

  void replyLater(FakeThread thread, String text) {
    if (thread.replied) return;
    thread.replied = true;
    Timer(replyDelay, () {
      post(thread, thread.otherOf(InboxFakeStore.me), text: text);
      changed(thread);
    });
  }
}
