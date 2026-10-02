// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookDetails _$BookDetailsFromJson(Map<String, dynamic> json) => _BookDetails(
  bookId: json['bookId'] as String,
  description: json['description'] as String?,
  pages: (json['pages'] as num?)?.toInt(),
);

Map<String, dynamic> _$BookDetailsToJson(_BookDetails instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'description': instance.description,
      'pages': instance.pages,
    };
