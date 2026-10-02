import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/review.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

/// JSON shape of a [Review]. The server says whose it is and whether the
/// purchase is verified.
@freezed
abstract class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required String id,
    required String bookId,
    required String authorId,
    required String authorName,
    required int stars,
    required DateTime createdAt,
    @Default('') String text,
    DateTime? editedAt,
    @Default(false) bool verified,
    @Default(false) bool isMine,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

@freezed
abstract class BookReviewsModel with _$BookReviewsModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory BookReviewsModel({
    @Default(0) double average,
    @Default(0) int count,
    ReviewModel? mine,
    @Default(<ReviewModel>[]) List<ReviewModel> reviews,
  }) = _BookReviewsModel;

  factory BookReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$BookReviewsModelFromJson(json);
}

extension ReviewModelX on ReviewModel {
  Review toEntity() => Review(
    id: id,
    bookId: bookId,
    authorId: authorId,
    authorName: authorName,
    stars: stars,
    createdAt: createdAt,
    text: text,
    editedAt: editedAt,
    verified: verified,
    isMine: isMine,
  );
}

extension BookReviewsModelX on BookReviewsModel {
  BookReviews toEntity() => BookReviews(
    average: average,
    count: count,
    mine: mine?.toEntity(),
    reviews: [for (final r in reviews) r.toEntity()],
  );
}
