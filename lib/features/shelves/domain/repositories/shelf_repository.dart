import '../entities/shelf_entry.dart';

abstract interface class ShelfRepository {
  /// Every Book on the reader's shelves, newest first.
  Future<List<ShelfEntry>> mine();

  /// Moves a Book; answers the shelves after the move.
  Future<List<ShelfEntry>> move(ShelfMove move);
}
