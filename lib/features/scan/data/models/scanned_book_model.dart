import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/scanned_book.dart';

part 'scanned_book_model.freezed.dart';
part 'scanned_book_model.g.dart';

/// JSON shape of a [ScannedBook].
@freezed
abstract class ScannedBookModel with _$ScannedBookModel {
  const factory ScannedBookModel({
    required String bookId,
    required String title,
    required String author,
    required String isbn,
    @Default(0) int coverSeed,
    int? newPriceBdt,
  }) = _ScannedBookModel;

  factory ScannedBookModel.fromJson(Map<String, dynamic> json) =>
      _$ScannedBookModelFromJson(json);
}

extension ScannedBookModelX on ScannedBookModel {
  ScannedBook toEntity() => ScannedBook(
    bookId: bookId,
    title: title,
    author: author,
    isbn: isbn,
    coverSeed: coverSeed,
    newPriceBdt: newPriceBdt,
  );
}
