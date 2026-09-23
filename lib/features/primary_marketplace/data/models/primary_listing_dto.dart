import '../../domain/entities/primary_listing.dart';

class PrimaryListingDto {
  final String id;
  final String bookId;
  final String format;
  final double priceAmount;
  final String currency;
  final String priceSource;
  final String stockStatus;

  const PrimaryListingDto({
    required this.id,
    required this.bookId,
    required this.format,
    required this.priceAmount,
    this.currency = 'BDT',
    required this.priceSource,
    this.stockStatus = 'in_stock',
  });

  factory PrimaryListingDto.fromJson(Map<String, dynamic> json) {
    return PrimaryListingDto(
      id: json['id'] as String,
      bookId: json['book_id'] as String,
      format: json['format'] as String? ?? 'Paperback',
      priceAmount: (json['price_amount'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? 'BDT',
      priceSource: json['price_source'] as String? ?? 'mock',
      stockStatus: json['stock_status'] as String? ?? 'in_stock',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'book_id': bookId,
      'format': format,
      'price_amount': priceAmount,
      'currency': currency,
      'price_source': priceSource,
      'stock_status': stockStatus,
    };
  }

  PrimaryListing toDomain() {
    return PrimaryListing(
      id: id,
      bookId: bookId,
      format: format,
      priceAmount: priceAmount,
      currency: currency,
      priceSource: priceSource,
      stockStatus: stockStatus,
    );
  }
}

