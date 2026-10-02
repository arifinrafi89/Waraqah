import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:waraqah/features/alerts/alerts_routes.dart';
import 'package:waraqah/features/alerts/data/sources/alert_fake_api.dart';
import 'package:waraqah/features/alerts/data/sources/alert_fake_store.dart';
import 'package:waraqah/features/auth/auth_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/wishlist/wishlist_routes.dart';

import 'helpers/app_harness.dart';

/// Calculus: the hardcover is in stock, the paperback is sold out.
final _calculus = CatalogRoutes.bookDetailFor('bk-calculus');

Object? _call(
  Map<String, Object? Function(RequestOptions)> api,
  String path, [
  Object? body,
]) => api[path]!(RequestOptions(path: path, data: body));

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('alerts fire once stock is back or the price is low enough', () {
    final api = AlertFakeApi.routes(AlertFakeStore());
    _call(api, AlertFakeApi.set, {
      'kind': 'backInStock',
      'bookId': 'bk-calculus',
      'editionId': 'bk-calculus-pb-en',
    });
    _call(api, AlertFakeApi.set, {
      'kind': 'priceDrop',
      'bookId': 'bk-atomic',
      'editionId': 'bk-atomic-pb-en',
      'targetPriceBdt': 600,
    });
    final alerts = _call(api, AlertFakeApi.alerts) as List;
    expect([for (final a in alerts) (a as Map)['isTriggered']], [false, true]);

    // Setting the same alert again replaces it.
    _call(api, AlertFakeApi.set, {
      'kind': 'priceDrop',
      'bookId': 'bk-atomic',
      'editionId': 'bk-atomic-pb-en',
      'targetPriceBdt': 500,
    });
    final after = _call(api, AlertFakeApi.alerts) as List;
    expect(after, hasLength(2));
    expect((after.last as Map)['isTriggered'], isFalse);
  });

  testWidgets('a sold-out book offers Notify me; guests log in first', (
    tester,
  ) async {
    final router = await openApp(tester, _calculus);
    await tester.tap(find.text('Paperback · English'));
    await tester.pump();
    await tester.tap(find.text('Notify me'));
    await settle(tester);
    expect(pathOf(router), AuthRoutes.login);
  });

  testWidgets('a reader sets a back-in-stock alert and sees it listed', (
    tester,
  ) async {
    final router = await openApp(tester, _calculus, role: 'reader');
    await tester.tap(find.text('Paperback · English'));
    await tester.pump();
    await tester.tap(find.text('Notify me'));
    await settle(tester);
    expect(find.text("We'll let you know when it's back."), findsOneWidget);
    expect(find.text("We'll let you know · tap to stop"), findsOneWidget);

    router.push(AlertsRoutes.alerts);
    await settle(tester);
    expect(find.text('Waiting for it to be back in stock'), findsOneWidget);
  });

  testWidgets('the wishlist bell sets a price-drop alert', (tester) async {
    final router = await openApp(
      tester,
      CatalogRoutes.bookDetailFor('bk-atomic'),
      role: 'reader',
    );
    await tester.tap(find.byTooltip('Save to wishlist'));
    await settle(tester);
    router.push(WishlistRoutes.wishlist);
    await settle(tester);

    await tester.tap(find.byTooltip('Price drop alert'));
    await settle(tester);
    // Starts at 90% of ৳590, to the nearest ৳10.
    expect(find.text('Alert me at ৳530 or less'), findsOneWidget);
    await tester.tap(find.text('Set alert'));
    await settle(tester);

    router.push(AlertsRoutes.alerts);
    await settle(tester);
    expect(find.text('Alert at ৳530 · now ৳590'), findsOneWidget);
  });

  testWidgets('the lowest-price badge only shows at a real 30-day low', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.bookDetailFor('bk-atomic'));
    expect(find.text('Lowest in 30 days'), findsOneWidget);

    // Sapiens' paperback was ৳620 earlier this month, below today's ৳650.
    await openApp(tester, CatalogRoutes.bookDetailFor('bk-sapiens'));
    expect(find.text('Lowest in 30 days'), findsNothing);
    expect(find.byType(Scaffold), findsWidgets);
  });
}
