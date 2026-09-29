import 'package:freezed_annotation/freezed_annotation.dart';

part 'edition.freezed.dart';
part 'edition.g.dart';

enum BookFormat { paperback, hardcover, ebook }

enum BookLanguage { bangla, english, arabic }

/// One buyable version of a [Book]: a format in a language, with its own
/// price and stock. eBooks are seeded with a stock of 999.
@freezed
abstract class Edition with _$Edition {
  const factory Edition({
    required String id,
    required BookFormat format,
    required BookLanguage language,
    required int priceBdt,
    required int stock,
    int? listPriceBdt,
    @Default(false) bool isPreorder,
    String? isbn,
  }) = _Edition;

  factory Edition.fromJson(Map<String, dynamic> json) =>
      _$EditionFromJson(json);
}

extension EditionX on Edition {
  bool get isDiscounted => listPriceBdt != null && listPriceBdt! > priceBdt;

  /// Can be ordered now: in stock or a pre-order.
  bool get isOrderable => stock > 0 || isPreorder;
}
