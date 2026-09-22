import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/providers/book_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/money.dart';
import '../../../../core/widgets/centered_content.dart';
import '../../domain/models/cart_item.dart';
import '../controllers/cart_controller.dart';
import '../widgets/cart_row.dart';
import '../widgets/summary_line.dart';

const _gutter = 18.0;

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final items = ref.watch(cartItemsProvider);
    final books = {for (final book in ref.watch(booksProvider)) book.id: book};

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: const Text('Cart')),
      body: SafeArea(
        bottom: false,
        child: CenteredContent(
          child: items.isEmpty
              ? _EmptyCart(palette: palette)
              : _CartBody(items: items, books: books, palette: palette),
        ),
      ),
    );
  }
}

class _CartBody extends ConsumerWidget {
  const _CartBody({required this.items, required this.books, required this.palette});

  final List<CartItem> items;
  final Map<String, Book> books;
  final AppPalette palette;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subtotal = ref.watch(cartSubtotalProvider);
    final total = ref.watch(cartTotalProvider);

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(_gutter, _gutter, _gutter, 8),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final item = items[index];
              final book = books[item.bookId];
              if (book == null) return const SizedBox.shrink();
              final chip = palette.chips[index % palette.chips.length];
              return CartRow(
                book: book,
                chip: chip,
                quantity: item.quantity,
                onQuantityChanged: (qty) => setQuantity(ref, item.bookId, qty),
                onRemove: () => removeFromCart(ref, item.bookId),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(_gutter, 14, _gutter, 14),
          decoration: BoxDecoration(
            color: palette.surface,
            border: Border(top: BorderSide(color: palette.border)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SummaryLine(label: 'Subtotal', value: taka(subtotal), palette: palette),
              const SizedBox(height: 4),
              SummaryLine(label: 'Delivery', value: taka(deliveryFee), palette: palette),
              const SizedBox(height: 4),
              SummaryLine(
                label: 'Total',
                value: taka(total),
                palette: palette,
                emphasize: true,
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: items.isEmpty ? null : () => context.push('/checkout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: palette.accent,
                    foregroundColor: palette.accentInk,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Proceed to checkout',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart({required this.palette});

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
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: palette.textDim,
            ),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () => context.go('/catalog'),
            style: ElevatedButton.styleFrom(
              backgroundColor: palette.accent,
              foregroundColor: palette.accentInk,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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
