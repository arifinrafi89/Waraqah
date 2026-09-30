import 'package:flutter_test/flutter_test.dart';

import 'package:waraqah/features/checkout/domain/entities/coupon.dart';
import 'package:waraqah/features/checkout/domain/entities/order_receipt.dart';
import 'package:waraqah/features/checkout/domain/entities/saved_address.dart';
import 'package:waraqah/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:waraqah/features/checkout/domain/repositories/coupon_admin_repository.dart';
import 'package:waraqah/features/checkout/domain/usecases/apply_coupon.dart';
import 'package:waraqah/features/checkout/domain/usecases/create_coupon.dart';

final _now = DateTime(2026, 9, 30);

/// Keeps coupons in a list, like the server does.
class _Coupons implements CouponAdminRepository, CheckoutRepository {
  final List<Coupon> saved = [];

  @override
  Future<List<Coupon>> coupons() async => saved;

  @override
  Future<List<Coupon>?> create(Coupon coupon) async {
    if (saved.any((c) => c.code == coupon.code)) return null;
    saved.add(coupon);
    return saved;
  }

  @override
  Future<Coupon?> findCoupon(String code) async =>
      saved.where((c) => c.code == code).firstOrNull;

  @override
  Future<List<SavedAddress>> addresses() => throw UnimplementedError();

  @override
  Future<OrderReceipt> placeOrder(PlaceOrderRequest request) =>
      throw UnimplementedError();
}

void main() {
  late _Coupons repository;
  late CreateCoupon create;
  setUp(() {
    repository = _Coupons();
    create = CreateCoupon(repository, clock: () => _now);
  });

  Future<CouponFormProblem?> problem(Coupon coupon) async {
    try {
      await create(coupon);
      return null;
    } on CouponNotCreated catch (e) {
      return e.problem;
    }
  }

  const percent = Coupon(code: 'x', kind: CouponKind.percentOff, value: 20);

  test('codes are 3–20 letters or digits, saved in capitals', () async {
    expect(await problem(percent), CouponFormProblem.code);
    expect(
      await problem(percent.copyWith(code: 'EID 26')),
      CouponFormProblem.code,
    );
    expect(await problem(percent.copyWith(code: ' boishakh20 ')), isNull);
    expect(repository.saved.single.code, 'BOISHAKH20');
  });

  test('amounts must make sense', () async {
    final ok = percent.copyWith(code: 'OK1');
    expect(await problem(ok.copyWith(value: 0)), CouponFormProblem.value);
    expect(await problem(ok.copyWith(value: 95)), CouponFormProblem.value);
    expect(
      await problem(ok.copyWith(kind: CouponKind.amountOff, value: 0)),
      CouponFormProblem.value,
    );
    expect(
      await problem(ok.copyWith(kind: CouponKind.freeDelivery, value: 0)),
      isNull,
    );
  });

  test('an end date must be in the future; codes are unique', () async {
    final ok = percent.copyWith(code: 'EID26');
    expect(
      await problem(
        ok.copyWith(expiresAt: _now.subtract(const Duration(days: 1))),
      ),
      CouponFormProblem.expiry,
    );
    expect(await problem(ok), isNull);
    expect(await problem(ok), CouponFormProblem.taken);
  });

  test('checkout turns down an expired code', () async {
    repository.saved.add(
      percent.copyWith(
        code: 'OLD',
        expiresAt: _now.subtract(const Duration(hours: 1)),
      ),
    );
    final apply = ApplyCoupon(repository, clock: () => _now);
    await expectLater(
      apply(const ApplyCouponParams(code: 'old', subtotalBdt: 1000)),
      throwsA(
        isA<CouponRejected>().having(
          (e) => e.problem,
          'problem',
          CouponProblem.expired,
        ),
      ),
    );
  });
}
