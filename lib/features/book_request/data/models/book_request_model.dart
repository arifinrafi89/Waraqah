import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/book_request.dart';

part 'book_request_model.freezed.dart';
part 'book_request_model.g.dart';

/// JSON shape of a [BookRequest].
@freezed
abstract class BookRequestModel with _$BookRequestModel {
  const factory BookRequestModel({
    required String id,
    required String title,
    required DateTime createdAt,
    String? author,
    String? bookId,
    int? maxPriceBdt,
    String? note,
    @Default(true) bool isOpen,
    @Default(0) int matchCount,
    @Default(0) int notifiedSellers,

    /// Who asked. Only the server sees this.
    @JsonKey(includeToJson: false) @Default('me') String requesterId,
  }) = _BookRequestModel;

  factory BookRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookRequestModelFromJson(json);
}

extension BookRequestModelX on BookRequestModel {
  BookRequest toEntity() => BookRequest(
    id: id,
    title: title,
    createdAt: createdAt,
    author: author,
    bookId: bookId,
    maxPriceBdt: maxPriceBdt,
    note: note,
    isOpen: isOpen,
    matchCount: matchCount,
    notifiedSellers: notifiedSellers,
  );

  BookRequestDraft get draft =>
      BookRequestDraft(title: title, bookId: bookId, maxPriceBdt: maxPriceBdt);
}
