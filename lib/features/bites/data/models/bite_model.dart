import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/bite.dart';

part 'bite_model.freezed.dart';
part 'bite_model.g.dart';

/// JSON shape of a Bite. The server says whose it is ([isMine]) and joins
/// the tagged Book's title.
@freezed
abstract class BiteModel with _$BiteModel {
  const factory BiteModel({
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
  }) = _BiteModel;

  factory BiteModel.fromJson(Map<String, dynamic> json) =>
      _$BiteModelFromJson(json);
}

/// A comment on a Bite. Top comments carry their [replies]; a reply has a
/// [parentId] and no replies of its own.
@freezed
abstract class BiteCommentModel with _$BiteCommentModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory BiteCommentModel({
    required String id,
    required String authorId,
    required String authorName,
    required String text,
    required DateTime createdAt,
    String? parentId,
    @Default(false) bool isMine,
    @Default(<BiteCommentModel>[]) List<BiteCommentModel> replies,
  }) = _BiteCommentModel;

  factory BiteCommentModel.fromJson(Map<String, dynamic> json) =>
      _$BiteCommentModelFromJson(json);
}

/// One Bite with its comments, oldest first.
@freezed
abstract class BiteDetailModel with _$BiteDetailModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory BiteDetailModel({
    required BiteModel bite,
    @Default(<BiteCommentModel>[]) List<BiteCommentModel> comments,
  }) = _BiteDetailModel;

  factory BiteDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BiteDetailModelFromJson(json);
}

extension BiteModelX on BiteModel {
  Bite toEntity() => Bite(
    id: id,
    authorId: authorId,
    authorName: authorName,
    authorArea: authorArea,
    text: text,
    createdAt: createdAt,
    editedAt: editedAt,
    bookId: bookId,
    bookTitle: bookTitle,
    spoiler: spoiler,
    likes: likes,
    liked: liked,
    comments: comments,
    isMine: isMine,
  );
}

extension BiteCommentModelX on BiteCommentModel {
  BiteComment toEntity() => BiteComment(
    id: id,
    authorId: authorId,
    authorName: authorName,
    text: text,
    createdAt: createdAt,
    parentId: parentId,
    isMine: isMine,
    replies: [for (final r in replies) r.toEntity()],
  );
}

extension BiteDetailModelX on BiteDetailModel {
  BiteDetail toEntity() => BiteDetail(
    bite: bite.toEntity(),
    comments: [for (final c in comments) c.toEntity()],
  );
}
