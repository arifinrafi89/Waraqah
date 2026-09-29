// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookDetails _$BookDetailsFromJson(Map<String, dynamic> json) => _BookDetails(
  bookId: json['bookId'] as String,
  offers: (json['offers'] as List<dynamic>)
      .map((e) => VendorOffer.fromJson(e as Map<String, dynamic>))
      .toList(),
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => BookReview.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BookReview>[],
  description: json['description'] as String?,
  pages: (json['pages'] as num?)?.toInt(),
  language: json['language'] as String?,
  publisher: json['publisher'] as String?,
);

Map<String, dynamic> _$BookDetailsToJson(_BookDetails instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'offers': instance.offers,
      'reviews': instance.reviews,
      'description': instance.description,
      'pages': instance.pages,
      'language': instance.language,
      'publisher': instance.publisher,
    };
