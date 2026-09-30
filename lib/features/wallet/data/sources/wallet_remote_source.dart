import 'package:dio/dio.dart';

import '../models/wallet_model.dart';
import 'wallet_fake_api.dart';

/// Talks to `/wallet`, answered for now by the fake API.
class WalletRemoteSource {
  WalletRemoteSource(this._dio);

  final Dio _dio;

  Future<WalletModel> fetch() async {
    final response = await _dio.get<Map<String, dynamic>>(WalletFakeApi.wallet);
    return WalletModel.fromJson(response.data ?? const {});
  }
}
