import '../entities/publisher.dart';

/// Category, Author and Publisher records behind a [Book]'s ids.
abstract interface class CatalogRecordsRepository {
  /// `null` when [id] is not a known Publisher.
  Future<Publisher?> publisher(String id);
}
