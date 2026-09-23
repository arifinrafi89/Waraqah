import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_surface.dart';
import '../controllers/book_detail_controller.dart';
import '../widgets/edition_selector.dart';

class BookDetailPage extends ConsumerWidget {
  final String bookId;

  const BookDetailPage({super.key, required this.bookId});

  Future<void> _launchPreview(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(bookDetailControllerProvider(bookId));
    final book = detailState.book;

    if (detailState.isLoading || book == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final selectedListing = detailState.selectedListing;

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title, style: AppTypography.h3),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: const Border(top: BorderSide(color: AppColors.borderLight)),
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price', style: AppTypography.bodySmall),
                Text(
                  selectedListing != null
                      ? selectedListing.formattedPrice
                      : 'Unavailable',
                  style: AppTypography.h2.copyWith(color: AppColors.primary),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 180,
              child: AppButton(
                text: 'Proceed to Checkout',
                onPressed: selectedListing == null
                    ? null
                    : () {
                        context.push(
                          '/checkout',
                          extra: {
                            'book': book,
                            'listing': selectedListing,
                          },
                        );
                      },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 130,
                  height: 190,
                  color: AppColors.surfaceSubtleLight,
                  child: book.thumbnailUrl != null
                      ? CachedNetworkImage(
                          imageUrl: book.thumbnailUrl!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.book, size: 48),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(book.title, style: AppTypography.h1),
            if (book.subtitle != null) ...[
              const SizedBox(height: 4),
              Text(book.subtitle!, style: AppTypography.bodyMedium),
            ],
            const SizedBox(height: 6),
            Text(
              'By ${book.authorsDisplay}',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondaryLight,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                if (book.averageRating != null) ...[
                  const Icon(Icons.star_rounded, color: AppColors.secondary, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '${book.averageRating!.toStringAsFixed(1)} Ratings',
                    style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (book.ratingsCount != null)
                    Text(' (${book.ratingsCount})', style: AppTypography.bodySmall),
                ],
                const Spacer(),
                if (book.previewLink != null)
                  TextButton.icon(
                    onPressed: () => _launchPreview(book.previewLink!),
                    icon: const Icon(Icons.menu_book, size: 16),
                    label: const Text('Google Preview'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            EditionSelector(
              listings: detailState.listings,
              selectedListing: selectedListing,
              onSelected: (l) =>
                  ref.read(bookDetailControllerProvider(bookId).notifier).selectListing(l),
            ),
            const SizedBox(height: 20),
            Text('About this book', style: AppTypography.h3),
            const SizedBox(height: 8),
            Text(
              book.description ?? 'No description available for this volume.',
              style: AppTypography.bodyMedium.copyWith(height: 1.6),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

