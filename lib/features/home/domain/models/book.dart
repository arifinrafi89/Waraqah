class Book {
  final String id;
  final String title;
  final String author;
  final String isbn;
  final String genre;
  final String coverUrl;
  final double price;
  final String currency;
  final bool isBeneficial;

  // Demo-only cross-vendor comparison fields (see docs/adr/0001).
  final String vendorName;
  final bool isBest;
  final double? originalPrice;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.isbn,
    required this.genre,
    required this.coverUrl,
    required this.price,
    required this.currency,
    required this.isBeneficial,
    required this.vendorName,
    this.isBest = false,
    this.originalPrice,
  });
}
