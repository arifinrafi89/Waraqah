import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_details.freezed.dart';
part 'book_details.g.dart';

/// Everything the detail page shows beyond the catalog's [Book] summary.
///
/// Kept separate from `Book` so the list screens stay light and the shared
/// core model does not change.
@freezed
abstract class BookDetails with _$BookDetails {
  const factory BookDetails({
    required String bookId,
    String? description,
    int? pages,
  }) = _BookDetails;

  factory BookDetails.fromJson(Map<String, dynamic> json) =>
      _$BookDetailsFromJson(json);
}
