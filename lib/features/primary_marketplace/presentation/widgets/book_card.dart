import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/book.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_surface.dart';
import '../controllers/catalog_controller.dart';

class BookCard extends ConsumerWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCard({
    super.key,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minPrice = ref.watch(bookMinPriceProvider(book.id));

    return AppSurface(
      padding: const EdgeInsets.all(12),
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 70,
              height: 100,
              color: AppColors.surfaceSubtleLight,
              child: book.thumbnailUrl != null
                  ? CachedNetworkImage(
                      imageUrl: book.thumbnailUrl!,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => const Icon(
                        Icons.book,
                        color: AppColors.textMutedLight,
                      ),
                    )
                  : const Icon(Icons.book, color: AppColors.textMutedLight),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.h3.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  book.authorsDisplay,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (book.averageRating != null) ...[
                      const Icon(Icons.star_rounded, size: 16, color: AppColors.secondary),
                      const SizedBox(width: 4),
                      Text(
                        book.averageRating!.toStringAsFixed(1),
                        style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w600),
                      ),
                      if (book.ratingsCount != null) ...[
                        const SizedBox(width: 2),
                        Text(
                          '(${book.ratingsCount})',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textMutedLight,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ],
                    const Spacer(),
                    if (minPrice != null)
                      Text(
                        'From ৳${minPrice.toStringAsFixed(0)}',
                        style: AppTypography.label.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

