import 'dart:async';
import 'dart:math';

import '../../../p2p/data/sources/p2p_fake_store.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/inbox_thread.dart';
import '../models/inbox_thread_model.dart';
import 'inbox_fake_records.dart';
import 'inbox_fake_seed.dart';

/// Threads on the fake backend (sharing listings with [p2p], which offers
/// reserve and sell) and the live feed of changes the app listens to.
class InboxFakeStore {
  InboxFakeStore(
    this.p2p, {
    DateTime Function()? clock,
    this.replyDelay = const Duration(seconds: 4),
  }) : now = clock ?? DateTime.now {
    seedInbox(this);
  }

  static const String me = P2pPeople.me;

  final P2pFakeStore p2p;
  final DateTime Function() now;

  /// How long the demo's other person takes to answer.
  final Duration replyDelay;
  final Map<String, FakeThread> threads = {};
  final StreamController<Map<String, Object>> _changes =
      StreamController.broadcast();
  int _seq = 0;
  int _ids = 0;

  Stream<Map<String, Object>> get changes => _changes.stream;

  String nextId(String prefix) => '$prefix-${++_ids}';

  /// Tells listening apps the thread (and its listing) changed.
  void changed(FakeThread thread) => _changes.add({
    'seq': ++_seq,
    'threadId': thread.id,
    'listingId': thread.listingId,
  });

  FakeMessage post(
    FakeThread thread,
    String authorId, {
    String? text,
    FakeOffer? offer,
    ThreadEvent? event,
    int? amountBdt,
  }) {
    final message = FakeMessage(
      id: nextId('m'),
      authorId: authorId,
      at: now(),
      text: text,
      offer: offer,
      event: event,
      amountBdt: amountBdt,
    );
    thread.messages.add(message);
    return message;
  }

  /// The reader's threads about a listing, or all of them.
  Iterable<FakeThread> about(String listingId) =>
      threads.values.where((thread) => thread.listingId == listingId);

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
    ).toJson();
  }
}
