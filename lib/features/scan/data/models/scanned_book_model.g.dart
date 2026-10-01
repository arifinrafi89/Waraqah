// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanned_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScannedBookModel _$ScannedBookModelFromJson(Map<String, dynamic> json) =>
    _ScannedBookModel(
      bookId: json['bookId'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      isbn: json['isbn'] as String,
      coverSeed: (json['coverSeed'] as num?)?.toInt() ?? 0,
      newPriceBdt: (json['newPriceBdt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ScannedBookModelToJson(_ScannedBookModel instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'author': instance.author,
      'isbn': instance.isbn,
      'coverSeed': instance.coverSeed,
      'newPriceBdt': instance.newPriceBdt,
    };
