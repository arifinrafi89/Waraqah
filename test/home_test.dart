import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waraqah/features/catalog/catalog_routes.dart';
import 'package:waraqah/features/catalog/data/sources/book_fixtures.dart';
import 'package:waraqah/features/catalog/domain/entities/catalog_filters.dart';
import 'package:waraqah/features/home/home_routes.dart';
import 'package:waraqah/features/home/presentation/widgets/book_grid_card.dart';
import 'package:waraqah/features/home/presentation/widgets/home_section.dart';

import 'helpers/app_harness.dart';

/// The book cards in the Home strip titled [title].
Finder _cardsIn(String title) => find.descendant(
  of: find.ancestor(of: find.text(title), matching: find.byType(HomeSection)),
  matching: find.byType(BookGridCard),
);

List<String> _idsIn(WidgetTester tester, String title) => [
  for (final card in tester.widgetList<BookGridCard>(_cardsIn(title)))
    card.book.id,
];

/// Scrolls Home until the strip titled [title] sits just below the header.
Future<void> _scrollTo(WidgetTester tester, String title) async {
  final home = find
      .descendant(
        of: find.byType(CustomScrollView),
        matching: find.byType(Scrollable),
      )
      .first;
  await tester.scrollUntilVisible(find.text(title), 200, scrollable: home);
  await tester.drag(home, const Offset(0, 150));
  await settle(tester);
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('Home shows New arrivals, newest first, and Bestsellers', (
    tester,
  ) async {
    await openApp(tester, HomeRoutes.home);
    await _scrollTo(tester, 'New arrivals');

    final newest = [...BookFixtures.all]
      ..sort((a, b) => b.addedAt.compareTo(a.addedAt));
    final arrivals = _idsIn(tester, 'New arrivals');
    expect(arrivals.length, 10);
    expect(arrivals.first, newest.first.id);

    await _scrollTo(tester, 'Bestsellers');
    expect(_idsIn(tester, 'Bestsellers').first, 'bk-atomic');
    expect(tester.takeException(), isNull);
  });

  testWidgets('tapping a book card opens its book page', (tester) async {
    final router = await openApp(tester, HomeRoutes.home);
    await _scrollTo(tester, 'Bestsellers');

    final id = _idsIn(tester, 'Bestsellers').first;
    await tester.tap(_cardsIn('Bestsellers').first);
    await settle(tester);
    await settle(tester); // the book page's own fake API calls

    expect(pathOf(router), CatalogRoutes.bookDetailFor(id));
  });

  testWidgets('See all on Bestsellers opens Search with results', (
    tester,
  ) async {
    final router = await openApp(tester, HomeRoutes.home);
    await _scrollTo(tester, 'Bestsellers');

    await tester.tap(
      find.descendant(
        of: find.ancestor(
          of: find.text('Bestsellers'),
          matching: find.byType(HomeSection),
        ),
        matching: find.text('See all'),
      ),
    );
    await settle(tester);

    expect(pathOf(router), CatalogRoutes.search);
    expect(router.state.uri.queryParameters['sort'], 'bestselling');
    expect(find.text('Sort: Bestselling'), findsOneWidget);
    expect(find.textContaining(' results'), findsOneWidget);
  });

  testWidgets('Search opened with a sort shows results with no query', (
    tester,
  ) async {
    await openApp(tester, CatalogRoutes.searchFor(sort: SearchSort.newest));

    expect(find.textContaining(' results'), findsOneWidget);
    expect(
      find.text('Search by title, author, publisher or ISBN'),
      findsNothing,
    );
  });

  testWidgets('Search opened with q fills the query', (tester) async {
    await openApp(tester, CatalogRoutes.searchFor(query: 'matilda'));

    expect(find.widgetWithText(TextField, 'matilda'), findsOneWidget);
    expect(find.text('1 results'), findsOneWidget);
  });
}
