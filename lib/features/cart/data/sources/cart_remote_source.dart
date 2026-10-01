import 'package:dio/dio.dart';

import '../../domain/entities/cart_item_ref.dart';
import '../models/cart_model.dart';
import 'cart_fake_api.dart';

/// Talks to the `/cart` endpoints, answered for now by the fake API.
class CartRemoteSource {
  CartRemoteSource(this._dio);

  final Dio _dio;

  Future<CartModel> fetch() =>
      _cart(_dio.get<Map<String, dynamic>>(CartFakeApi.cart));

  Future<CartModel> add(CartItemRef item) => _cart(
    _dio.post<Map<String, dynamic>>(
      CartFakeApi.add,
      data: {'kind': item.kind.name, 'id': item.id},
    ),
  );

  Future<CartModel> setQuantity(String lineId, int quantity) => _cart(
    _dio.post<Map<String, dynamic>>(
      CartFakeApi.update,
      data: {'lineId': lineId, 'quantity': quantity},
    ),
  );

  Future<CartModel> remove(String lineId) => _cart(
    _dio.post<Map<String, dynamic>>(
      CartFakeApi.remove,
      data: {'lineId': lineId},
    ),
  );

  Future<CartModel> _cart(
    Future<Response<Map<String, dynamic>>> request,
  ) async => CartModel.fromJson((await request).data!);
}
