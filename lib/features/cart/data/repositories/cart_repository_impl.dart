import '../../domain/entities/cart.dart';
import '../../domain/entities/cart_item_ref.dart';
import '../../domain/repositories/cart_repository.dart';
import '../models/cart_model.dart';
import '../sources/cart_remote_source.dart';

/// No cache: the cart changes with every tap, and the server owns it.
class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._source);

  final CartRemoteSource _source;

  @override
  Future<Cart> fetch() async => (await _source.fetch()).toEntity();

  @override
  Future<Cart> add(CartItemRef item) async =>
      (await _source.add(item)).toEntity();

  @override
  Future<Cart> setQuantity(String lineId, int quantity) async =>
      (await _source.setQuantity(lineId, quantity)).toEntity();

  @override
  Future<Cart> remove(String lineId) async =>
      (await _source.remove(lineId)).toEntity();
}
