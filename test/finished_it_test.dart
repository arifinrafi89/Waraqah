import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/finished_it/domain/entities/finished_it_offers.dart';
import 'package:waraqah/features/p2p/p2p_routes.dart';
import 'package:waraqah/features/sell_back/sell_back_routes.dart';
import 'package:waraqah/features/shelves/presentation/widgets/shelf_book_tile.dart';
import 'package:waraqah/features/shelves/shelves_routes.dart';

import 'helpers/app_harness.dart';

/// Moves [title], delivered to the reader so on Want to Read, to Finished.
Future<void> _finish(WidgetTester tester, String title) async {
  await tester.tap(find.text('Want to Read'));
  await settle(tester);
  await tester.tap(
    find.descendant(
      of: find.widgetWithText(ShelfBookTile, title),
      matching: find.byTooltip('Move to'),
    ),
  );
  await settle(tester);
  await tester.tap(find.text('Finished').last);
  await settle(tester);
  expect(find.text('Finished $title?'), findsOneWidget);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('a book read once is worth its fair range, or Sell Back now', () {
    final offers = FinishedItOffers.of(500)!;
    expect((offers.readers.lowBdt, offers.readers.highBdt), (300, 380));
    expect(offers.sellBackBdt, 180);
    expect(FinishedItOffers.of(null), isNull);
  });

  testWidgets('a finished book goes to the listing form, filled in', (
    tester,
  ) async {
    final router = await openApp(tester, ShelvesRoutes.shelves, role: 'reader');
    await _finish(tester, 'Atomic Habits');
    expect(find.textContaining('Readers pay about'), findsOneWidget);

    await tester.tap(find.text('List it for readers'));
    await settle(tester);
    expect(pathOf(router), P2pRoutes.addListing);
    expect(find.widgetWithText(TextFormField, 'Atomic Habits'), findsOneWidget);
  });

  testWidgets('or it goes to Sell Back for an instant price', (tester) async {
    final router = await openApp(tester, ShelvesRoutes.shelves, role: 'reader');
    await _finish(tester, 'Atomic Habits');
    await tester.tap(find.text('Sell it back to Waraqah'));
    await settle(tester);
    expect(pathOf(router), SellBackRoutes.sellBack);
    expect(find.textContaining('Waraqah pays'), findsOneWidget);
  });
}
