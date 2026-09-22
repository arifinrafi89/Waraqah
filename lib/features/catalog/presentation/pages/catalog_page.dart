import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/widgets/book_filter_chip_row.dart';
import '../../../../core/widgets/book_grid_card.dart';
import '../../../../core/widgets/responsive_book_grid.dart';
import '../../../../core/widgets/sort_menu_button.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';
import '../controllers/catalog_controller.dart';

const _gutter = 18.0;

class CatalogPage extends ConsumerWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final books = ref.watch(filteredCatalogBooksProvider);

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: const Text('Catalog')),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(_gutter, _gutter, _gutter, 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: BookFilterChipRow(
                      filterProvider: catalogBookFilterProvider,
                    ),
                  ),
                  SortMenuButton(sortProvider: catalogBookSortProvider),
                ],
              ),
              const SizedBox(height: 14),
              ResponsiveBookGrid(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  final chip = palette.chips[index % palette.chips.length];
                  return BookGridCard(
                    book: book,
                    chip: chip,
                    onTap: () => context.pushNamed(
                      'book-detail',
                      pathParameters: {'id': book.id},
                    ),
                    onAddToCart: () {
                      addToCart(ref, book.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart')),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
