import '../../../domain/entities/vendor_offer.dart';

/// Per-vendor prices for the seed catalog, keyed by book id.
///
/// Each book's cheapest offer matches the price and vendor on its catalog
/// entry, and the offer count matches its `vendorCount`, so the list and
/// detail screens never disagree.
abstract final class OfferSeed {
  static final Map<String, List<VendorOffer>> byBookId = {
    'bk-sapiens': [
      _o('Rokomari', 650, 2),
      _o('Wafilife', 690, 3),
      _o('Boi Bazar', 780, 4, BookFormat.hardcover),
    ],
    'bk-atomic': [
      _o('Rokomari', 590, 2),
      _o('Wafilife', 640, 3),
      _o('Boi Bazar', 675, 4),
      _o('Pathak Shamabesh', 690, 5, BookFormat.hardcover),
    ],
    'bk-cleancode': [_o('Rokomari', 1150, 3), _o('Boi Bazar', 1320, 5)],
    'bk-calculus': [
      _o('Rokomari', 1750, 3, BookFormat.hardcover),
      _o('Pathak Shamabesh', 1890, 5, BookFormat.hardcover),
    ],
    'bk-zero': [
      _o('Rokomari', 520, 2),
      _o('Wafilife', 560, 3),
      _o('Boi Bazar', 610, 0, BookFormat.ebook),
    ],
    'bk-fiqh': [
      _o('Wafilife', 540, 3, BookFormat.hardcover),
      _o('Rokomari', 580, 2, BookFormat.hardcover),
    ],
    'bk-nectar': [
      _o('Wafilife', 420, 3),
      _o('Rokomari', 450, 2),
      _o('Boi Bazar', 470, 4),
    ],
    'bk-riyad': [
      _o('Wafilife', 480, 3, BookFormat.hardcover),
      _o('Rokomari', 525, 2, BookFormat.hardcover),
      _o('Pathak Shamabesh', 560, 5, BookFormat.hardcover),
    ],
  };
}

VendorOffer _o(
  String vendor,
  int price,
  int days, [
  BookFormat format = BookFormat.paperback,
]) => VendorOffer(
  vendor: vendor,
  priceBdt: price,
  deliveryDays: days,
  format: format,
);
