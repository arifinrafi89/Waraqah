import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/data/dummy_book_repository.dart';
import 'package:waraqah/core/theme/app_theme.dart';

void main() {
  testWidgets('CatalogPage renders the full catalog as grid cards', (
    tester,
  ) async {
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

    expect(find.text('Catalog'), findsWidgets);
    expect(find.byType(GridView), findsOneWidget);
    expect(
      find.text(DummyBookRepository().getBooks().first.title),
      findsOneWidget,
    );
  });
}
