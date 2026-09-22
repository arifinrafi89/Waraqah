import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/data/dummy_book_repository.dart';
import 'package:waraqah/core/theme/app_theme.dart';

Future<void> _pumpCatalog(WidgetTester tester) async {
  AppRouter.router.go('/catalog');
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp.router(
        theme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('CatalogPage renders the full catalog as grid cards', (
    tester,
  ) async {
    await _pumpCatalog(tester);

    expect(find.text('Catalog'), findsWidgets);
    expect(find.byType(GridView), findsOneWidget);
    expect(
      find.text((await DummyBookRepository().getBooks()).first.title),
      findsOneWidget,
    );
  });

  testWidgets('catalog cards render an Add to cart button', (tester) async {
    await _pumpCatalog(tester);

    expect(find.text('Add to cart'), findsWidgets);
  });

  testWidgets('tapping a book card navigates to its detail page', (
    tester,
  ) async {
    await _pumpCatalog(tester);

    final book = (await DummyBookRepository().getBooks()).first;
    await tester.tap(find.text(book.title).first);
    await tester.pumpAndSettle();

    expect(find.text('Add to cart'), findsOneWidget);
    expect(find.text(book.author), findsOneWidget);
  });

  testWidgets('filter chip narrows cards to matching isBeneficial value', (
    tester,
  ) async {
    await _pumpCatalog(tester);

    expect(find.text('Harry Potter and the Philosopher\'s Stone'), findsOneWidget);
    expect(find.text('Sapiens: A Brief History of Humankind'), findsOneWidget);

    await tester.tap(find.text('Non-Beneficial'));
    await tester.pumpAndSettle();

    expect(find.text('Harry Potter and the Philosopher\'s Stone'), findsOneWidget);
    expect(find.text('Sapiens: A Brief History of Humankind'), findsNothing);
  });

  testWidgets('sort control reorders cards by price then by rating', (
    tester,
  ) async {
    await _pumpCatalog(tester);

    await tester.tap(find.text('Sort'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Price: Low to High'));
    await tester.pumpAndSettle();

    var texts = tester.widgetList<Text>(find.byType(Text)).map((t) => t.data ?? '').toList();
    expect(
      texts.indexOf('Fortress of the Muslim'),
      lessThan(texts.indexOf('Sapiens: A Brief History of Humankind')),
    );
    expect(
      texts.indexOf('Sapiens: A Brief History of Humankind'),
      lessThan(texts.indexOf('Clean Code')),
    );

    await tester.tap(find.text('Sort'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rating: High to Low'));
    await tester.pumpAndSettle();

    texts = tester.widgetList<Text>(find.byType(Text)).map((t) => t.data ?? '').toList();
    expect(
      texts.indexOf('The Sealed Nectar'),
      lessThan(texts.indexOf('Sapiens: A Brief History of Humankind')),
    );
    expect(
      texts.indexOf('Sapiens: A Brief History of Humankind'),
      lessThan(texts.indexOf('The Great Gatsby')),
    );
  });
}
