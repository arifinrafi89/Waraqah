// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShelfEntryModel _$ShelfEntryModelFromJson(Map<String, dynamic> json) =>
    _ShelfEntryModel(
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      shelf: $enumDecode(_$ShelfEnumMap, json['shelf']),
      addedAt: DateTime.parse(json['addedAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      pagesRead: (json['pagesRead'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShelfEntryModelToJson(_ShelfEntryModel instance) =>
    <String, dynamic>{
      'book': instance.book.toJson(),
      'shelf': _$ShelfEnumMap[instance.shelf]!,
      'addedAt': instance.addedAt.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'progress': instance.progress,
      'pagesRead': instance.pagesRead,
      'totalPages': instance.totalPages,
    };

const _$ShelfEnumMap = {
  Shelf.wantToRead: 'wantToRead',
  Shelf.reading: 'reading',
  Shelf.finished: 'finished',
};
