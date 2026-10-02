import '../entities/bite.dart';
import '../entities/bite_query.dart';

/// Book-Bites: the feeds, one Bite with its comments, and "me"'s changes.
abstract interface class BiteRepository {
  Future<List<Bite>> feed(BiteQuery query);

  Future<BiteDetail> detail(String id);

  /// Posts [draft], or saves the edit when it has an id.
  Future<Bite> save(BiteDraft draft);

  Future<void> delete(String id);

  Future<Bite> like(String id, {required bool liked});

  Future<BiteDetail> comment(String biteId, String text, {String? parentId});

  Future<BiteDetail> deleteComment(String id);
}
