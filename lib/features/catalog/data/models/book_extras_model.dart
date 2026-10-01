import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/book_series.dart';
import '../../domain/entities/look_inside.dart';

part 'book_extras_model.freezed.dart';
part 'book_extras_model.g.dart';

@freezed
abstract class ContentsEntryModel with _$ContentsEntryModel {
  const factory ContentsEntryModel({
    required String title,
    @Default(false) bool isPart,
  }) = _ContentsEntryModel;

  factory ContentsEntryModel.fromJson(Map<String, dynamic> json) =>
      _$ContentsEntryModelFromJson(json);
}

@freezed
abstract class LookInsideModel with _$LookInsideModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory LookInsideModel({
    @Default(<ContentsEntryModel>[]) List<ContentsEntryModel> contents,
    @Default(<String>[]) List<String> samplePages,
  }) = _LookInsideModel;

  factory LookInsideModel.fromJson(Map<String, dynamic> json) =>
      _$LookInsideModelFromJson(json);
}

@freezed
abstract class SeriesEntryModel with _$SeriesEntryModel {
  const factory SeriesEntryModel({
    required int position,
    required String title,
    String? bookId,
    @Default(0) int coverSeed,
  }) = _SeriesEntryModel;

  factory SeriesEntryModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesEntryModelFromJson(json);
}

@freezed
abstract class BookSeriesModel with _$BookSeriesModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory BookSeriesModel({
    required String id,
    required String name,
    required List<SeriesEntryModel> entries,
  }) = _BookSeriesModel;

  factory BookSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$BookSeriesModelFromJson(json);
}

extension LookInsideModelX on LookInsideModel {
  LookInside toEntity() => LookInside(
    contents: [
      for (final e in contents) ContentsEntry(title: e.title, isPart: e.isPart),
    ],
    samplePages: samplePages,
  );
}

extension BookSeriesModelX on BookSeriesModel {
  BookSeries toEntity() => BookSeries(
    id: id,
    name: name,
    entries: [
      for (final e in entries)
        SeriesEntry(
          position: e.position,
          title: e.title,
          bookId: e.bookId,
          coverSeed: e.coverSeed,
        ),
    ],
  );
}
