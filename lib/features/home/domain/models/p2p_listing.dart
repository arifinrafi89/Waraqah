enum P2pCondition { likeNew, good, fair }

enum P2pStatus { available, reserved, sold }

class P2pListing {
  final String id;
  final String sellerId;
  final String? bookId;
  final P2pCondition condition;
  final double price;
  final List<String> photoUrls;
  final P2pStatus status;

  const P2pListing({
    required this.id,
    required this.sellerId,
    this.bookId,
    required this.condition,
    required this.price,
    this.photoUrls = const [],
    required this.status,
  });
}
