import '../../../cart/domain/models/cart_item.dart';
import '../../domain/models/order.dart';
import '../../domain/repositories/order_repository.dart';

class DummyOrderRepository implements OrderRepository {
  static final DateTime _now = DateTime(2026, 9, 21);

  static final List<Order> _seed = [
    Order(
      id: '#WQ-1042',
      placedAt: _now.subtract(const Duration(days: 2)),
      items: const [CartItem(bookId: 'book-4', quantity: 1)],
      total: 1260,
      status: OrderStatus.shipped,
      paymentMethod: PaymentMethod.bkash,
      deliveryAddress: 'Rahinur Bin Naushad, House 12, Road 4, Dhaka',
    ),
    Order(
      id: '#WQ-1031',
      placedAt: _now.subtract(const Duration(days: 9)),
      items: const [
        CartItem(bookId: 'book-1', quantity: 1),
        CartItem(bookId: 'book-3', quantity: 2),
      ],
      total: 1610,
      status: OrderStatus.delivered,
      paymentMethod: PaymentMethod.cashOnDelivery,
      deliveryAddress: 'Rahinur Bin Naushad, House 12, Road 4, Dhaka',
    ),
    Order(
      id: '#WQ-1018',
      placedAt: _now.subtract(const Duration(days: 21)),
      items: const [CartItem(bookId: 'book-2', quantity: 1)],
      total: 650,
      status: OrderStatus.cancelled,
      paymentMethod: PaymentMethod.card,
      deliveryAddress: 'Rahinur Bin Naushad, House 12, Road 4, Dhaka',
    ),
  ];

  final List<Order> _orders = [..._seed];

  @override
  List<Order> getOrders() => List.unmodifiable(_orders);

  @override
  List<Order> addOrder(Order order) {
    _orders.insert(0, order);
    return List.unmodifiable(_orders);
  }
}
