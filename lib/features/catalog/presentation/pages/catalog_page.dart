import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/widgets/book_filter_chip_row.dart';
import '../../../../core/widgets/responsive_book_grid.dart';
import '../../../../core/widgets/sort_menu_button.dart';
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(_gutter),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: BookFilterChipRow(filterProvider: catalogBookFilterProvider),
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
                  return _CatalogBookCard(book: book, chip: chip);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CatalogBookCard extends StatelessWidget {
  const _CatalogBookCard({required this.book, required this.chip});

  final Book book;
  final Color chip;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Container(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(color: chip),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    book.title,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 10, 11, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: palette.textFaint),
                ),
                const SizedBox(height: 5),
                Text(
                  '৳${book.price.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800, color: palette.text),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Add to cart', style: TextStyle(fontSize: 11)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
