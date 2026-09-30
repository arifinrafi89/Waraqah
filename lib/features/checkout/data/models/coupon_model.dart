import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/coupon.dart';

part 'coupon_model.freezed.dart';
part 'coupon_model.g.dart';

@freezed
abstract class CouponModel with _$CouponModel {
  const factory CouponModel({
    required String code,
    required CouponKind kind,
    @Default(0) int value,
    @Default(0) int minOrderBdt,
    int? maxDiscountBdt,
  }) = _CouponModel;

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
}

extension CouponModelX on CouponModel {
  Coupon toEntity() => Coupon(
    code: code,
    kind: kind,
    value: value,
    minOrderBdt: minOrderBdt,
    maxDiscountBdt: maxDiscountBdt,
  );
}
