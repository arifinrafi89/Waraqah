import 'package:dio/dio.dart';

import 'wallet_fake_store.dart';

/// Wallet's fake endpoint, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Checkout and orders change the same store.
abstract final class WalletFakeApi {
  /// The balance and its history, newest first.
  static const String wallet = '/wallet';

  static Map<String, Object? Function(RequestOptions)> routes(
    WalletFakeStore store,
  ) => {wallet: (_) => store.toModel().toJson()};
}
