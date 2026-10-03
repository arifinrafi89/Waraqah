import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/shelf_entry.dart';

part 'shelf_entry_model.freezed.dart';
part 'shelf_entry_model.g.dart';

/// JSON shape of a [ShelfEntry], with its Book inside.
@freezed
abstract class ShelfEntryModel with _$ShelfEntryModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory ShelfEntryModel({
    required Book book,
    required Shelf shelf,
    required DateTime addedAt,
    DateTime? finishedAt,
  }) = _ShelfEntryModel;

  factory ShelfEntryModel.fromJson(Map<String, dynamic> json) =>
      _$ShelfEntryModelFromJson(json);
}

extension ShelfEntryModelX on ShelfEntryModel {
  ShelfEntry toEntity() => ShelfEntry(
    book: book,
    shelf: shelf,
    addedAt: addedAt,
    finishedAt: finishedAt,
  );
}
