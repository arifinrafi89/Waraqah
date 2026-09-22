import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/models/book.dart';
import 'package:waraqah/core/providers/book_providers.dart';
import 'package:waraqah/core/repositories/book_repository.dart';
import 'package:waraqah/core/theme/app_theme.dart';

class _ThrowingBookRepository implements BookRepository {
  @override
  Future<List<Book>> getBooks() => throw Exception('boom');
}

void main() {
  testWidgets('a failing repository shows the error state, not a crash', (
    tester,
  ) async {
    AppRouter.router.go('/catalog');
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bookRepositoryProvider.overrideWithValue(_ThrowingBookRepository()),
        ],
        child: MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text("Couldn't load this right now."), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
