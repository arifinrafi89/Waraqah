import 'package:dio/dio.dart';

import '../../../checkout/domain/entities/payment_method.dart';
// The fake backend keeps donations with the other orders.
import '../../../orders/data/sources/order_fake_store.dart';
import 'donate_fixtures.dart';
import 'donate_places_store.dart';
import 'donation_order.dart';

/// Donate's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`.
abstract final class DonateFakeApi {
  static const String recipients = '/donate/recipients';

  /// `?id=rc-aloghar`; answers the recipient or `null`.
  static const String recipient = '/donate/recipient';

  /// Body: `{recipientId, bookId, quantity, payment, note}`. Saves an order
  /// delivered free to the recipient and answers `{orderNumber, totalBdt}`;
  /// `null` for cash on delivery or more copies than they still need.
  static const String give = '/donate/give';

  static Map<String, Object? Function(RequestOptions)> routes(
    OrderFakeStore orders,
    DonatePlacesStore places,
  ) {
    final received = places.received;
    return {
      recipients: (_) => places.allJson(),
      recipient: (options) {
        final place = places.find(
          options.queryParameters['id'] as String? ?? '',
        );
        return place == null ? null : places.json(place);
      },
      give: (options) {
        final body = options.data as Map<String, dynamic>? ?? const {};
        final place = places.find(body['recipientId'] as String? ?? '');
        final bookId = body['bookId'] as String? ?? '';
        final quantity = body['quantity'] as int? ?? 0;
        final payment = PaymentMethod.values.byName(body['payment'] as String);
        final need = place?.needs
            .where((need) => need.$1 == bookId)
            .firstOrNull;
        final book = DonateFixtures.book(bookId);
        final edition = book == null
            ? null
            : DonateFixtures.printedEdition(book);
        final key = '${place?.id}/$bookId';
        final stillNeeded = (need?.$2 ?? 0) - (received[key] ?? 0);
        if (place == null || book == null || edition == null) return null;
        if (payment == PaymentMethod.cashOnDelivery) return null;
        if (quantity < 1 || quantity > stillNeeded) return null;
        final order = donationOrder(
          number: orders.nextNumber(),
          at: orders.now(),
          place: place,
          book: book,
          edition: edition,
          quantity: quantity,
          payment: payment,
          note: body['note'] as String? ?? '',
        );
        orders.add(order);
        received[key] = (received[key] ?? 0) + quantity;
        return {'orderNumber': order.number, 'totalBdt': order.totalBdt};
      },
    };
  }
}
