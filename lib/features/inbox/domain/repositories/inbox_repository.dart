import '../entities/inbox_change.dart';
import '../entities/inbox_message.dart';
import '../entities/inbox_thread.dart';

class OfferRequest {
  const OfferRequest({
    required this.listingId,
    required this.amountBdt,
    required this.handover,
  });

  final String listingId;
  final int amountBdt;
  final OfferHandover handover;
}

/// The reader's offers and conversations about used books. Every change
/// answers the thread as it is now.
abstract interface class InboxRepository {
  /// Threads with at least one message, newest activity first; with
  /// [listingId], only those about that listing.
  Future<List<InboxThread>> threads({String? listingId});

  /// `null` when there's no such thread for this reader.
  Future<InboxThread?> thread(String id);

  /// The buyer's thread about a listing, started if there isn't one yet.
  Future<InboxThread> open(String listingId);

  Future<InboxThread> send(String threadId, String text);

  /// The buyer's offer, in their thread about the listing.
  Future<InboxThread> makeOffer(OfferRequest request);

  /// The seller accepts (reserving the book) or declines.
  Future<InboxThread> decide(
    String threadId,
    String offerId, {
    required bool accept,
  });

  Future<InboxThread> markRead(String threadId);

  /// The seller makes a reserved book available again.
  Future<InboxThread> release(String threadId);

  /// The seller marks the book sold to this thread's buyer.
  Future<InboxThread> markSold(String threadId);

  /// After the sale, rate the other person once.
  Future<InboxThread> rate(String threadId, int stars, String? comment);

  /// Live changes while the app is open.
  Stream<InboxChange> changes();
}
