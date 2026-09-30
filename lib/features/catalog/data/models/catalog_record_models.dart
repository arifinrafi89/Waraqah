import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/author.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/publisher.dart';

part 'catalog_record_models.freezed.dart';
part 'catalog_record_models.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required Section section,
    required String nameEn,
    required String nameBn,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
abstract class AuthorModel with _$AuthorModel {
  const factory AuthorModel({
    required String id,
    required String name,
    String? nameBn,
    String? bio,
  }) = _AuthorModel;

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);
}

@freezed
abstract class PublisherModel with _$PublisherModel {
  const factory PublisherModel({
    required String id,
    required String name,
    String? nameBn,
  }) = _PublisherModel;

  factory PublisherModel.fromJson(Map<String, dynamic> json) =>
      _$PublisherModelFromJson(json);
}

extension CategoryModelX on CategoryModel {
  Category toEntity() =>
      Category(id: id, section: section, nameEn: nameEn, nameBn: nameBn);
}

extension AuthorModelX on AuthorModel {
  Author toEntity() => Author(id: id, name: name, nameBn: nameBn, bio: bio);
}

extension PublisherModelX on PublisherModel {
  Publisher toEntity() => Publisher(id: id, name: name, nameBn: nameBn);
}
