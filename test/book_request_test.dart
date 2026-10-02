import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/book_request/book_request_routes.dart';
import 'package:waraqah/features/book_request/data/sources/book_request_demand.dart';
import 'package:waraqah/features/book_request/data/sources/book_request_fake_store.dart';
import 'package:waraqah/features/book_request/domain/entities/book_request.dart';
import 'package:waraqah/features/book_request/domain/entities/request_rules.dart';
import 'package:waraqah/features/p2p/data/sources/p2p_fake_store.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('a request needs a title, a sensible price and a short note', () {
    expect(
      RequestRules.check(const BookRequestDraft(title: ' ')),
      RequestProblem.titleMissing,
    );
    expect(
      RequestRules.check(const BookRequestDraft(title: 'SICP', maxPriceBdt: 0)),
      RequestProblem.badPrice,
    );
    expect(
      RequestRules.check(BookRequestDraft(title: 'SICP', note: 'x' * 301)),
      RequestProblem.noteTooLong,
    );
    expect(RequestRules.check(const BookRequestDraft(title: 'SICP')), isNull);
  });

  test('a listing matches by catalog Book or by title words', () {
    const byBook = BookRequestDraft(title: 'Anything', bookId: 'bk-atomic');
    expect(RequestRules.matches(byBook, 'Atomic Habits', 'bk-atomic'), isTrue);
    const byTitle = BookRequestDraft(title: 'clean code');
    expect(RequestRules.matches(byTitle, 'Clean Code', null), isTrue);
    expect(RequestRules.matches(byTitle, 'Atomic Habits', null), isFalse);
  });

  test('sellers who have it are told; demand and wanted add up', () {
    final store = BookRequestFakeStore(P2pFakeStore());
    final sent = store.create(const BookRequestDraft(title: 'Clean Code'))!;
    // Tanvir sells a live copy.
    expect((sent['matchCount'], sent['notifiedSellers']), (1, 1));
    expect(store.mine(), hasLength(1));

    expect(store.close(sent['id'] as String), isTrue);
    expect(store.mine().single['isOpen'], isFalse);

    // Rafi is looking for the reader's own Atomic Habits.
    expect(store.wanted().single['readerName'], 'Rafi');
    expect(store.demand().first, {
      'title': 'Calculus: Early Transcendentals',
      'requests': 2,
    });
  });

  testWidgets('a reader requests a book and sees copies on sale', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      BookRequestRoutes.newFor(title: 'Clean Code'),
      role: 'reader',
    );
    await tester.tap(find.text('Send request'));
    await settle(tester);
    expect(pathOf(router), BookRequestRoutes.requests);
    expect(
      find.text('Request sent. 1 reader who has it was told.'),
      findsOneWidget,
    );
    expect(find.text('1 copy on sale now'), findsOneWidget);

    await tester.tap(find.text('See copies'));
    await settle(tester);
    expect(pathOf(router), P2pRoutes.p2p);
    expect(find.text('Clean Code'), findsWidgets);
  });

  testWidgets('a seller sees readers who want their books', (tester) async {
    await openApp(tester, P2pRoutes.myListings, role: 'reader');
    expect(find.text('Readers want your books'), findsOneWidget);
    expect(find.text('Rafi is looking for Atomic Habits'), findsOneWidget);
  });

  testWidgets('guests log in before sending', (tester) async {
    final router = await openApp(tester, BookRequestRoutes.newFor(title: 'X1'));
    await tester.tap(find.text('Send request'));
    await settle(tester);
    expect(pathOf(router), '/login');
  });
}
