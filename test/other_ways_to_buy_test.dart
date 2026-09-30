import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/cart/cart_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';

import 'helpers/app_harness.dart';

final _atomic = CatalogRoutes.bookDetailFor('bk-atomic');

Future<void> _scrollTo(WidgetTester tester, Finder finder) =>
    tester.scrollUntilVisible(
      finder,
      200,
      scrollable: find.byType(Scrollable).first,
    );

/// Lets the "Added to cart" snackbar go away so it can't catch the next tap:
/// the add takes about a second, the snackbar slides in, then its 4 second
/// timer starts.
Future<void> _snackGone(WidgetTester tester) async {
  await settle(tester);
  await tester.pump(const Duration(seconds: 1));
  await tester.pump(); // the frame that starts the timer
  await tester.pump(const Duration(seconds: 5));
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('shows Certified Used, readers and the resale value', (
    tester,
  ) async {
    await openApp(tester, _atomic);
    await _scrollTo(tester, find.textContaining('usually resell'));

    expect(tester.takeException(), isNull);
    expect(find.text('Other ways to buy'), findsOneWidget);
    expect(find.text('Certified Used'), findsOneWidget);
    expect(find.text('from ৳300'), findsOneWidget);
    expect(find.text('3 listings'), findsOneWidget);
    expect(find.textContaining('about ৳270'), findsOneWidget);
  });

  testWidgets('used copies go in the cart, grouped apart from new', (
    tester,
  ) async {
    final router = await openApp(tester, _atomic);
    await tester.tap(find.byTooltip('Add to cart').first);
    await _snackGone(tester);

    await _scrollTo(tester, find.text('From readers'));
    await tester.tap(find.byTooltip('Add used copy to cart'));
    await _snackGone(tester);
    await tester.tap(find.text('From readers'));
    await settle(tester);
    expect(find.text('Tanvir · Mirpur'), findsOneWidget);
    await tester.tap(find.byTooltip('Add to cart').last);
    await settle(tester);

    router.push(CartRoutes.cart);
    await settle(tester);
    expect(find.text('3 items'), findsOneWidget);
    expect(find.text('New'), findsOneWidget);
    expect(find.text('Used'), findsOneWidget);
    expect(find.text('Certified Used · Very good'), findsOneWidget);
  });
}
