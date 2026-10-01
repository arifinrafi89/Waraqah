import '../entities/booklist.dart';

/// Staff's Booklists and the signed-in Reader's own. A refused change
/// throws.
abstract interface class BooklistRepository {
  /// Every Staff Booklist and the Reader's own.
  Future<List<Booklist>> booklists();

  /// `null` when [id] is not a known Booklist.
  Future<Booklist?> booklist(String id);

  /// No [id] makes a new own list called [name]; with one, renames it
  /// and/or replaces its [bookIds].
  Future<Booklist> saveMine({String? id, String? name, List<String>? bookIds});

  Future<void> deleteMine(String id);
}
