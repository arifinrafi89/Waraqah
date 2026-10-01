import '../../domain/entities/inbox_message.dart';
import 'inbox_fake_records.dart';
import 'inbox_fake_store.dart';

/// Four conversations so the inbox isn't empty on a fresh start:
/// - selling Atomic Habits: Sadia's new offer (unread), Rafi's older one
/// - buying: The Pragmatic Programmer, reserved for the reader by Nabila,
///   with her latest message unread; Operating Systems, sold by Talha
void seedInbox(InboxFakeStore store) {
  const me = InboxFakeStore.me;
  final now = store.now();
  FakeThread thread(String id, String listingId, String buyer, String seller) =>
      store.threads[id] = FakeThread(
        id: id,
        listingId: listingId,
        buyerId: buyer,
        sellerId: seller,
      );
  void add(
    FakeThread thread,
    String author,
    Duration ago, {
    String? text,
    FakeOffer? offer,
    ThreadEvent? event,
    int? amount,
  }) => thread.messages.add(
    FakeMessage(
      id: store.nextId('m'),
      authorId: author,
      at: now.subtract(ago),
      text: text,
      offer: offer,
      event: event,
      amountBdt: amount,
    ),
  );

  final sadia = thread('th-sadia', 'p2p-7', 'p-sadia', me);
  add(
    sadia,
    'p-sadia',
    const Duration(minutes: 52),
    text: 'Hi! Is Atomic Habits still available? I live in Mohammadpur.',
  );
  add(
    sadia,
    'p-sadia',
    const Duration(minutes: 50),
    offer: FakeOffer('o-sadia', 300, OfferHandover.meetup),
  );

  final rafi = thread('th-rafi', 'p2p-7', 'p-rafi', me)..replied = true;
  add(
    rafi,
    'p-rafi',
    const Duration(days: 1, hours: 2),
    offer: FakeOffer('o-rafi', 320, OfferHandover.courier),
  );
  add(
    rafi,
    me,
    const Duration(days: 1),
    text: 'Thanks, Rafi! Let me check the courier charge first.',
  );
  rafi.readByMe = rafi.messages.length;

  final nabila = thread('th-nabila', 'p2p-4', me, 'p-nabila')..replied = true;
  add(
    nabila,
    me,
    const Duration(days: 2, hours: 3),
    offer: FakeOffer('o-nabila', 400, OfferHandover.meetup)
      ..status = OfferStatus.accepted,
  );
  add(
    nabila,
    'p-nabila',
    const Duration(days: 2),
    event: ThreadEvent.offerAccepted,
    amount: 400,
  );
  add(
    nabila,
    me,
    const Duration(days: 1),
    text: 'Thank you! Can we meet in Banani this weekend?',
  );
  nabila.readByMe = nabila.messages.length;
  add(
    nabila,
    'p-nabila',
    const Duration(hours: 2),
    text: 'Saturday at 5 pm near Banani Road 11 works for me.',
  );

  final talha = thread('th-talha', 'p2p-5', me, 'p-talha')..replied = true;
  add(
    talha,
    me,
    const Duration(days: 9),
    offer: FakeOffer('o-talha', 520, OfferHandover.courier)
      ..status = OfferStatus.accepted,
  );
  add(
    talha,
    'p-talha',
    const Duration(days: 9) - const Duration(hours: 3),
    event: ThreadEvent.offerAccepted,
    amount: 520,
  );
  add(
    talha,
    'p-talha',
    const Duration(days: 7),
    text: 'Sent it with Steadfast today. Pay the rider when it arrives.',
  );
  add(talha, 'p-talha', const Duration(days: 5), event: ThreadEvent.sold);
  talha.readByMe = talha.messages.length;
}
