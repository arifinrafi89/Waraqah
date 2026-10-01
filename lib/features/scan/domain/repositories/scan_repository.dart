import '../entities/scanned_book.dart';

abstract interface class ScanRepository {
  /// The Book with this ISBN-13, or `null` when Waraqah doesn't have it.
  Future<ScannedBook?> lookUp(String isbn);
}
