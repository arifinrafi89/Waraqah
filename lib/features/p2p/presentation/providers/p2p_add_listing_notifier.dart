import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/p2p_listing.dart';
import '../../domain/usecases/save_listing.dart';
import 'p2p_providers.dart';

/// The add-listing form. Invalidate it before opening the form for a new
/// Listing; [edit] fills it from one the reader may still change.
final p2pAddListingProvider =
    NotifierProvider<P2pAddListingNotifier, P2pListing>(
      P2pAddListingNotifier.new,
    );

class P2pAddListingNotifier extends Notifier<P2pListing> {
  /// Photos picked since the last save, by slot. A slot in
  /// `state.photos` without bytes here is one the server already has.
  final Map<String, Uint8List> photoBytes = {};

  @override
  P2pListing build() {
    photoBytes.clear();
    return const P2pListing(
      // Empty until the server saves it and gives it an id.
      id: '',
      title: '',
      // The server fills in who's selling from the login.
      sellerId: '',
      sellerName: '',
      isMine: true,
      priceBdt: 0,
      status: P2pListingStatus.draft,
    );
  }

  /// Picks up a draft, or a Listing a moderator sent back.
  void edit(P2pListing listing) {
    photoBytes.clear();
    state = listing;
  }

  void updateTitle(String title) => state = state.copyWith(title: title);
  void updatePrice(int price) => state = state.copyWith(priceBdt: price);
  void updateNote(String note) => state = state.copyWith(note: note);
  void updateCondition(BookCondition condition) =>
      state = state.copyWith(condition: condition);

  /// [flag] is one of `ListingRules.flags`.
  void toggleFlag(String flag) => state = state.copyWith(
    flags: state.flags.contains(flag)
        ? [...state.flags.where((f) => f != flag)]
        : [...state.flags, flag],
  );

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

  void setPhoto(String slot, Uint8List bytes) {
    photoBytes[slot] = bytes;
    state = state.copyWith(photos: {...state.photos, slot}.toList());
  }

  void removePhoto(String slot) {
    photoBytes.remove(slot);
    state = state.copyWith(photos: [...state.photos.where((s) => s != slot)]);
  }

  /// Saves a draft, or sends it for review when [submit]. Throws when the
  /// server refuses; check `ListingRules` first.
  Future<P2pListing> save({required bool submit}) async {
    final saved = await ref
        .read(saveListingProvider)
        .call(
          SaveListingParams(
            state,
            newPhotos: Map.of(photoBytes),
            submit: submit,
          ),
        );
    photoBytes.clear();
    state = saved;
    ref
      ..invalidate(myListingsProvider)
      ..invalidate(p2pListingsProvider)
      ..invalidate(p2pListingDetailProvider(saved.id));
    return saved;
  }
}
