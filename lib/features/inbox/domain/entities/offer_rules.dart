/// Why an offer can't be sent.
enum OfferProblem { missing, aboveAsking, fixedPrice }

/// What a buyer may offer, checked the same way in the form, the use case
/// and on the server:
/// - at least ৳1, and never more than the asking price
/// - exactly the asking price when the seller said it isn't negotiable
abstract final class OfferRules {
  static OfferProblem? check({
    required int? amountBdt,
    required int askingBdt,
    required bool negotiable,
  }) {
    if (amountBdt == null || amountBdt < 1) return OfferProblem.missing;
    if (amountBdt > askingBdt) return OfferProblem.aboveAsking;
    if (!negotiable && amountBdt != askingBdt) return OfferProblem.fixedPrice;
    return null;
  }

  /// Longest chat message, in characters.
  static const int maxMessageLength = 1000;
}
