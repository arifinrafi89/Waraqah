import 'package:freezed_annotation/freezed_annotation.dart';

part 'inbox_message.freezed.dart';

/// Who wrote a message, from the signed-in reader's side.
enum MessageFrom { me, them, system }

/// How the book changes hands. Payment happens between buyer and seller,
/// outside the app.
enum OfferHandover { meetup, courier }

enum OfferStatus { pending, accepted, declined, closed }

/// Something that happened in a deal, shown as a line in the thread.
enum ThreadEvent {
  offerAccepted,
  offerDeclined,

  /// The seller accepted someone else's offer.
  reservedElsewhere,
  madeAvailable,
  sold,

  /// The seller sold the book to someone else.
  soldElsewhere,
}

/// A buyer's proposed price on a listing, with meetup or courier.
@freezed
abstract class Offer with _$Offer {
  const factory Offer({
    required String id,
    required int amountBdt,
    required OfferHandover handover,
    @Default(OfferStatus.pending) OfferStatus status,
  }) = _Offer;
}

/// A chat message, an offer, or a deal event. Exactly one of [text],
/// [offer] and [event] is set.
@freezed
abstract class InboxMessage with _$InboxMessage {
  const factory InboxMessage({
    required String id,
    required MessageFrom from,
    required DateTime at,
    String? text,
    Offer? offer,
    ThreadEvent? event,

    /// The price an event is about, e.g. the accepted offer.
    int? amountBdt,
  }) = _InboxMessage;
}
