// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  id: json['id'] as String,
  bookId: json['bookId'] as String,
  authorId: json['authorId'] as String,
  authorName: json['authorName'] as String,
  stars: (json['stars'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  text: json['text'] as String? ?? '',
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
  verified: json['verified'] as bool? ?? false,
  isMine: json['isMine'] as bool? ?? false,
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookId': instance.bookId,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'stars': instance.stars,
      'createdAt': instance.createdAt.toIso8601String(),
      'text': instance.text,
      'editedAt': instance.editedAt?.toIso8601String(),
      'verified': instance.verified,
      'isMine': instance.isMine,
    };

_BookReviewsModel _$BookReviewsModelFromJson(Map<String, dynamic> json) =>
    _BookReviewsModel(
      average: (json['average'] as num?)?.toDouble() ?? 0,
      count: (json['count'] as num?)?.toInt() ?? 0,
      mine: json['mine'] == null
          ? null
          : ReviewModel.fromJson(json['mine'] as Map<String, dynamic>),
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ReviewModel>[],
    );

Map<String, dynamic> _$BookReviewsModelToJson(_BookReviewsModel instance) =>
    <String, dynamic>{
      'average': instance.average,
      'count': instance.count,
      'mine': instance.mine?.toJson(),
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
    };
