import 'dart:math';

import '../../../p2p/data/sources/p2p_people.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_thread.dart';
import '../models/inbox_thread_model.dart';
import 'inbox_fake_records.dart';
import 'inbox_fake_store.dart';

/// Threads as the signed-in reader sees them on the fake backend: their
/// side, what's unread, and the ratings after a sale.
extension InboxFakeJson on InboxFakeStore {
  static const String me = InboxFakeStore.me;

  /// Threads with messages, newest activity first.
  List<Object> list({String? listingId}) {
    final found = [
      for (final thread in threads.values)
        if (thread.messages.isNotEmpty &&
            (listingId == null || thread.listingId == listingId))
          thread,
    ]..sort((a, b) => b.lastAt.compareTo(a.lastAt));
    return [for (final thread in found) json(thread, lastOnly: true)];
  }

  /// The thread as the signed-in reader sees it.
  Map<String, dynamic> json(FakeThread thread, {bool lastOnly = false}) {
    final listing = p2p.find(thread.listingId)!;
    final other = P2pPeople.find(thread.otherOf(me))!;
    final status = listing.status;
    final count = thread.messages.length;
    final sold =
        status == P2pListingStatus.sold &&
        p2p.buyerOf(listing.id) == thread.buyerId;
    return InboxThreadModel(
      id: thread.id,
      role: thread.buyerId == me ? ThreadRole.buyer : ThreadRole.seller,
      otherId: other.id,
      otherName: other.name,
      listing: ThreadListingModel(
        id: listing.id,
        title: listing.title,
        priceBdt: listing.priceBdt,
        status: status,
        coverSeed: listing.coverSeed,
        isNegotiable: listing.isNegotiable,
        handover: listing.handover,
      ),
      dealHere:
          p2p.buyerOf(listing.id) == thread.buyerId &&
          (status == P2pListingStatus.reserved ||
              status == P2pListingStatus.sold),
      unread: thread.messages
          .skip(thread.readByMe)
          .where((message) => message.authorId != me)
          .length,
      messages: [
        for (final message in thread.messages.skip(
          lastOnly ? max(0, count - 1) : 0,
        ))
          message.toModel(me),
      ],
      myRating: sold ? p2p.ratingBy(listing.id, me)?.stars : null,
      theirRating: sold ? p2p.ratingBy(listing.id, other.id)?.stars : null,
    ).toJson();
  }
}
