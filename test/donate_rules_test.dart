import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/features/checkout/domain/entities/payment_method.dart';
import 'package:waraqah/features/donate/data/sources/donate_fixtures.dart';
import 'package:waraqah/features/donate/domain/entities/donate_place_draft.dart';
import 'package:waraqah/features/donate/domain/entities/donation.dart';
import 'package:waraqah/features/donate/domain/entities/recipient.dart';
import 'package:waraqah/features/donate/domain/repositories/donate_repository.dart';
import 'package:waraqah/features/donate/domain/usecases/donate_book.dart';

class _Repository implements DonateRepository {
  DonationRequest? sent;

  @override
  Future<Donation> donate(DonationRequest request) async {
    sent = request;
    return const Donation(orderNumber: 'WQ-1', totalBdt: 0);
  }

  @override
  Future<Recipient?> recipient(String id) async => null;

  @override
  Future<List<Recipient>> recipients() async => const [];

  @override
  Future<List<Recipient>> savePlace(DonatePlaceDraft draft) async => const [];

  @override
  Future<List<Recipient>> removePlace(String id) async => const [];
}

RecipientNeed _need(int wanted, int received) => RecipientNeed(
  book: DonateFixtures.book('bk-atomic')!,
  editionId: 'e',
  priceBdt: 500,
  wanted: wanted,
  received: received,
);

DonationRequest _request({int quantity = 1, PaymentMethod? payment}) =>
    DonationRequest(
      recipientId: 'r',
      bookId: 'b',
      quantity: quantity,
      payment: payment ?? PaymentMethod.bkash,
      note: '  Enjoy  ',
    );

void main() {
  test('a place counts what it still needs, never below zero', () {
    final recipient = Recipient(
      id: 'r',
      name: 'R',
      kind: RecipientKind.school,
      district: 'D',
      area: 'A',
      story: '',
      needs: [_need(10, 4), _need(3, 5)],
    );
    expect(recipient.needs.map((need) => need.stillNeeded), [6, 0]);
    expect(recipient.needs.last.isMet, isTrue);
    expect((recipient.booksReceived, recipient.booksWanted), (7, 13));
  });

  test('donations are printed copies', () {
    for (final place in DonateFixtures.places) {
      for (final (bookId, _, _) in place.needs) {
        final book = DonateFixtures.book(bookId);
        expect(book, isNotNull, reason: bookId);
        expect(DonateFixtures.printedEdition(book!), isNotNull, reason: bookId);
      }
    }
    expect(DonateFixtures.book('bk-atomic')!.fromPriceBdt, greaterThan(0));
  });

  test('no cash on delivery and at least one copy; the note is trimmed', () {
    final repository = _Repository();
    final donate = DonateBook(repository);
    expect(
      () => donate(_request(payment: PaymentMethod.cashOnDelivery)),
      throwsArgumentError,
    );
    expect(() => donate(_request(quantity: 0)), throwsArgumentError);
    donate(_request());
    expect(repository.sent?.note, 'Enjoy');
  });
}
