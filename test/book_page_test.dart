import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/catalog/catalog_routes.dart';

import 'helpers/app_harness.dart';

/// Atomic Habits: paperback ৳590 (was ৳650, 30 in stock) and hardcover ৳890
/// (2 in stock).
final _atomic = CatalogRoutes.bookDetailFor('bk-atomic');

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('lists every edition and starts on the cheapest', (tester) async {
    await openApp(tester, _atomic);

    expect(tester.takeException(), isNull);
    expect(find.text('Choose an edition'), findsOneWidget);
    expect(find.text('2 editions'), findsOneWidget);
    expect(find.text('Paperback · English'), findsOneWidget);
    expect(find.text('Hardcover · English'), findsOneWidget);
    expect(find.text('Only 2 left'), findsOneWidget);
    // Bottom bar follows the cheapest edition, with its old price struck out.
    expect(find.text('৳590'), findsNWidgets(2));
    expect(find.text('৳650'), findsNWidgets(2));
  });

  testWidgets('picking another edition updates the bottom bar', (tester) async {
    await openApp(tester, _atomic);

    await tester.tap(find.text('Hardcover · English'));
    await tester.pump();

    // Once in the tile, once in the bottom bar.
    expect(find.text('৳890'), findsNWidgets(2));
    expect(find.text('৳650'), findsOneWidget);
  });

  testWidgets('delivery estimate follows the chosen area', (tester) async {
    await openApp(tester, _atomic);
    expect(find.text('Arrives in 1–2 days'), findsOneWidget);
    expect(find.text('Deliver to Inside Dhaka'), findsOneWidget);

    await tester.ensureVisible(find.text('Change'));
    await tester.tap(find.text('Change'));
    await settle(tester);
    await tester.tap(find.text('Outside Dhaka'));
    await settle(tester);

    expect(find.text('Arrives in 3–5 days'), findsOneWidget);
    expect(find.text('Deliver to Outside Dhaka'), findsOneWidget);
  });

  testWidgets('add to cart says the cart is coming', (tester) async {
    await openApp(tester, _atomic);

    await tester.tap(find.byTooltip('Add to cart'));
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
  });
}
