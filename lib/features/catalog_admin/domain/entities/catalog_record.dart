import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';

part 'catalog_record.freezed.dart';

/// What Staff manage beside Books: Categories, Authors and Publishers.
enum RecordKind { category, author, publisher }

/// One Category, Author or Publisher, with how many Books use it. Only a
/// Category has a [section]. No [id] = a new one.
@freezed
abstract class CatalogRecord with _$CatalogRecord {
  const factory CatalogRecord({
    String? id,
    @Default('') String name,
    @Default('') String nameBn,
    Section? section,
    @Default(0) int bookCount,
  }) = _CatalogRecord;
}

extension CatalogRecordX on CatalogRecord {
  /// The Bangla name in Bangla when there is one, else the English name.
  String label(bool isBangla) => isBangla && nameBn.isNotEmpty ? nameBn : name;
}
