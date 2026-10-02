// A Bite may tag a catalog Book; authors are marketplace readers, told
// about comments and replies.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../notifications/data/sources/notification_fake_store.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../domain/entities/bite_rules.dart';
import 'bite_fixtures.dart';
import 'bite_records.dart';

/// Every reader's Bites, likes and comments, as the fake backend keeps
/// them. Changes are made as [P2pPeople.me]; a refused one answers `null`.
class BiteFakeStore {
  BiteFakeStore({
    bool Function(String readerId)? isHidden,
    bool Function(String readerId)? isBanned,
    bool Function(String readerId)? follows,
    this.notifications,
    DateTime Function()? clock,
  }) : isHidden = isHidden ?? _no,
       isBanned = isBanned ?? _no,
       follows = follows ?? _no,
       now = clock ?? DateTime.now {
    final seed = BiteFixtures.seed(now());
    bites.addAll(seed.bites);
    comments.addAll(seed.comments);
  }

  static bool _no(String _) => false;
  static const _me = P2pPeople.me;

  /// Readers "me" blocked, or banned ones: left out of every feed.
  final bool Function(String readerId) isHidden;
  final bool Function(String readerId) isBanned;

  /// Whether "me" follows the reader.
  final bool Function(String readerId) follows;
  final NotificationFakeStore? notifications;
  final DateTime Function() now;

  /// Newest first.
  final List<BiteRecord> bites = [];

  /// Oldest first.
  final List<CommentRecord> comments = [];
  int _ids = 0;

  /// A fresh number for a new Bite or comment id.
  int nextId() => ++_ids;

  BiteRecord? find(String id) => bites.where((b) => b.id == id).firstOrNull;

  CommentRecord? findComment(String id) =>
      comments.where((c) => c.id == id).firstOrNull;

  // ponytail: no paging; cursor ?before= when the feed grows.
  List<BiteRecord> feed({
    bool following = false,
    String? bookId,
    String? authorId,
  }) => bites
      .where(
        (b) =>
            !isHidden(b.authorId) &&
            (!following || follows(b.authorId)) &&
            (bookId == null || b.bookId == bookId) &&
            (authorId == null || b.authorId == authorId),
      )
      .take(30)
      .toList();

  BiteRecord? post(String text, String? bookId, {bool spoiler = false}) {
    if (isBanned(_me) || !_valid(text, bookId, spoiler)) return null;
    final bite = BiteRecord(
      id: 'bt-new-${nextId()}',
      authorId: _me,
      text: text.trim(),
      createdAt: now(),
      bookId: bookId,
      spoiler: spoiler,
    );
    bites.insert(0, bite);
    return bite;
  }

  BiteRecord? edit(String id, String text, String? bookId, bool spoiler) {
    final bite = _mine(id);
    if (bite == null || !_valid(text, bookId, spoiler)) return null;
    return bite
      ..text = text.trim()
      ..bookId = bookId
      ..spoiler = spoiler
      ..editedAt = now();
  }

  bool delete(String id) {
    if (_mine(id) == null) return false;
    remove(id);
    return true;
  }

  /// Deletes a Bite and its comments (its author, or a moderator).
  void remove(String id) {
    bites.removeWhere((b) => b.id == id);
    comments.removeWhere((c) => c.biteId == id);
  }

  BiteRecord? like(String id, {required bool liked}) {
    final bite = find(id);
    if (bite == null) return null;
    liked ? bite.likedBy.add(_me) : bite.likedBy.remove(_me);
    return bite;
  }

  BiteRecord? _mine(String id) => find(id)?.authorId == _me ? find(id) : null;

  bool _valid(String text, String? bookId, bool spoiler) =>
      BiteRules.check(text, bookId: bookId, spoiler: spoiler) == null &&
      (bookId == null || BookFixtures.all.any((b) => b.id == bookId));
}
