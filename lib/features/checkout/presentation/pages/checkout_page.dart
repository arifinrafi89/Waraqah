import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/book_providers.dart';
import '../../../../core/providers/profile_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/money.dart';
import '../../../../core/widgets/centered_content.dart';
import '../../../cart/domain/models/cart_item.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';
import '../../../cart/presentation/widgets/summary_line.dart';
import '../../../orders/domain/models/order.dart';
import '../../../orders/presentation/controllers/order_controller.dart';

const _gutter = 18.0;

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  PaymentMethod _paymentMethod = PaymentMethod.cashOnDelivery;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: ref.read(currentProfileProvider).fullName,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _placeOrder(List<CartItemTotal> lineItems, double total) {
    if (!_formKey.currentState!.validate()) return;

    final address =
        '${_nameController.text}, ${_addressController.text}, ${_cityController.text} '
        '— ${_phoneController.text}';

    placeOrder(
      ref,
      Order(
        id: '#WQ-${DateTime.now().millisecondsSinceEpoch % 10000}',
        placedAt: DateTime.now(),
        items: [for (final line in lineItems) line.item],
        total: total,
        status: OrderStatus.pending,
        paymentMethod: _paymentMethod,
        deliveryAddress: address,
      ),
    );
    clearCart(ref);

    context.goNamed('orders');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order placed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final cartItems = ref.watch(cartItemsProvider);
    final books = {for (final book in ref.watch(booksProvider)) book.id: book};

    final lineItems = [
      for (final item in cartItems)
        if (books[item.bookId] case final book?) CartItemTotal(item: item, book: book),
    ];
    final subtotal = ref.watch(cartSubtotalProvider);
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: const Text('Checkout')),
      body: SafeArea(
        bottom: false,
        child: CenteredContent(
          child: cartItems.isEmpty
              ? _EmptyCheckout(palette: palette)
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(_gutter, _gutter, _gutter, 8),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _SectionCard(
                                palette: palette,
                                title: 'Order summary',
                                child: _OrderSummary(
                                  lineItems: lineItems,
                                  subtotal: subtotal,
                                  total: total,
                                  palette: palette,
                                ),
                              ),
                              const SizedBox(height: 14),
                              _SectionCard(
                                palette: palette,
                                title: 'Delivery address',
                                child: _AddressForm(
                                  nameController: _nameController,
                                  phoneController: _phoneController,
                                  addressController: _addressController,
                                  cityController: _cityController,
                                ),
                              ),
                              const SizedBox(height: 14),
                              _SectionCard(
                                palette: palette,
                                title: 'Payment method',
                                child: _PaymentMethodPicker(
                                  selected: _paymentMethod,
                                  onChanged: (method) =>
                                      setState(() => _paymentMethod = method),
                                  palette: palette,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _BottomBar(
                      total: total,
                      palette: palette,
                      onPlaceOrder: () => _placeOrder(lineItems, total),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.palette, required this.title, required this.child});

  final AppPalette palette;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: palette.text,
            ),
          ),
          const SizedBox(height: 12),
          Material(type: MaterialType.transparency, child: child),
        ],
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  const _OrderSummary({
    required this.lineItems,
    required this.subtotal,
    required this.total,
    required this.palette,
  });

  final List<CartItemTotal> lineItems;
  final double subtotal;
  final double total;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final line in lineItems)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${line.book.title} × ${line.item.quantity}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: palette.textDim),
                  ),
                ),
                Text(
                  taka(line.lineTotal),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: palette.text),
                ),
              ],
            ),
          ),
        Divider(color: palette.border, height: 20),
        SummaryLine(label: 'Subtotal', value: taka(subtotal), palette: palette),
        const SizedBox(height: 4),
        SummaryLine(label: 'Delivery', value: taka(deliveryFee), palette: palette),
        const SizedBox(height: 4),
        SummaryLine(label: 'Total', value: taka(total), palette: palette, emphasize: true),
      ],
    );
  }
}

class _AddressForm extends StatelessWidget {
  const _AddressForm({
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.cityController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AddressField(label: 'Full name', controller: nameController),
        const SizedBox(height: 10),
        _AddressField(
          label: 'Phone',
          controller: phoneController,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 10),
        _AddressField(label: 'Address line', controller: addressController),
        const SizedBox(height: 10),
        _AddressField(label: 'City', controller: cityController),
      ],
    );
  }
}

class _AddressField extends StatelessWidget {
  const _AddressField({
    required this.label,
    required this.controller,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
      validator: (value) =>
          (value == null || value.trim().isEmpty) ? '$label is required' : null,
    );
  }
}

class _PaymentMethodPicker extends StatelessWidget {
  const _PaymentMethodPicker({
    required this.selected,
    required this.onChanged,
    required this.palette,
  });

  final PaymentMethod selected;
  final ValueChanged<PaymentMethod> onChanged;
  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<PaymentMethod>(
      groupValue: selected,
      onChanged: (value) => onChanged(value!),
      child: Column(
        children: [
          for (final method in PaymentMethod.values)
            RadioListTile<PaymentMethod>(
              value: method,
              title: Text(_labelFor(method), style: TextStyle(color: palette.text)),
              contentPadding: EdgeInsets.zero,
              dense: true,
            ),
          const SizedBox(height: 4),
          Text(
            'Payment is simulated for this demo.',
            style: TextStyle(fontSize: 11.5, color: palette.textFaint),
          ),
        ],
      ),
    );
  }

  String _labelFor(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.cashOnDelivery:
        return 'Cash on delivery';
      case PaymentMethod.bkash:
        return 'bKash';
      case PaymentMethod.card:
        return 'Card';
    }
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.total, required this.palette, required this.onPlaceOrder});

  final double total;
  final AppPalette palette;
  final VoidCallback onPlaceOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(_gutter, 14, _gutter, 14),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(top: BorderSide(color: palette.border)),
      ),
      child: Row(
        children: [
          Text(
            taka(total),
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: palette.text),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: SizedBox(
              height: 46,
              child: ElevatedButton(
                onPressed: onPlaceOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: palette.accent,
                  foregroundColor: palette.accentInk,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Place order',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyCheckout extends StatelessWidget {
  const _EmptyCheckout({required this.palette});

  final AppPalette palette;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_bag_outlined, size: 56, color: palette.textFaint),
          const SizedBox(height: 14),
          Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: palette.textDim),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () => context.go('/catalog'),
            style: ElevatedButton.styleFrom(
              backgroundColor: palette.accent,
              foregroundColor: palette.accentInk,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              'Browse catalog',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
