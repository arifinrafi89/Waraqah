import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

/// A Reader's 1–5 stars and optional text on a Book, one per Book.
@freezed
abstract class Review with _$Review {
  const factory Review({
    required String id,
    required String bookId,
    required String authorId,
    required String authorName,
    required int stars,
    required DateTime createdAt,
    @Default('') String text,
    DateTime? editedAt,

    /// The Reader got this Book delivered from Waraqah.
    @Default(false) bool verified,
    @Default(false) bool isMine,
  }) = _Review;
}

/// A Book's reviews, newest first, with the average and "me"'s own.
@freezed
abstract class BookReviews with _$BookReviews {
  const factory BookReviews({
    @Default(0) double average,
    @Default(0) int count,
    Review? mine,
    @Default(<Review>[]) List<Review> reviews,
  }) = _BookReviews;
}
