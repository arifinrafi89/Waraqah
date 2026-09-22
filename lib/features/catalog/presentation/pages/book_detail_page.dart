import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/providers/book_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/widgets/async_value_view.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';

/// Book detail page for a single `/catalog/book/:id` entry, reusing the
/// existing `Book` model and `booksProvider` — no new domain concepts.
class BookDetailPage extends ConsumerWidget {
  const BookDetailPage({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final books = ref.watch(booksProvider);

    return AsyncValueView(
      value: books,
      data: (books) => _BookDetailBody(
        palette: palette,
        book: books.where((b) => b.id == bookId).firstOrNull,
      ),
    );
  }
}

class _BookDetailBody extends ConsumerWidget {
  const _BookDetailBody({required this.palette, required this.book});

  final AppPalette palette;
  final Book? book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = this.book;
    if (book == null) {
      return Scaffold(
        backgroundColor: palette.bg,
        appBar: AppBar(title: const Text('Book')),
        body: Center(
          child: Text(
            'Book not found',
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(color: palette.textDim),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: Text(book.title)),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2 / 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        palette.accent,
                        Color.lerp(palette.accent, Colors.black, 0.45)!,
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                book.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: palette.text,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                book.author,
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(color: palette.textFaint),
              ),
              const SizedBox(height: 14),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: 8,
                children: [
                  Text(
                    '৳${book.price.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: palette.text,
                    ),
                  ),
                  if (book.originalPrice != null)
                    Text(
                      '৳${book.originalPrice!.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: palette.textFaint,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                book.genre,
                style: Theme.of(context).textTheme.bodyLarge
                    ?.copyWith(color: palette.textDim),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(cartItemsProvider.notifier).add(book.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: palette.accent,
                    foregroundColor: palette.accentInk,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
