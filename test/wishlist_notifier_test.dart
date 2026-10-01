import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/network/dio_provider.dart';
import 'package:waraqah/features/wishlist/presentation/providers/wishlist_providers.dart';

/// Runs [body] against the real fake API, skipping its 900 ms delays.
void _withWishlist(Future<void> Function(ProviderContainer container) body) {
  fakeAsync((async) {
    final container = ProviderContainer(
      overrides: [
        dioProvider.overrideWithValue(
          Dio()..interceptors.add(FakeApiRoutes.interceptor()),
        ),
      ],
    );
    container.listen(wishlistProvider, (_, _) {});
    var done = false;
    Object? failure;
    body(container).then(
      (_) => done = true,
      onError: (Object error) {
        failure = error;
        done = true;
      },
    );
    for (var i = 0; i < 60 && !done; i++) {
      async.elapse(const Duration(seconds: 1));
    }
    container.dispose();
    if (failure != null) throw failure!;
    expect(done, isTrue, reason: 'the wishlist never answered');
  });
}

void main() {
  List<String> ids(ProviderContainer container) => [
    for (final book in container.read(wishlistProvider).value!) book.id,
  ];

  test('newest first; saving again moves it to the top', () {
    _withWishlist((container) async {
      final wishlist = container.read(wishlistProvider.notifier);
      await wishlist.set('bk-atomic', saved: true);
      await wishlist.set('bk-sapiens', saved: true);
      expect(ids(container), ['bk-sapiens', 'bk-atomic']);

      await wishlist.set('bk-atomic', saved: true);
      expect(ids(container), ['bk-atomic', 'bk-sapiens']);
      expect(container.read(isWishlistedProvider('bk-atomic')), isTrue);
      expect(container.read(wishlistCountProvider), 2);
    });
  });

  test('unknown books are ignored; removing takes one off', () {
    _withWishlist((container) async {
      final wishlist = container.read(wishlistProvider.notifier);
      await wishlist.set('nope', saved: true);
      await wishlist.set('bk-atomic', saved: true);
      await wishlist.set('bk-atomic', saved: false);

      expect(ids(container), isEmpty);
      expect(container.read(isWishlistedProvider('bk-atomic')), isFalse);
    });
  });
}
