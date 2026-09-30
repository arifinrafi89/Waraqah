import '../../../../core/models/edition.dart';
import 'delivery_area.dart';

/// When an [Edition] would reach the reader.
sealed class DeliveryEstimate {
  const DeliveryEstimate();

  /// Business rule for delivery times:
  /// - eBooks download straight away
  /// - pre-orders ship on release
  /// - out-of-stock editions can't be delivered
  /// - printed books take 1–2 days inside Dhaka, 3–5 days outside
  factory DeliveryEstimate.of(Edition edition, DeliveryArea area) {
    if (edition.format == BookFormat.ebook) return const InstantDownload();
    if (edition.stock > 0) return printed(area);
    if (edition.isPreorder) return const ShipsOnRelease();
    return const Unavailable();
  }

  /// How long a printed book in stock takes to reach [area]. Checkout uses
  /// this for the whole order.
  static ShipsInDays printed(DeliveryArea area) => switch (area) {
    DeliveryArea.insideDhaka => const ShipsInDays(1, 2),
    DeliveryArea.outsideDhaka => const ShipsInDays(3, 5),
  };
}

final class InstantDownload extends DeliveryEstimate {
  const InstantDownload();
}

final class ShipsOnRelease extends DeliveryEstimate {
  const ShipsOnRelease();
}

final class Unavailable extends DeliveryEstimate {
  const Unavailable();
}

final class ShipsInDays extends DeliveryEstimate {
  const ShipsInDays(this.minDays, this.maxDays);

  final int minDays;
  final int maxDays;
}
