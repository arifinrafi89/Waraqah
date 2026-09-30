// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookDetails _$BookDetailsFromJson(Map<String, dynamic> json) => _BookDetails(
  bookId: json['bookId'] as String,
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => BookReview.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BookReview>[],
  description: json['description'] as String?,
  pages: (json['pages'] as num?)?.toInt(),
  publisher: json['publisher'] as String?,
);

Map<String, dynamic> _$BookDetailsToJson(_BookDetails instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
      'description': instance.description,
      'pages': instance.pages,
      'publisher': instance.publisher,
    };
