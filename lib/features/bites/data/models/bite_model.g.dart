// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BiteModel _$BiteModelFromJson(Map<String, dynamic> json) => _BiteModel(
  id: json['id'] as String,
  authorId: json['authorId'] as String,
  authorName: json['authorName'] as String,
  authorArea: json['authorArea'] as String,
  text: json['text'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
  bookId: json['bookId'] as String?,
  bookTitle: json['bookTitle'] as String?,
  spoiler: json['spoiler'] as bool? ?? false,
  likes: (json['likes'] as num?)?.toInt() ?? 0,
  liked: json['liked'] as bool? ?? false,
  comments: (json['comments'] as num?)?.toInt() ?? 0,
  isMine: json['isMine'] as bool? ?? false,
);

Map<String, dynamic> _$BiteModelToJson(_BiteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'authorArea': instance.authorArea,
      'text': instance.text,
      'createdAt': instance.createdAt.toIso8601String(),
      'editedAt': instance.editedAt?.toIso8601String(),
      'bookId': instance.bookId,
      'bookTitle': instance.bookTitle,
      'spoiler': instance.spoiler,
      'likes': instance.likes,
      'liked': instance.liked,
      'comments': instance.comments,
      'isMine': instance.isMine,
    };

_BiteCommentModel _$BiteCommentModelFromJson(Map<String, dynamic> json) =>
    _BiteCommentModel(
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      parentId: json['parentId'] as String?,
      isMine: json['isMine'] as bool? ?? false,
      replies:
          (json['replies'] as List<dynamic>?)
              ?.map((e) => BiteCommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BiteCommentModel>[],
    );

Map<String, dynamic> _$BiteCommentModelToJson(_BiteCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'text': instance.text,
      'createdAt': instance.createdAt.toIso8601String(),
      'parentId': instance.parentId,
      'isMine': instance.isMine,
      'replies': instance.replies.map((e) => e.toJson()).toList(),
    };

_BiteDetailModel _$BiteDetailModelFromJson(Map<String, dynamic> json) =>
    _BiteDetailModel(
      bite: BiteModel.fromJson(json['bite'] as Map<String, dynamic>),
      comments:
          (json['comments'] as List<dynamic>?)
              ?.map((e) => BiteCommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BiteCommentModel>[],
    );

Map<String, dynamic> _$BiteDetailModelToJson(_BiteDetailModel instance) =>
    <String, dynamic>{
      'bite': instance.bite.toJson(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };
