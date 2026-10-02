// Verified Purchase reads "me"'s orders, and a saved review updates the
// catalog Book's rating.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../../orders/data/sources/order_fake_store.dart';
import '../../../orders/domain/entities/order_status.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../domain/entities/review_rules.dart';
import 'review_record.dart';
import 'review_seed.dart';

/// Every reader's reviews, one per reader per Book. Changes are made as
/// [P2pPeople.me]; a refused one answers `null`.
class ReviewFakeStore {
  ReviewFakeStore(
    this.orders, {
    bool Function(String readerId)? isBanned,
    DateTime Function()? clock,
  }) : isBanned = isBanned ?? ((_) => false),
       now = clock ?? DateTime.now {
    reviews.addAll(reviewSeed(now()).reversed);
  }

  static const _me = P2pPeople.me;
  final OrderFakeStore orders;
  final bool Function(String readerId) isBanned;
  final DateTime Function() now;

  /// Newest first.
  final List<ReviewRecord> reviews = [];
  int _ids = 0;

  ReviewRecord? find(String id) => reviews.where((r) => r.id == id).firstOrNull;

  List<ReviewRecord> forBook(String bookId) =>
      reviews.where((r) => r.bookId == bookId).toList();

  ReviewRecord? mine(String bookId) =>
      reviews.where((r) => r.bookId == bookId && r.authorId == _me).firstOrNull;

  /// One decimal; 0 with no reviews.
  double average(String bookId) {
    final list = forBook(bookId);
    if (list.isEmpty) return 0;
    final sum = list.fold<int>(0, (s, r) => s + r.stars);
    return (sum / list.length * 10).round() / 10;
  }

  /// A seed reader's flag; for "me", a delivered, non-donation order line.
  bool verified(ReviewRecord r) => r.authorId == _me
      ? orders.all.any(
          (o) =>
              o.status == OrderStatus.delivered &&
              !o.isDonation &&
              o.lines.any((l) => l.bookId == r.bookId),
        )
      : r.verified;

  /// Saving again edits "me"'s review.
  ReviewRecord? save(String bookId, int stars, String text) {
    if (isBanned(_me) ||
        ReviewRules.check(stars, text) != null ||
        !BookFixtures.all.any((b) => b.id == bookId)) {
      return null;
    }
    final review = switch (mine(bookId)) {
      final r? =>
        r
          ..stars = stars
          ..text = text.trim()
          ..editedAt = now(),
      null => ReviewRecord(
        id: 'rv-new-${++_ids}',
        bookId: bookId,
        authorId: _me,
        stars: stars,
        text: text.trim(),
        createdAt: now(),
      ),
    };
    if (!reviews.contains(review)) reviews.insert(0, review);
    _rate(bookId);
    return review;
  }

  /// Deletes "me"'s review of [bookId]; `false` when there's none.
  bool delete(String bookId) {
    final review = mine(bookId);
    if (review != null) remove(review.id);
    return review != null;
  }

  /// Deletes a review (its author, or a moderator).
  void remove(String id) {
    final review = find(id);
    if (review == null) return;
    reviews.remove(review);
    _rate(review.bookId);
  }

  // ponytail: the Go backend owns Book.rating; this keeps the demo honest.
  void _rate(String bookId) {
    if (forBook(bookId).isEmpty) return;
    final i = BookFixtures.all.indexWhere((b) => b.id == bookId);
    if (i < 0) return;
    BookFixtures.all[i] = BookFixtures.all[i].copyWith(rating: average(bookId));
  }
}
