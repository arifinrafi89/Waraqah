/// How the reader pays. All four are simulated until the Go backend talks to
/// the real gateways.
enum PaymentMethod { bkash, nagad, cashOnDelivery, card }

extension PaymentMethodX on PaymentMethod {
  /// Paid up front, as opposed to cash handed over at the door.
  bool get isPrepaid => this != PaymentMethod.cashOnDelivery;
}
