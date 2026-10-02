/// A Bite as the fake backend keeps it. Likes are reader ids, so the count
/// and "liked by me" both come from [likedBy].
class BiteRecord {
  BiteRecord({
    required this.id,
    required this.authorId,
    required this.text,
    required this.createdAt,
    this.bookId,
    this.spoiler = false,
    Set<String>? likedBy,
  }) : likedBy = likedBy ?? {};

  final String id;
  final String authorId;
  final DateTime createdAt;
  final Set<String> likedBy;
  String text;
  String? bookId;
  bool spoiler;
  DateTime? editedAt;
}

/// A comment on [biteId]. A reply's [parentId] is always a top comment.
class CommentRecord {
  CommentRecord({
    required this.id,
    required this.biteId,
    required this.authorId,
    required this.text,
    required this.createdAt,
    this.parentId,
  });

  final String id;
  final String biteId;
  final String authorId;
  final String text;
  final DateTime createdAt;
  final String? parentId;
}
