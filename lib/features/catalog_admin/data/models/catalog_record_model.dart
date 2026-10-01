import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/catalog_record.dart';

part 'catalog_record_model.freezed.dart';
part 'catalog_record_model.g.dart';

/// A Category, Author or Publisher as the admin endpoints send it.
@freezed
abstract class CatalogRecordModel with _$CatalogRecordModel {
  const factory CatalogRecordModel({
    required String id,
    required String name,
    String? nameBn,
    Section? section,
    @Default(0) int bookCount,
  }) = _CatalogRecordModel;

  factory CatalogRecordModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogRecordModelFromJson(json);
}

extension CatalogRecordModelX on CatalogRecordModel {
  CatalogRecord toEntity() => CatalogRecord(
    id: id,
    name: name,
    nameBn: nameBn ?? '',
    section: section,
    bookCount: bookCount,
  );
}
