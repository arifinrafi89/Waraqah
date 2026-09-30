// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookReview _$BookReviewFromJson(Map<String, dynamic> json) => _BookReview(
  id: json['id'] as String,
  reviewerName: json['reviewerName'] as String,
  reviewerHandle: json['reviewerHandle'] as String,
  rating: (json['rating'] as num).toInt(),
  text: json['text'] as String,
  avatarSeed: (json['avatarSeed'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BookReviewToJson(_BookReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reviewerName': instance.reviewerName,
      'reviewerHandle': instance.reviewerHandle,
      'rating': instance.rating,
      'text': instance.text,
      'avatarSeed': instance.avatarSeed,
    };
