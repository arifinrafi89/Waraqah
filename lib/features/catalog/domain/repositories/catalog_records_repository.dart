import '../../../../core/models/book.dart';
import '../entities/author.dart';
import '../entities/category.dart';
import '../entities/collection.dart';
import '../entities/expert.dart';
import '../entities/publisher.dart';

/// Category, Author, Publisher and Collection records behind a [Book]'s ids.
abstract interface class CatalogRecordsRepository {
  /// A Section's Categories.
  Future<List<Category>> categories(Section section);

  /// `null` when [id] is not a known Author.
  Future<Author?> author(String id);

  /// `null` when [id] is not a known Publisher.
  Future<Publisher?> publisher(String id);

  /// Every Collection, or only [section]'s; only Expert Picks when
  /// [hasExpert] is true, none when false.
  Future<List<Collection>> collections(Section? section, {bool? hasExpert});

  /// `null` when [id] is not a known Collection.
  Future<Collection?> collection(String id);

  Future<List<Expert>> experts();

  /// `null` when [id] is not a known Expert.
  Future<ExpertDetail?> expert(String id);
}
