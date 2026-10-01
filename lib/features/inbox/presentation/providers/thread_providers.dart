import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/inbox_message.dart';
import '../../domain/entities/inbox_thread.dart';
import '../../domain/repositories/inbox_repository.dart';
import '../../domain/usecases/decide_offer.dart';
import '../../domain/usecases/make_offer.dart';
import '../../domain/usecases/send_message.dart';
import 'inbox_providers.dart';
import 'inbox_use_case_providers.dart';

/// One open thread. Marks itself read, reloads when the live connection
/// says it changed, and carries what both sides can do in it. Each action
/// throws if the server refuses, for the page to say so.
class ThreadNotifier extends AsyncNotifier<InboxThread?> {
  ThreadNotifier(this.id);

  final String id;

  @override
  Future<InboxThread?> build() {
    ref.listen(inboxChangesProvider, (_, next) {
      if (next.value?.threadId == id) _reload();
    });
    return _load();
  }

  Future<InboxThread?> _load() async {
    final thread = await ref.read(getThreadProvider).call(id);
    if (thread == null || thread.unread == 0) return thread;
    return ref.read(markThreadReadProvider).call(id);
  }

  Future<void> _reload() async {
    try {
      state = AsyncData(await _load());
    } catch (_) {
      // Keep the thread on screen; the next change tries again.
    }
  }

  Future<void> send(String text) => _apply(
    ref
        .read(sendMessageProvider)
        .call(SendMessageParams(threadId: id, text: text)),
  );

  /// The buyer's next offer, from inside the thread.
  Future<void> makeOffer(int amountBdt, OfferHandover handover) {
    final listing = state.requireValue!.listing;
    return _apply(
      ref
          .read(makeOfferProvider)
          .call(
            MakeOfferParams(
              request: OfferRequest(
                listingId: listing.id,
                amountBdt: amountBdt,
                handover: handover,
              ),
              askingBdt: listing.priceBdt,
              negotiable: listing.isNegotiable,
            ),
          ),
    );
  }

  Future<void> decide(Offer offer, {required bool accept}) => _apply(
    ref
        .read(decideOfferProvider)
        .call(
          DecideOfferParams(threadId: id, offerId: offer.id, accept: accept),
        ),
  );

  Future<void> release() => _apply(ref.read(releaseListingProvider).call(id));

  Future<void> markSold() => _apply(ref.read(markListingSoldProvider).call(id));

  Future<void> _apply(Future<InboxThread> change) async =>
      state = AsyncData(await change);
}

final threadProvider = AsyncNotifierProvider.autoDispose
    .family<ThreadNotifier, InboxThread?, String>(ThreadNotifier.new);
