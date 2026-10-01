import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../checkout/domain/entities/payment_method.dart';
// The fake backend saves donations where the orders feature reads them.
import '../../../orders/data/models/order_model.dart';
import '../../../orders/data/models/order_parts_model.dart';
import '../../../orders/domain/entities/order_status.dart';
import 'donate_fixtures.dart';

/// The order the fake server saves for a donation: [quantity] copies of
/// [edition] to [place]'s address, free delivery, with the donor's note on
/// the card.
OrderModel donationOrder({
  required String number,
  required DateTime at,
  required DonatePlace place,
  required Book book,
  required Edition edition,
  required int quantity,
  required PaymentMethod payment,
  required String note,
}) {
  final total = edition.priceBdt * quantity;
  return OrderModel(
    number: number,
    placedAt: at,
    status: OrderStatus.placed,
    lines: [
      OrderLineModel(
        bookId: book.id,
        title: book.title,
        author: book.author,
        quantity: quantity,
        unitPriceBdt: edition.priceBdt,
        format: edition.format,
        language: edition.language,
        coverSeed: book.coverSeed,
        editionId: edition.id,
      ),
    ],
    history: [StatusChangeModel(status: OrderStatus.placed, at: at)],
    addressLabel: place.name,
    addressLine: '${place.area}, ${place.district}',
    payment: payment,
    subtotalBdt: total,
    deliveryFeeBdt: 0,
    discountBdt: 0,
    totalBdt: total,
    gift: OrderGiftModel(recipientName: place.name, message: note),
    isDonation: true,
  );
}
