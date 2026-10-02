import '../../domain/entities/coupon.dart';
import '../../domain/entities/order_receipt.dart';
import '../../domain/repositories/checkout_repository.dart';
import '../models/coupon_model.dart';
import '../models/order_receipt_model.dart';
import '../sources/checkout_remote_source.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  CheckoutRepositoryImpl(this._source);

  final CheckoutRemoteSource _source;

  @override
  Future<Coupon?> findCoupon(String code) async =>
      (await _source.findCoupon(code))?.toEntity();

  @override
  Future<OrderReceipt> placeOrder(PlaceOrderRequest request) async =>
      (await _source.placeOrder(request)).toEntity();
}
