import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/app/fake_api_routes.dart';
import 'package:waraqah/core/network/dio_provider.dart';
import 'package:waraqah/features/cart/domain/entities/cart.dart';
import 'package:waraqah/features/cart/domain/entities/cart_item_ref.dart';
import 'package:waraqah/features/cart/presentation/providers/cart_providers.dart';

const _paperback = CartItemRef.edition('bk-atomic-pb-en');
const _ebook = CartItemRef.edition('bk-sapiens-eb-en');

/// Runs [body] against the real fake API, skipping its 900 ms delays.
void _withCart(Future<void> Function(ProviderContainer container) body) {
  fakeAsync((async) {
    final container = ProviderContainer(
      overrides: [
        dioProvider.overrideWithValue(
          Dio()..interceptors.add(FakeApiRoutes.interceptor()),
        ),
      ],
    );
    container.listen(cartProvider, (_, _) {});
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
    expect(done, isTrue, reason: 'the cart never answered');
  });
}

void main() {
  test('totals count copies and savings against the list price', () {
    _withCart((container) async {
      final cart = container.read(cartProvider.notifier);
      await cart.add(_paperback);
      await cart.add(_paperback);
      await cart.add(_ebook);

      final value = container.read(cartProvider).value!;
      expect(value.itemCount, 3);
      expect(value.subtotalBdt, 590 * 2 + 399);
      expect(value.savingsBdt, (650 - 590) * 2);
      expect(container.read(cartCountProvider), 3);
    });
  });

  test('add says whether the cart could take another copy', () {
    _withCart((container) async {
      final cart = container.read(cartProvider.notifier);
      expect(await cart.add(_ebook), isTrue);
      expect(await cart.add(_ebook), isFalse);
      expect(await cart.add(const CartItemRef.listing('ls-1')), isFalse);
    });
  });

  test('changing a quantity shows at once, and zero removes the line', () {
    _withCart((container) async {
      final cart = container.read(cartProvider.notifier);
      await cart.add(_paperback);
      final id = container.read(cartProvider).value!.lines.single.id;

      final pending = cart.setQuantity(id, 3);
      // Before the server answers.
      expect(container.read(cartProvider).value!.itemCount, 3);
      await pending;
      expect(container.read(cartProvider).value!.itemCount, 3);

      await cart.remove(id);
      expect(container.read(cartProvider).value!.isEmpty, isTrue);
    });
  });
}
