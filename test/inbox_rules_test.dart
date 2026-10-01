import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/inbox/data/sources/inbox_fake_actions.dart';
import 'package:waraqah/features/inbox/data/sources/inbox_fake_selling.dart';
import 'package:waraqah/features/inbox/data/sources/inbox_fake_store.dart';
import 'package:waraqah/features/inbox/domain/entities/inbox_message.dart';
import 'package:waraqah/features/inbox/domain/entities/offer_rules.dart';
import 'package:waraqah/features/p2p/data/sources/p2p_fake_store.dart';
import 'package:waraqah/features/p2p/domain/entities/p2p_listing.dart';

void main() {
  test(
    'offers are at least ৳1, never above asking, fixed if not negotiable',
    () {
      OfferProblem? check(int? amount, {bool negotiable = true}) =>
          OfferRules.check(
            amountBdt: amount,
            askingBdt: 350,
            negotiable: negotiable,
          );
      expect(check(null), OfferProblem.missing);
      expect(check(0), OfferProblem.missing);
      expect(check(351), OfferProblem.aboveAsking);
      expect(check(300), isNull);
      expect(check(300, negotiable: false), OfferProblem.fixedPrice);
      expect(check(350, negotiable: false), isNull);
    },
  );

  group('the fake server', () {
    late P2pFakeStore p2p;
    late InboxFakeStore inbox;
    P2pListingStatus status(String id) => p2p.find(id)!.status;

    setUp(() {
      p2p = P2pFakeStore();
      inbox = InboxFakeStore(p2p, replyDelay: Duration.zero);
    });

    test('accepting reserves the book and tells the other buyers', () {
      final events = <Object>[];
      inbox.changes.listen(events.add);
      expect(inbox.decide('th-sadia', 'o-sadia', accept: true), isNotNull);
      expect(status('p2p-7'), P2pListingStatus.reserved);
      expect(p2p.buyerOf('p2p-7'), 'p-sadia');
      final rafi = inbox.threads['th-rafi']!;
      expect(rafi.messages.last.event, ThreadEvent.reservedElsewhere);
      // Rafi's offer waits, but can't be accepted while reserved.
      expect(inbox.decide('th-rafi', 'o-rafi', accept: true), isNull);
    });

    test('the seller can make it available again, then sell to someone', () {
      inbox.decide('th-sadia', 'o-sadia', accept: true);
      inbox.release('th-sadia');
      expect(status('p2p-7'), P2pListingStatus.live);
      expect(p2p.buyerOf('p2p-7'), isNull);

      inbox.decide('th-rafi', 'o-rafi', accept: true);
      expect(inbox.markSold('th-sadia'), isNull, reason: "not Sadia's deal");
      inbox.markSold('th-rafi');
      expect(status('p2p-7'), P2pListingStatus.sold);
      expect(
        inbox.threads['th-sadia']!.messages.last.event,
        ThreadEvent.soldElsewhere,
      );
    });

    test('a buyer gets one thread per listing and one waiting offer', () {
      final thread = inbox.offer('p2p-1', 300, OfferHandover.meetup)!;
      expect(inbox.openFor('p2p-1'), same(thread));
      expect(inbox.offer('p2p-1', 280, OfferHandover.courier), isNull);
      expect(inbox.offer('p2p-1', 900, OfferHandover.meetup), isNull);
      expect(
        inbox.offer('p2p-7', 300, OfferHandover.meetup),
        isNull,
        reason: 'own listing',
      );
      expect(
        inbox.offer('p2p-6', 200, OfferHandover.meetup),
        isNull,
        reason: 'not negotiable',
      );
      expect(inbox.offer('p2p-6', 260, OfferHandover.meetup), isNotNull);
    });

    test('reading clears the unread count', () {
      Map<String, dynamic> sadia() => inbox.json(inbox.threads['th-sadia']!);
      expect(sadia()['unread'], 2);
      inbox.readUp(inbox.threads['th-sadia']);
      expect(sadia()['unread'], 0);
    });
  });
}
