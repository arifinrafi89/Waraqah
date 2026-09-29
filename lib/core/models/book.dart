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
  @Assert('editions.isNotEmpty', 'A Book needs at least one Edition')
  const factory Book({
    required String id,
    required String title,
    required String author,
    required String category,
    required Section section,
    required BookLanguage originalLanguage,
    required List<Edition> editions,
    @Default(0) double rating,
    @Default(<String>[]) List<String> tags,
    @Default(false) bool isBeneficial,
    @Default(0) int coverSeed,
    String? shortTitle,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

extension BookX on Book {
  /// Title trimmed for the small cover art, falling back to the full title.
  String get coverLabel => shortTitle ?? title;

  /// The Edition the card leads with: the cheapest one that can be ordered
  /// now, or the cheapest overall when none can.
  Edition get fromEdition {
    final orderable = editions.where((e) => e.isOrderable);
    return _cheapest(orderable.isEmpty ? editions : orderable);
  }

  int get fromPriceBdt => fromEdition.priceBdt;

  int? get fromListPriceBdt => fromEdition.listPriceBdt;

  bool get isFromEditionDiscounted => fromEdition.isDiscounted;

  CardStockStatus get cardStockStatus {
    if (editions.any((e) => e.stock > 0)) return CardStockStatus.inStock;
    if (editions.any((e) => e.isPreorder)) return CardStockStatus.preorder;
    return CardStockStatus.outOfStock;
  }

  /// An Edition whose language differs from the Book's original language.
  bool isTranslation(Edition edition) => edition.language != originalLanguage;
}

Edition _cheapest(Iterable<Edition> editions) =>
    editions.reduce((a, b) => b.priceBdt < a.priceBdt ? b : a);
