import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/booklist.dart';

part 'booklist_model.freezed.dart';
part 'booklist_model.g.dart';

/// A Booklist as stored: its books by id, in order.
@freezed
abstract class BooklistModel with _$BooklistModel {
  const factory BooklistModel({
    required String id,
    required String titleEn,
    required String titleBn,
    required BooklistKind kind,
    required List<String> bookIds,
    String? noteEn,
    String? noteBn,
    @Default(false) bool isMine,
  }) = _BooklistModel;

  factory BooklistModel.fromJson(Map<String, dynamic> json) =>
      _$BooklistModelFromJson(json);
}

extension BooklistModelX on BooklistModel {
  Booklist toEntity(List<Book> books) => Booklist(
    id: id,
    titleEn: titleEn,
    titleBn: titleBn,
    noteEn: noteEn,
    noteBn: noteBn,
    kind: kind,
    books: books,
    isMine: isMine,
  );
}
