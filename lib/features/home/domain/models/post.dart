// UI label "Book-Bite"; class stays `Post` to match the `posts` table.
class Post {
  final String id;
  final String authorId;
  final String content;
  final DateTime createdAt;
  final List<String> taggedBookIds;

  const Post({
    required this.id,
    required this.authorId,
    required this.content,
    required this.createdAt,
    this.taggedBookIds = const [],
  });
}
