/// A review as the fake backend keeps it.
class ReviewRecord {
  ReviewRecord({
    required this.id,
    required this.bookId,
    required this.authorId,
    required this.stars,
    required this.text,
    required this.createdAt,
    this.verified = false,
  });

  final String id;
  final String bookId;
  final String authorId;
  final DateTime createdAt;

  /// Seed readers' purchases; "me"'s is worked out from orders.
  final bool verified;
  int stars;
  String text;
  DateTime? editedAt;
}
