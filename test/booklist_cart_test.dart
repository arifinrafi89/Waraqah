import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/features/cart/cart_routes.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';

import 'helpers/app_harness.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('a guest adds a whole list; the sold-out Book is skipped', (
    tester,
  ) async {
    final router = await openApp(
      tester,
      CatalogRoutes.booklistFor('bl-book-club-alchemist'),
    );
    expect(find.text('Book club: The Alchemist month'), findsOneWidget);
    expect(find.text('Certified Used'), findsWidgets);
    expect(find.text('Out of stock'), findsOneWidget);

    await tester.tap(find.text('Add whole list to cart'));
    await settle(tester);
    await settle(tester);
    expect(find.text('Added 2 books · 1 out of stock'), findsOneWidget);

    router.push(CartRoutes.cart);
    await settle(tester);
    expect(find.textContaining('The Hobbit'), findsWidgets);
    expect(find.textContaining('Atomic Habits'), findsWidgets);
    expect(find.textContaining('The Alchemist'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('an unknown Booklist shows Not found', (tester) async {
    await openApp(tester, CatalogRoutes.booklistFor('bl-nope'));
    expect(find.text('Not found'), findsOneWidget);
    expect(find.text('Add whole list to cart'), findsNothing);
  });
}
