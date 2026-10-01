import '../../domain/entities/inbox_message.dart';
import '../models/inbox_message_model.dart';

/// The fake backend's own records. A thread is stored once and shown to
/// each side from their point of view.
class FakeOffer {
  FakeOffer(this.id, this.amountBdt, this.handover);

  final String id;
  final int amountBdt;
  final OfferHandover handover;
  OfferStatus status = OfferStatus.pending;

  OfferModel toModel() => OfferModel(
    id: id,
    amountBdt: amountBdt,
    handover: handover,
    status: status,
  );
}

class FakeMessage {
  FakeMessage({
    required this.id,
    required this.authorId,
    required this.at,
    this.text,
    this.offer,
    this.event,
    this.amountBdt,
  });

  /// Author of deal lines nobody in the thread wrote.
  static const String system = 'system';

  final String id;
  final String authorId;
  final DateTime at;
  final String? text;
  final FakeOffer? offer;
  final ThreadEvent? event;
  final int? amountBdt;

  InboxMessageModel toModel(String viewerId) => InboxMessageModel(
    id: id,
    from: authorId == viewerId
        ? MessageFrom.me
        : authorId == system
        ? MessageFrom.system
        : MessageFrom.them,
    at: at,
    text: text,
    offer: offer?.toModel(),
    event: event,
    amountBdt: amountBdt,
  );
}

class FakeThread {
  FakeThread({
    required this.id,
    required this.listingId,
    required this.buyerId,
    required this.sellerId,
  });

  final String id;
  final String listingId;
  final String buyerId;
  final String sellerId;
  final List<FakeMessage> messages = [];

  /// How many messages the signed-in reader has seen.
  int readByMe = 0;

  /// The demo's other person answers once, to show live updates.
  bool replied = false;

  String otherOf(String viewerId) => viewerId == buyerId ? sellerId : buyerId;

  DateTime get lastAt => messages.lastOrNull?.at ?? DateTime(2000);

  FakeOffer? get pendingOffer => messages
      .map((message) => message.offer)
      .where((offer) => offer?.status == OfferStatus.pending)
      .lastOrNull;
}
