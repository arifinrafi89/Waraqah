import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/router/app_router.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/features/book_bites/data/book_bites_providers.dart';
import 'package:waraqah/features/book_bites/data/repositories/dummy_post_repository.dart';
import 'package:waraqah/features/book_bites/domain/models/post.dart';
import 'package:waraqah/features/book_bites/domain/repositories/post_repository.dart';

class _RecordingPostRepository implements PostRepository {
  final List<Post> added = [];
  final DummyPostRepository _inner = DummyPostRepository();

  @override
  Future<List<Post>> getPosts() => _inner.getPosts();

  @override
  Future<List<Post>> addPost(Post post) {
    added.add(post);
    return _inner.addPost(post);
  }
}

void main() {
  testWidgets('Creating a Book-Bite writes through to PostRepository', (
    tester,
  ) async {
    final repository = _RecordingPostRepository();

    AppRouter.router.go('/book-bites');
    await tester.pumpWidget(
      ProviderScope(
        overrides: [postRepositoryProvider.overrideWithValue(repository)],
        child: MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'What are you reading?'),
      'A write-through test post.',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'Post'));
    await tester.pumpAndSettle();

    expect(find.text('A write-through test post.'), findsOneWidget);
    expect(repository.added, hasLength(1));
    expect(repository.added.single.content, 'A write-through test post.');
  });
}
