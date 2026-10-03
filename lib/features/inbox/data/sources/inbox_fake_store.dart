import 'dart:async';

import '../../../p2p/data/sources/p2p_fake_store.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../domain/entities/inbox_message.dart';
import 'inbox_fake_records.dart';
import 'inbox_fake_seed.dart';

/// Threads on the fake backend (sharing listings with [p2p], which offers
/// reserve and sell) and the live feed of changes the app listens to.
class InboxFakeStore {
  InboxFakeStore(
    this.p2p, {
    DateTime Function()? clock,
    this.replyDelay = const Duration(seconds: 4),
    this.isBlocked = _nobody,
  }) : now = clock ?? DateTime.now {
    seedInbox(this);
  }

  static const String me = P2pPeople.me;

  final P2pFakeStore p2p;
  final DateTime Function() now;

  /// How long the demo's other person takes to answer or rate.
  final Duration replyDelay;

  /// Whether the signed-in reader blocked someone: no messages, offers or
  /// deals go either way with them.
  final bool Function(String readerId) isBlocked;
  final Map<String, FakeThread> threads = {};
  final StreamController<Map<String, Object>> _changes =
      StreamController.broadcast();
  int _seq = 0;
  int _ids = 0;

  Stream<Map<String, Object>> get changes => _changes.stream;

  String nextId(String prefix) => '$prefix-${++_ids}';

  /// Tells listening apps the thread and its listing changed.
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

  /// Takes a message a moderator removed out of its thread, and tells
  /// listening apps.
  void removeMessage(String messageId) {
    for (final thread in threads.values) {
      final at = thread.messages.indexWhere((m) => m.id == messageId);
      if (at < 0) continue;
      thread.messages.removeAt(at);
      if (at < thread.readByMe) thread.readByMe--;
      changed(thread);
      return;
    }
  }

  /// The thread's other person is blocked.
  bool blockedIn(FakeThread thread) => isBlocked(thread.otherOf(me));

  Iterable<FakeThread> about(String listingId) =>
      threads.values.where((thread) => thread.listingId == listingId);
}

bool _nobody(String _) => false;
