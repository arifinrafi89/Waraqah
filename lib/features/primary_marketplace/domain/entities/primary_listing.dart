/// Entity representing a purchasable edition/format of a book.
class PrimaryListing {
  final String id;
  final String bookId;
  final String format; // 'Paperback', 'Hardcover', 'eBook'
  final double priceAmount;
  final String currency;
  final String priceSource; // 'google' or 'mock'
  final String stockStatus; // 'in_stock' or 'out_of_stock'

  const PrimaryListing({
    required this.id,
    required this.bookId,
    required this.format,
    required this.priceAmount,
    this.currency = 'BDT',
    required this.priceSource,
    this.stockStatus = 'in_stock',
  });

  bool get isMockPrice => priceSource.toLowerCase() == 'mock';
  bool get isInStock => stockStatus == 'in_stock';

  String get formattedPrice => '৳${priceAmount.toStringAsFixed(0)}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrimaryListing &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          bookId == other.bookId &&
          format == other.format;

  @override
  int get hashCode => id.hashCode ^ bookId.hashCode ^ format.hashCode;
}

