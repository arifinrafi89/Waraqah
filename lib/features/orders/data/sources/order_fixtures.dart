import '../../../../core/models/edition.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../../domain/entities/order_status.dart';
import '../models/order_model.dart';
import '../models/order_parts_model.dart';

/// Two past orders so the orders page isn't empty on a fresh start: one
/// delivered two days ago (a return can be asked for), one on its way as a
/// gift.
abstract final class OrderFixtures {
  static List<OrderModel> seed(DateTime now) => [
    _order(
      number: 'WQ-100201',
      placedAt: now.subtract(const Duration(days: 6)),
      steps: [0, 3, 24, 48, 96],
      payment: PaymentMethod.bkash,
      lines: const [
        OrderLineModel(
          bookId: 'bk-sapiens',
          title: 'Sapiens: A Brief History of Humankind',
          author: 'Yuval Noah Harari',
          quantity: 1,
          unitPriceBdt: 650,
          editionId: 'bk-sapiens-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
        ),
        OrderLineModel(
          bookId: 'bk-atomic',
          title: 'Atomic Habits',
          author: 'James Clear',
          quantity: 1,
          unitPriceBdt: 590,
          editionId: 'bk-atomic-pb-en',
          format: BookFormat.paperback,
          language: BookLanguage.english,
          coverSeed: 2,
        ),
      ],
    ),
    _order(
      number: 'WQ-100215',
      placedAt: now.subtract(const Duration(hours: 30)),
      steps: [0, 2, 20, 26],
      payment: PaymentMethod.cashOnDelivery,
      gift: const OrderGiftModel(
        recipientName: 'Nabila',
        message: 'Happy birthday! This one is for your shelf.',
      ),
      lines: const [
        OrderLineModel(
          bookId: 'bk-sapiens',
          title: 'Sapiens: A Brief History of Humankind',
          author: 'Yuval Noah Harari',
          quantity: 1,
          unitPriceBdt: 520,
          editionId: 'bk-sapiens-pb-bn',
          format: BookFormat.paperback,
          language: BookLanguage.bangla,
        ),
      ],
    ),
  ];

  /// [steps] are hours after [placedAt] at which each tracking step was
  /// reached, starting with "placed".
  static OrderModel _order({
    required String number,
    required DateTime placedAt,
    required List<int> steps,
    required PaymentMethod payment,
    required List<OrderLineModel> lines,
    OrderGiftModel? gift,
  }) {
    final subtotal = lines.fold(
      0,
      (sum, line) => sum + line.unitPriceBdt * line.quantity,
    );
    return OrderModel(
      number: number,
      placedAt: placedAt,
      status: OrderStatusX.steps[steps.length - 1],
      lines: lines,
      history: [
        for (var i = 0; i < steps.length; i++)
          StatusChangeModel(
            status: OrderStatusX.steps[i],
            at: placedAt.add(Duration(hours: steps[i])),
          ),
      ],
      addressLabel: 'Home',
      addressLine: 'House 12, Road 5, Dhanmondi, Dhaka',
      payment: payment,
      subtotalBdt: subtotal,
      deliveryFeeBdt: 60,
      discountBdt: 0,
      totalBdt: subtotal + 60,
      pointsEarned: subtotal ~/ 100,
      gift: gift,
    );
  }
}
