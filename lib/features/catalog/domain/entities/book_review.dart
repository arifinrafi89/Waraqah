import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_review.freezed.dart';
part 'book_review.g.dart';

/// A reader's rating and short review of a title.
@freezed
abstract class BookReview with _$BookReview {
  const factory BookReview({
    required String id,
    required String reviewerName,
    required String reviewerHandle,
    required int rating,
    required String text,
    @Default(0) int avatarSeed,
  }) = _BookReview;

  factory BookReview.fromJson(Map<String, dynamic> json) =>
      _$BookReviewFromJson(json);
}

extension BookReviewX on BookReview {
  String get initial =>
      reviewerName.isEmpty ? '?' : reviewerName[0].toUpperCase();
}
