import '../../../../core/models/book.dart';
import '../entities/author.dart';
import '../entities/category.dart';
import '../entities/publisher.dart';

/// Category, Author and Publisher records behind a [Book]'s ids.
abstract interface class CatalogRecordsRepository {
  /// A Section's Categories.
  Future<List<Category>> categories(Section section);

  /// `null` when [id] is not a known Author.
  Future<Author?> author(String id);

  /// `null` when [id] is not a known Publisher.
  Future<Publisher?> publisher(String id);
}
