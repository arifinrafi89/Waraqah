import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

/// The one model shared by every feature, so it lives in `core/` rather than
/// inside a single LEGO block. Catalog, Home and the AI assistant all speak
/// `Book`, which is what lets them compose without knowing about each other.
@freezed
abstract class Book with _$Book {
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
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

extension BookX on Book {
  /// Title trimmed for the small cover art, falling back to the full title.
  String get coverLabel => shortTitle ?? title;

  bool get isDiscounted =>
      originalPriceBdt != null && originalPriceBdt! > priceBdt;
}
