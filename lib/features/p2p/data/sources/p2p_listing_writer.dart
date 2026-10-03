import '../../domain/entities/listing_rules.dart';
import '../../domain/entities/p2p_listing.dart';
import '../models/p2p_listing_model.dart';
import 'p2p_fake_store.dart';
import 'p2p_people.dart';

/// Saves the signed-in reader's Listing from the add-listing form, the way
/// the server will: a new one or one they may still change, checked
/// against [ListingRules].
abstract final class P2pListingWriter {
  static Map<String, dynamic>? save(
    P2pFakeStore store,
    Map<String, dynamic> body,
  ) {
    final id = body['id'] as String?;
    final old = id == null ? null : store.find(id);
    if (id != null &&
        (old == null ||
            old.sellerId != P2pPeople.me ||
            !ListingRules.canEdit(old.status))) {
      return null;
    }
    final submit = body['submit'] == true;
    final me = P2pPeople.find(P2pPeople.me)!;
    final newId = old?.id ?? store.newId();
    final note = (body['note'] as String?)?.trim();
    final listing = P2pListingModel(
      id: newId,
      title: (body['title'] as String? ?? '').trim(),
      sellerId: me.id,
      sellerName: me.name,
      priceBdt: body['priceBdt'] as int? ?? 0,
      condition: _byName(BookCondition.values, body['condition']),
      flags: [
        for (final flag in ListingRules.flags)
          if ((body['flags'] as List?)?.contains(flag) ?? false) flag,
      ],
      photos: _photos(body, old),
      isNegotiable: body['isNegotiable'] == true,
      handover: _byName(HandoverMethod.values, body['handover']),
      // Saving a draft keeps a moderator's answer; sending clears it.
      status: submit
          ? P2pListingStatus.inReview
          : old?.status ?? P2pListingStatus.draft,
      rejectionReason: submit ? null : old?.rejectionReason,
      bookId: body['bookId'] as String?,
      coverSeed: old?.coverSeed ?? newId.codeUnits.fold(0, (a, b) => a + b),
      district: me.district,
      area: me.area,
      categoryId: old?.categoryId,
      newPriceBdt: body['newPriceBdt'] as int?,
      note: note == null || note.isEmpty ? null : note,
    );
    if (ListingRules.check(listing.toEntity(), submit: submit) != null) {
      return null;
    }
    store.put(listing);
    return store.json(listing);
  }

  /// A slot keeps its photo when one was just sent, or when the server
  /// already had it and the seller didn't remove it. Until there's file
  /// storage, only which slots have a photo is kept.
  static List<String> _photos(Map<String, dynamic> body, P2pListingModel? old) {
    final sent = (body['photoData'] as Map?)?.keys.toSet() ?? const {};
    final kept = (body['photos'] as List?) ?? const [];
    return [
      for (final slot in ListingRules.photoSlots)
        if (sent.contains(slot) ||
            (kept.contains(slot) && (old?.photos.contains(slot) ?? false)))
          slot,
    ];
  }

  static T _byName<T extends Enum>(List<T> values, Object? name) =>
      values.firstWhere((v) => v.name == name, orElse: () => values.first);
}
