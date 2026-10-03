import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/orders/data/sources/order_fake_store.dart';
import 'package:waraqah/features/profile/profile_routes.dart';
import 'package:waraqah/features/shelves/data/sources/shelf_fake_store.dart';
import 'package:waraqah/features/shelves/domain/entities/shelf_entry.dart';
import 'package:waraqah/features/shelves/shelves_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  Map<String, String> shelves(ShelfFakeStore store) => {
    for (final e in store.mine())
      (e['book'] as Map)['id'] as String: e['shelf'] as String,
  };

  test('delivered Books land on Want to Read once', () {
    final store = ShelfFakeStore(OrderFakeStore());
    // Sapiens and Atomic Habits were delivered; Hobbit is on the go.
    expect(shelves(store), containsPair('bk-atomic', 'wantToRead'));
    expect(shelves(store), containsPair('bk-hobbit', 'reading'));

    expect(store.move('bk-atomic', null), isTrue);
    expect(shelves(store), isNot(contains('bk-atomic')));
    expect(store.finishedCount, 2);

    expect(store.move('bk-sapiens', Shelf.finished), isTrue);
    final sapiens = store.mine().firstWhere(
      (e) => (e['book'] as Map)['id'] == 'bk-sapiens',
    );
    expect(sapiens['finishedAt'], isNotNull);
    expect(store.finishedCount, 3);
    expect(store.move('bk-nope', Shelf.reading), isFalse);
  });

  testWidgets('the shelves page shows each shelf', (tester) async {
    await openApp(tester, ShelvesRoutes.shelves, role: 'reader');
    expect(find.text('The Hobbit'), findsWidgets);
    await tester.tap(find.text('Finished'));
    await settle(tester);
    expect(find.text('The Alchemist'), findsWidgets);
    expect(find.text('The Hobbit'), findsNothing);
  });

  testWidgets('a Book goes on a shelf from its page', (tester) async {
    await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-davinci'),
      role: 'reader',
    );
    await tester.dragUntilVisible(
      find.text('Add to shelf'),
      find.byType(ListView).first,
      const Offset(0, -300),
    );
    await tester.ensureVisible(find.text('Add to shelf'));
    await tester.tap(find.text('Add to shelf'));
    await settle(tester);
    await tester.tap(find.text('Want to Read'));
    await settle(tester);
    expect(find.text('Moved to Want to Read.'), findsOneWidget);
    expect(find.text('Add to shelf'), findsNothing);
  });

  testWidgets('Profile counts the Finished shelf', (tester) async {
    await openApp(tester, ProfileRoutes.profile, role: 'reader');
    expect(find.text('2'), findsWidgets);
  });

  testWidgets('guests log in to see shelves', (tester) async {
    final router = await openApp(tester, ShelvesRoutes.shelves);
    expect(pathOf(router), isNot(ShelvesRoutes.shelves));
  });
}
