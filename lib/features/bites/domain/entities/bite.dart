import 'package:freezed_annotation/freezed_annotation.dart';

part 'bite.freezed.dart';

/// A short post in the Book-Bites feed. The server says whose it is
/// ([isMine]) and joins the tagged Book's title.
@freezed
abstract class Bite with _$Bite {
  const factory Bite({
    required String id,
    required String authorId,
    required String authorName,
    required String authorArea,
    required String text,
    required DateTime createdAt,
    DateTime? editedAt,
    String? bookId,
    String? bookTitle,
    @Default(false) bool spoiler,
    @Default(0) int likes,
    @Default(false) bool liked,
    @Default(0) int comments,
    @Default(false) bool isMine,
  }) = _Bite;
}

extension BiteX on Bite {
  String get initial => authorName.isEmpty ? '?' : authorName[0].toUpperCase();
  bool get hasBookTag => bookId != null && bookTitle != null;
}

/// A comment on a Bite. Top comments carry their [replies]; a reply has a
/// [parentId] and no replies of its own.
@freezed
abstract class BiteComment with _$BiteComment {
  const factory BiteComment({
    required String id,
    required String authorId,
    required String authorName,
    required String text,
    required DateTime createdAt,
    String? parentId,
    @Default(false) bool isMine,
    @Default(<BiteComment>[]) List<BiteComment> replies,
  }) = _BiteComment;
}

/// One Bite with its top comments, oldest first.
@freezed
abstract class BiteDetail with _$BiteDetail {
  const factory BiteDetail({
    required Bite bite,
    @Default(<BiteComment>[]) List<BiteComment> comments,
  }) = _BiteDetail;
}
