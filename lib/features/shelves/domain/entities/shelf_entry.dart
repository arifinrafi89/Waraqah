enum ShelfStatus { wantToRead, reading, finished }

class ShelfEntry {
  const ShelfEntry({
    required this.id,
    this.bookId,
    required this.title,
    required this.author,
    required this.status,
    this.progress = 0,
    this.addedAfterDelivery = false,
  });

  final String id;
  final String? bookId;
  final String title;
  final String author;
  final ShelfStatus status;
  final double progress;
  final bool addedAfterDelivery;

  ShelfEntry copyWith({ShelfStatus? status, double? progress}) => ShelfEntry(
    id: id,
    bookId: bookId,
    title: title,
    author: author,
    status: status ?? this.status,
    progress: progress ?? this.progress,
    addedAfterDelivery: addedAfterDelivery,
  );
}
