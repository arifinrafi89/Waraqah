import '../../../p2p/domain/entities/p2p_listing.dart';
import '../entities/sell_back.dart';

abstract interface class SellBackRepository {
  /// Catalog Books matching [query] that Waraqah buys back.
  Future<List<SellBackBook>> books(String query);

  /// `null` when Waraqah doesn't buy that Book back.
  Future<SellBackBook?> book(String bookId);

  /// Accepts the quote and books the pickup.
  Future<SellBack> create(SellBackDraft draft);

  /// The reader's Sell Backs, newest first.
  Future<List<SellBack>> mine();

  /// Books picked up and waiting to be graded, for staff.
  Future<List<SellBack>> queue();

  /// Staff's grade: pay for it at [condition] and publish it as Certified
  /// Used, or send it back. [by] is the staff member's name. Answers the
  /// queue.
  Future<List<SellBack>> grade(
    String id, {
    required BookCondition condition,
    required bool accept,
    required String by,
  });
}
