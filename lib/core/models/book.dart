import 'package:freezed_annotation/freezed_annotation.dart';

import 'edition.dart';

part 'book.freezed.dart';
part 'book.g.dart';

enum Section {
  academic,
  religious,
  literature,
  admissionJobPrep,
  schoolCollege,
  nonFiction,
  skillsTech,
  children,
}

enum CardStockStatus { inStock, preorder, outOfStock }

/// The one model shared by every feature, so it lives in `core/` rather than
/// inside a single LEGO block. Catalog, Home and the AI assistant all speak
/// `Book`, which is what lets them compose without knowing about each other.
@freezed
abstract class Book with _$Book {
  // Deep toJson: the fake API serialises Editions inside each Book.
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Book({
    required String id,
    required String title,
    required String author,
    required int priceBdt,
    required String vendor,
    @Default(1) int vendorCount,
    @Default(0) double rating,
    @Default(<String>[]) List<String> tags,
    @Default(false) bool isBeneficial,
    @Default(false) bool isBestValue,
    @Default(0) int coverSeed,
    int? originalPriceBdt,
    String? shortTitle,
    String? category,
    Section? section,
    BookLanguage? originalLanguage,
    @Default(<Edition>[]) List<Edition> editions,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

extension BookX on Book {
  /// Title trimmed for the small cover art, falling back to the full title.
  String get coverLabel => shortTitle ?? title;

  bool get isDiscounted =>
      originalPriceBdt != null && originalPriceBdt! > priceBdt;

  /// The Edition the card leads with: the cheapest one that can be ordered
  /// now, or the cheapest overall when none can. Null while there are none.
  Edition? get fromEdition {
    if (editions.isEmpty) return null;
    final orderable = editions.where((e) => e.isOrderable);
    return _cheapest(orderable.isEmpty ? editions : orderable);
  }

  int get fromPriceBdt => fromEdition?.priceBdt ?? 0;

  int? get fromListPriceBdt => fromEdition?.listPriceBdt;

  bool get isFromEditionDiscounted => fromEdition?.isDiscounted ?? false;

  CardStockStatus get cardStockStatus {
    if (editions.any((e) => e.stock > 0)) return CardStockStatus.inStock;
    if (editions.any((e) => e.isPreorder)) return CardStockStatus.preorder;
    return CardStockStatus.outOfStock;
  }

  /// An Edition whose language differs from the Book's original language.
  bool isTranslation(Edition edition) =>
      originalLanguage != null && edition.language != originalLanguage;
}

Edition _cheapest(Iterable<Edition> editions) =>
    editions.reduce((a, b) => b.priceBdt < a.priceBdt ? b : a);
