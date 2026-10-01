import '../../../p2p/data/sources/p2p_people.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/sell_back.dart';
import '../../domain/entities/sell_back_rules.dart';
import '../models/sell_back_model.dart';
import 'sell_back_books.dart';

/// Sell Backs already made, with who made them: the reader's Zero to One
/// (paid, matching the wallet's first credit) and Sapiens (picked up), and
/// another reader's Calculus waiting to be graded.
List<(String, SellBackModel)> sellBackSeed(DateTime now) {
  SellBackModel make(
    String id,
    String bookId,
    BookCondition condition,
    SellBackStatus status,
    Duration ago, {
    int? paid,
  }) {
    final book = SellBackBooks.find(bookId)!;
    return SellBackModel(
      id: id,
      book: book,
      condition: condition,
      quoteBdt: SellBackRules.quote(book.newPriceBdt, condition),
      status: status,
      pickupAddress: 'Road 7, Dhanmondi, Dhaka',
      createdAt: now.subtract(ago),
      gradedCondition: paid == null ? null : condition,
      paidBdt: paid,
    );
  }

  return [
    (
      P2pPeople.me,
      make(
        'SB-201',
        'bk-zero',
        BookCondition.likeNew,
        SellBackStatus.paid,
        const Duration(days: 13),
        paid: 180,
      ),
    ),
    (
      'p-nabila',
      make(
        'SB-202',
        'bk-calculus',
        BookCondition.good,
        SellBackStatus.pickedUp,
        const Duration(days: 2),
      ),
    ),
    (
      P2pPeople.me,
      make(
        'SB-203',
        'bk-sapiens',
        BookCondition.veryGood,
        SellBackStatus.pickedUp,
        const Duration(days: 1),
      ),
    ),
  ];
}
