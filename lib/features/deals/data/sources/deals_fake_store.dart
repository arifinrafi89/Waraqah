// The fake backend sees the whole catalog, like the real server will.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../models/deals_model.dart';

/// The deals the fake backend runs, built from real catalog Editions. The
/// cart shares it, so flash prices and bundles are charged correctly.
class DealsFakeStore {
  DealsFakeStore({DateTime Function()? clock}) : _now = clock ?? DateTime.now {
    final now = _now();
    flashEndsAt = now.add(const Duration(hours: 6));
    _releaseDate = DateTime(now.year, now.month, now.day + 40);
  }

  final DateTime Function() _now;
  late final DateTime flashEndsAt;
  late final DateTime _releaseDate;

  static const Map<String, int> _flashPrices = {
    'bk-sherlock-pb-en': 299,
    'bk-zero-pb-en': 399,
    'bk-hpstone-pb-en': 499,
  };

  static const List<(String, String, List<String>, int)> _bundles = [
    (
      'big-ideas',
      'Big ideas bundle',
      ['bk-sapiens-pb-en', 'bk-atomic-pb-en', 'bk-zero-pb-en'],
      1450,
    ),
    (
      'seerah-hadith',
      'Seerah and hadith bundle',
      ['bk-nectar-pb-bn', 'bk-riyad-hc-bn', 'bk-adabmufrad-pb-bn'],
      1150,
    ),
  ];

  static const List<String> _preorders = ['bk-bidayah-hc-bn'];

  /// The flash price for [editionId] while the sale is on, else `null`.
  int? flashPrice(String editionId) =>
      _now().isBefore(flashEndsAt) ? _flashPrices[editionId] : null;

  BundleModel? bundle(String id) =>
      _bundleModels().where((b) => b.id == id).firstOrNull;

  DealsModel toModel() => DealsModel(
    flashSale: FlashSaleModel(
      title: 'Flash sale',
      endsAt: flashEndsAt,
      items: [
        for (final MapEntry(key: id, value: price) in _flashPrices.entries)
          ?_item(id, price: price),
      ],
    ),
    bundles: _bundleModels(),
    preorders: [
      for (final id in _preorders)
        if (_item(id) case final item?)
          PreorderModel(item: item, releaseDate: _releaseDate),
    ],
  );

  List<BundleModel> _bundleModels() => [
    for (final (id, title, editions, price) in _bundles)
      BundleModel(
        id: id,
        title: title,
        items: [for (final e in editions) ?_item(e)],
        priceBdt: price,
      ),
  ];

  static DealItemModel? _item(String editionId, {int? price}) {
    for (final book in BookFixtures.all) {
      for (final edition in book.editions) {
        if (edition.id != editionId) continue;
        return DealItemModel(
          bookId: book.id,
          editionId: edition.id,
          title: book.title,
          regularPriceBdt: edition.priceBdt,
          priceBdt: price ?? edition.priceBdt,
          coverSeed: book.coverSeed,
        );
      }
    }
    return null;
  }
}
