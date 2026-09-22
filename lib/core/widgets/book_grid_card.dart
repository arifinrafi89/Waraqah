import 'package:flutter/material.dart';

import '../models/book.dart';
import '../theme/app_palette.dart';
import '../utils/money.dart';

/// Book cover + info card, shared by Home's New Books grid and Catalog.
class BookGridCard extends StatelessWidget {
  const BookGridCard({
    super.key,
    required this.book,
    required this.chip,
    this.onAddToCart,
    this.onTap,
  });

  final Book book;
  final Color chip;
  final VoidCallback? onAddToCart;
  final VoidCallback? onTap;

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
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [chip, Color.lerp(chip, Colors.black, 0.45)!],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.72),
                              Colors.transparent,
                            ],
                            stops: const [0, 0.6],
                          ),
                        ),
                      ),
                    ),
                    if (book.isBest)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: palette.bg,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                size: 9,
                                color: palette.accent,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                'Best',
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w800,
                                  color: palette.accent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 8,
                      child: Text(
                        book.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 12.5,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    book.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                      color: palette.textFaint,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    spacing: 6,
                    children: [
                      Text(
                        taka(book.price),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: palette.text,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                      if (book.originalPrice != null)
                        Text(
                          taka(book.originalPrice!),
                          style: TextStyle(
                            fontSize: 10.5,
                            color: palette.textFaint,
                            decoration: TextDecoration.lineThrough,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 34,
                    child: ElevatedButton(
                      onPressed: onAddToCart ?? () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: palette.accent,
                        foregroundColor: palette.accentInk,
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
