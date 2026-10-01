import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/coupon.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/usecases/create_coupon.dart';

/// Reader-facing words for checkout, in the current language.
extension CheckoutLabels on AppL10n {
  String paymentName(PaymentMethod method) => switch (method) {
    PaymentMethod.bkash => checkoutPayBkash,
    PaymentMethod.nagad => checkoutPayNagad,
    PaymentMethod.cashOnDelivery => checkoutPayCod,
    PaymentMethod.card => checkoutPayCard,
  };

  String paymentNote(PaymentMethod method) => switch (method) {
    PaymentMethod.bkash => checkoutPayBkashNote,
    PaymentMethod.nagad => checkoutPayNagadNote,
    PaymentMethod.cashOnDelivery => checkoutPayCodNote,
    PaymentMethod.card => checkoutPayCardNote,
  };

  /// "10% off, up to ৳150 · orders from ৳500".
  String couponSummary(Coupon coupon) {
    final deal = switch (coupon.kind) {
      CouponKind.percentOff => [
        adminOrderCouponPercentOff(coupon.value),
        if (coupon.maxDiscountBdt case final cap?)
          adminOrderCouponUpTo(Bdt.format(cap)),
      ].join(', '),
      CouponKind.amountOff => adminOrderCouponAmountOff(
        Bdt.format(coupon.value),
      ),
      CouponKind.freeDelivery => checkoutFreeDelivery,
    };
    return coupon.minOrderBdt > 0
        ? '$deal · ${adminOrderCouponFrom(Bdt.format(coupon.minOrderBdt))}'
        : deal;
  }

  String couponFormProblem(CouponFormProblem problem) => switch (problem) {
    CouponFormProblem.code => adminOrderCouponBadCode,
    CouponFormProblem.value => adminOrderCouponBadValue,
    CouponFormProblem.expiry => adminOrderCouponBadExpiry,
    CouponFormProblem.taken => adminOrderCouponTaken,
  };
}
