import 'package:freezed_annotation/freezed_annotation.dart';

import 'book_review.dart';

part 'book_details.freezed.dart';
part 'book_details.g.dart';

/// Everything the detail page shows beyond the catalog's [Book] summary.
///
/// Kept separate from `Book` so the list screens stay light and the shared
/// core model does not change.
@freezed
abstract class BookDetails with _$BookDetails {
  // Deep toJson: the fake API serialises the reviews inside the details.
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory BookDetails({
    required String bookId,
    @Default(<BookReview>[]) List<BookReview> reviews,
    String? description,
    int? pages,
    String? publisher,
  }) = _BookDetails;

  factory BookDetails.fromJson(Map<String, dynamic> json) =>
      _$BookDetailsFromJson(json);
}
