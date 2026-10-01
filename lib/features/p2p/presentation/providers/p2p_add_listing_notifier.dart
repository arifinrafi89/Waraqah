import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/p2p_listing.dart';

final p2pAddListingProvider =
    NotifierProvider<P2pAddListingNotifier, P2pListing>(
      P2pAddListingNotifier.new,
    );

class P2pAddListingNotifier extends Notifier<P2pListing> {
  @override
  P2pListing build() {
    return const P2pListing(
      id: 'draft',
      title: '',
      // The server fills in who's selling from the login.
      sellerId: '',
      sellerName: '',
      isMine: true,
      priceBdt: 0,
      condition: BookCondition.good,
      status: P2pListingStatus.draft,
      flags: [],
      photos: [],
      isNegotiable: false,
      handover: HandoverMethod.meetInPerson,
    );
  }

  void updateTitle(String title) => state = state.copyWith(title: title);
  void updatePrice(int price) => state = state.copyWith(priceBdt: price);
  void updateCondition(BookCondition condition) =>
      state = state.copyWith(condition: condition);

  void toggleFlag(String flag) {
    final flags = List<String>.from(state.flags);
    if (flags.contains(flag)) {
      flags.remove(flag);
    } else {
      flags.add(flag);
    }
    state = state.copyWith(flags: flags);
  }

  void setNegotiable(bool value) => state = state.copyWith(isNegotiable: value);
  void setHandover(HandoverMethod value) =>
      state = state.copyWith(handover: value);

  void setBookId(String? bookId, {String? title}) {
    state = state.copyWith(bookId: bookId, title: title ?? state.title);
  }

  /// Starts from a catalog Book (picked or scanned): its title, and its
  /// new price for comparing.
  void fromBook(String bookId, String title, {int? newPriceBdt}) => state =
      state.copyWith(bookId: bookId, title: title, newPriceBdt: newPriceBdt);

  void saveAsDraft() {
    // Save logic
    state = state.copyWith(status: P2pListingStatus.draft);
  }
}
