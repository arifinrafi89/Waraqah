import 'package:dio/dio.dart';

import 'cart_fake_store.dart';

/// Cart's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Every endpoint answers with the whole cart.
abstract final class CartFakeApi {
  static const String cart = '/cart';

  /// Body: `{kind, id}`, e.g. `{kind: edition, id: bk-atomic-pb-en}`.
  static const String add = '/cart/add';

  /// Body: `{lineId, quantity}`.
  static const String update = '/cart/update';

  /// Body: `{lineId}`.
  static const String remove = '/cart/remove';

  /// Answers from [store], which checkout shares to turn the cart into an
  /// order. A fresh store per interceptor, so every test starts clean.
  static Map<String, Object? Function(RequestOptions)> routes(
    CartFakeStore store,
  ) {
    return {
      cart: (_) => store.toJson(),
      add: (options) {
        final body = _body(options);
        store.add(body['kind'] as String? ?? '', body['id'] as String? ?? '');
        return store.toJson();
      },
      update: (options) {
        final body = _body(options);
        store.setQuantity(
          body['lineId'] as String? ?? '',
          body['quantity'] as int? ?? 1,
        );
        return store.toJson();
      },
      remove: (options) {
        store.remove(_body(options)['lineId'] as String? ?? '');
        return store.toJson();
      },
    };
  }

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};
}
