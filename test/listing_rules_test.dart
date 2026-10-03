import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/moderation/data/sources/moderation_fake_api.dart';
import 'package:waraqah/features/p2p/data/sources/p2p_fake_api.dart';
import 'package:waraqah/features/p2p/domain/entities/listing_rules.dart';
import 'package:waraqah/features/p2p/domain/entities/p2p_listing.dart';

import 'helpers/fake_backend.dart';

const _book = P2pListing(
  id: '',
  title: 'SICP',
  sellerId: '',
  sellerName: '',
  priceBdt: 300,
);

/// Posts the add-listing form's body; the saved Listing, or `null`.
Future<Map<String, dynamic>?> Function(Map<String, Object?>) _saver(
  FakeBackend backend,
) =>
    (body) async => (await backend.dio.post<Map<String, dynamic>>(
      P2pFakeApi.save,
      data: body,
    )).data;

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('a draft needs a title; review also needs a price and photos', () {
    ListingProblem? draft(P2pListing l) => ListingRules.check(l, submit: false);
    ListingProblem? send(P2pListing l) => ListingRules.check(l, submit: true);
    final covers = _book.copyWith(photos: ['front', 'back']);

    expect(draft(_book.copyWith(title: ' ')), ListingProblem.noTitle);
    expect(draft(_book), isNull);
    expect(draft(_book.copyWith(priceBdt: 60000)), ListingProblem.priceTooHigh);
    expect(send(covers.copyWith(priceBdt: 0)), ListingProblem.noPrice);
    expect(send(_book), ListingProblem.needFront);
    expect(send(covers), isNull);
    expect(
      send(covers.copyWith(flags: ['damage'])),
      ListingProblem.needDamagePhoto,
    );
    expect(ListingRules.canEdit(P2pListingStatus.live), isFalse);
  });

  test('a saved draft is sent for review and reaches the moderators', () async {
    final backend = FakeBackend();
    final save = _saver(backend);

    final draft = (await save({
      'title': 'SICP',
      'flags': ['notes', 'bogus'],
    }))!;
    expect((draft['status'], draft['isMine']), ('draft', true));
    expect(draft['flags'], ['notes']);
    final id = draft['id'] as String;

    // Without photos the server refuses to send it.
    expect(
      await save({'id': id, 'title': 'SICP', 'priceBdt': 300, 'submit': true}),
      isNull,
    );

    final sent = (await save({
      'id': id,
      'title': 'SICP',
      'priceBdt': 300,
      'submit': true,
      'photoData': {'front': 'AA==', 'back': 'AA=='},
    }))!;
    expect((sent['id'], sent['status']), (id, 'inReview'));
    expect(sent['photos'], ['front', 'back']);
    final queue = (await backend.dio.get<List<dynamic>>(
      ModerationFakeApi.queue,
    )).data!;
    expect(queue.map((l) => (l as Map)['id']), contains(id));

    // In review, or someone else's: the seller can't change it.
    expect(await save({'id': id, 'title': 'SICP 2'}), isNull);
    expect(await save({'id': 'p2p-1', 'title': 'Mine now'}), isNull);
  });

  test('a sent-back Listing keeps photos and reason until resent', () async {
    final save = _saver(FakeBackend());
    final base = {
      'id': 'p2p-changes-1',
      'title': 'Head First Java',
      'priceBdt': 420,
    };

    final kept = (await save({
      ...base,
      'photos': ['front'],
    }))!;
    expect(kept['status'], 'changesRequested');
    expect(kept['photos'], ['front']);
    expect(kept['rejectionReason'], isNotNull);

    // A slot the server never had isn't kept by naming it.
    expect(
      await save({
        ...base,
        'photos': ['front', 'back'],
        'submit': true,
      }),
      isNull,
    );

    final resent = (await save({
      ...base,
      'photos': ['front'],
      'photoData': {'back': 'AA=='},
      'submit': true,
    }))!;
    expect((resent['status'], resent['rejectionReason']), ('inReview', null));
  });
}
