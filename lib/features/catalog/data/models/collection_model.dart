import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/collection.dart';

part 'collection_model.freezed.dart';
part 'collection_model.g.dart';

/// A Collection as stored: its books by id, in order.
@freezed
abstract class CollectionModel with _$CollectionModel {
  const factory CollectionModel({
    required String id,
    required String titleEn,
    required String titleBn,
    required String noteEn,
    required String noteBn,
    required List<String> bookIds,
    Section? section,
  }) = _CollectionModel;

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);
}

extension CollectionModelX on CollectionModel {
  Collection toEntity(List<Book> books) => Collection(
    id: id,
    titleEn: titleEn,
    titleBn: titleBn,
    noteEn: noteEn,
    noteBn: noteBn,
    section: section,
    books: books,
  );
}
