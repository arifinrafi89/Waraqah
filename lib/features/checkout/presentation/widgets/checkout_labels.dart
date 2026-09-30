import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/payment_method.dart';

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
}
