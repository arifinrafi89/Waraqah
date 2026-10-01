import 'p2p_people.dart';

/// One reader rating another after a sale: 1 to 5 stars and a few words.
class P2pRating {
  const P2pRating({
    required this.fromId,
    required this.toId,
    required this.stars,
    required this.at,
    this.listingId,
    this.comment,
  });

  final String fromId;
  final String toId;
  final int stars;
  final DateTime at;

  /// The sale it's about; `null` for ratings from before the app's records.
  final String? listingId;
  final String? comment;
}

/// Ratings readers gave each other before today, so seller pages aren't
/// empty. Talha already rated the signed-in reader for Operating Systems;
/// the reader hasn't rated Talha back yet.
abstract final class P2pRatingSeed {
  static List<P2pRating> all(DateTime now) {
    P2pRating rate(
      String from,
      String to,
      int stars,
      int daysAgo, [
      String? comment,
      String? listingId,
    ]) => P2pRating(
      fromId: from,
      toId: to,
      stars: stars,
      at: now.subtract(Duration(days: daysAgo)),
      comment: comment,
      listingId: listingId,
    );
    return [
      rate('p-arif', 'p-tanvir', 5, 40, 'Book was exactly as described.'),
      rate('p-mahi', 'p-tanvir', 5, 25),
      rate(
        'p-rafi',
        'p-tanvir',
        4,
        12,
        'A bit late to the meetup, but a great copy.',
      ),
      rate(
        'p-sadia',
        'p-nabila',
        5,
        60,
        'Lovely seller, wrapped the book too!',
      ),
      rate('p-arif', 'p-nabila', 5, 33),
      rate('p-mahi', 'p-nabila', 5, 20, 'Quick replies and fair price.'),
      rate('p-rafi', 'p-nabila', 4, 8),
      rate('p-tanvir', 'p-rakib', 4, 30, 'Courier took a few days; book fine.'),
      rate('p-arif', 'p-talha', 5, 45, 'Packed well for the courier.'),
      rate('p-rafi', 'p-arif', 5, 15, 'Easy meetup at Mirpur 10.', 'p2p-2'),
      rate(
        'p-talha',
        P2pPeople.me,
        5,
        4,
        'Smooth buyer, paid the rider on time.',
        'p2p-5',
      ),
    ];
  }
}
